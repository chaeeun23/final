package com.gd.finalproject.service;


import com.gd.finalproject.mapper.MemberImgMapper;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.MemberForm;
import com.gd.finalproject.vo.MemberImg;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gd.finalproject.vo.MemberDto;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MemberService implements UserDetailsService {
    private final MemberMapper memberMapper;
    private final PasswordEncoder bCryptPasswordEncoder;
    private final ResourceLoader resourceLoader;
    private final MemberImgMapper memberImgMapper ;


    public String idCheck(String id) {
        return memberMapper.idCheck(id);
    }

    @Transactional
    public int signMember(MemberDto memberDto) {
        int result = 0;
        String encodePw = bCryptPasswordEncoder.encode(memberDto.getMemberPw());
        memberDto.setMemberPw(encodePw);
        // 가입하기
        result += memberMapper.signMember(memberDto);
        // 권한넣기
        result += memberMapper.authInsert(memberDto);
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
        if (memberDto.getMemberAuth().contains("ADMIN")) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        return memberDto;
    }

    public MemberDto memberDetail(int memberNo) {
        return memberMapper.memberDetail(memberNo);
    }

    @Transactional
    public void updateMember(MemberForm memberForm) {
        int row = memberMapper.memberUpdate(memberForm.getMemberDto());

        if (memberForm.getMultiList() != null) {
            for (MultipartFile mf : memberForm.getMultiList()) {
                MemberImg memberImg = new MemberImg();
                memberImg.setMemberId(memberForm.getMemberDto().getMemberId());
                memberImg.setOriginalFileName(mf.getOriginalFilename());
                memberImg.setFileType(mf.getContentType());
                memberImg.setFileSize(mf.getSize());

                String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
                String fileName = UUID.randomUUID().toString().replace("-", "") + ext;

                // 리소스는 현재 프로젝트 경로 가져와주기
                Resource resource = resourceLoader.getResource("/mainImg/upload");
                Path path = null;
                try {
                    path = Paths.get(resource.getURI());
                } catch (IOException e) {
                    e.printStackTrace();
                }
                memberImg.setFileName("/mainImg/upload/" + fileName);

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
    }






}
