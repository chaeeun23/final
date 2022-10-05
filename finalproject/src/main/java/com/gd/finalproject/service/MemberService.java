package com.gd.finalproject.service;


import com.gd.finalproject.mapper.MemberImgMapper;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.Instructor;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.MemberForm;
import com.gd.finalproject.vo.MemberImg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService implements UserDetailsService {
    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;
    private final MemberImgMapper memberImgMapper;
    private final ServletContext servletContext;

    @Transactional
    public String pwUpdate(String id, String pw, String changePw) {
        // select db
        // 이미 로그인된 상태이니까 세션에서 id 가져와서 입력한 pw랑 id에 일치하는 db 비밀번호랑 비교
        MemberDto memberDto = memberMapper.getMember(id);
        // 일치하지 않는다면
        if (!passwordEncoder.matches(pw, memberDto.getPassword())) {
            return "fail";
        }
        // 바뀐 비밀번호 암호화 해줌
        String encode = passwordEncoder.encode(changePw);
        // 바뀐 비밀번호로 아이디에 맞는 녀석한테 업데이트 해줘야지
        memberMapper.insertChangePw(id, encode);
        memberMapper.pwChangeDateUpdate(id);
        return "suc";
    }


    public String idCheck(String id) {
        return memberMapper.idCheck(id);
    }

    @Transactional
    public int signMember(MemberDto memberDto) {
        int result = 0;
        String encodePw = passwordEncoder.encode(memberDto.getMemberPw());
        memberDto.setMemberPw(encodePw);
        // 가입하기
        result += memberMapper.signMember(memberDto);
        // 권한넣기
        result += memberMapper.authInsert(memberDto);
        //user 테이블에 추가
        result += memberMapper.userInsert(memberDto);

        return result;
    }

    @Override
    public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
        MemberDto memberDto = memberMapper.getMember(memberId);
        if (memberDto == null) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        // 권한 ADMIN 아니면 쳐버리기
        /*if (memberDto.getMemberAuth().contains("ADMIN")) {
            throw new UsernameNotFoundException("User not authorized.");
        }*/
        return memberDto;
    }

    public MemberDto memberDetail(int memberNo) {
        return memberMapper.memberDetail(memberNo);
    }

    @Transactional
    public void updateMember(MemberForm memberForm) {
        MultipartFile mf = memberForm.getFile();
        memberMapper.memberUpdate(memberForm.getMemberDto());
        if (mf.getSize() > 0) {
            MemberImg memberImg = MemberImg.builder()
                    .memberId(memberForm.getMemberDto().getMemberId())
                    .originalFileName(mf.getOriginalFilename())
                    .fileType(mf.getContentType())
                    .fileSize(mf.getSize())
                    .build();

            String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
            String fileName = UUID.randomUUID().toString().replace("-", "") + ext;

            // 리소스는 현재 프로젝트 경로 가져와주기

            Path path = null;
            try {
                String realPath = servletContext.getRealPath("/memberUpload");
                path = Paths.get(realPath);
                if (!Files.exists(path)) {
                    Files.createDirectories(path);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            // 컨텍스트 path 가져오기
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            String contextPath = attr.getRequest().getContextPath();

            memberImg.setFileName(contextPath + "/memberUpload/" + fileName);

            // 파일 객체 전달해서 파일정보 insert
            memberImgMapper.updateMemberImg(memberImg);

            try {
                mf.transferTo(new File(path + "/" + fileName));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException();    // 트랜잭션 처리가 되도록 강제로 Runtime 예외(try 절을 강요하지 않는)발생
            }
        }

    }


    @Transactional
    public int instructorApplication(Instructor instructor) {
        int row = memberMapper.instructorApplication(instructor);
        memberMapper.inspectAuthInsert(instructor);
        return row;
    }


    public boolean pwChangeDateCheck(LocalDateTime pwChangeDate) {
        LocalDateTime minusDays = LocalDateTime.now().minusMonths(3).minusDays(1);
        return minusDays.isAfter(pwChangeDate);
    }

    public void pwChangeUpdate(String memberId) {
        memberMapper.pwChangeDateUpdate(memberId);
    }

    @Transactional
    public String sleepUpdate(String memberId, String username) {
        // select db
        // 이미 로그인된 상태이니까 세션에서 id 가져와서 입력한 pw랑 id에 일치하는 db 비밀번호랑 비교
        MemberDto memberDto = memberMapper.getMember(memberId);
        if (memberDto == null || !memberId.equals(username)) {
            return "fail";
        }
        memberMapper.sleepMemberChange(memberId);
        return "ok";

    }


    @Transactional
    public String memberDeleteYn(String pw, String memberId) {
        MemberDto memberDto = memberMapper.getMember(memberId);
        // 일치하지 않는다면
        if (!passwordEncoder.matches(pw, memberDto.getPassword())) {
            return "fail";
        }
        memberMapper.deleteMemberYn(memberId);
        return "suc";
    }
}
