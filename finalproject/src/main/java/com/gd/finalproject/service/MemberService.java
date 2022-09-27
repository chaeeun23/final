package com.gd.finalproject.service;


import com.gd.finalproject.mapper.MemberImgMapper;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.MemberForm;

import com.gd.finalproject.vo.MemberImg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gd.finalproject.vo.MemberDto;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService implements UserDetailsService {
    private final MemberMapper memberMapper;
    private final PasswordEncoder bCryptPasswordEncoder;
    private final ResourceLoader resourceLoader;
    private final MemberImgMapper memberImgMapper;
    private final ServletContext servletContext;


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
        if (memberDto.getMemberAuth().contains("ADMIN")) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        return memberDto;
    }

    public MemberDto memberDetail(int memberNo) {
        return memberMapper.memberDetail(memberNo);
    }

    @Transactional
    public void updateMember(MemberForm memberForm, Authentication authentication) {
        MultipartFile mf = memberForm.getFile();
        memberMapper.memberUpdate(memberForm.getMemberDto());
        System.out.println("mf = " + mf);
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
        // 2-2. 현재 Authentication로 사용자 인증 후 새 Authentication 정보를 SecurityContextHolder에 세팅
        SecurityContextHolder.getContext().setAuthentication(
                createNewAuthentication(authentication, memberForm.getMemberDto().getMemberId()));
    }

    // 정보 수정시 세션 객체 변경
    protected Authentication createNewAuthentication(Authentication currentAuth, String username) {
        UserDetails newPrincipal = loadUserByUsername(username);
        UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(
                newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
        newAuth.setDetails(currentAuth.getDetails());
        return newAuth;
    }
}
