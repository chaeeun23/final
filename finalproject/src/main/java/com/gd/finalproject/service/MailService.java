package com.gd.finalproject.service;

import com.gd.finalproject.mapper.MemberMapper;
import com.nimbusds.oauth2.sdk.auth.Secret;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@RequiredArgsConstructor
public class MailService {

    @Value("${spring.mail.username}")
    String username;

    private final JavaMailSender javaMailSender;
    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    public String mailCheck(String email) throws Exception {
        if (isValidEmail(email)) {
            // 랜덤 6자리 아무거나
            String code = UUID.randomUUID().toString().substring(0, 6);
            MimeMessage message = javaMailSender.createMimeMessage();
            message.addRecipients(Message.RecipientType.TO, email);
            message.setSubject("사회체육센터 인증 번호입니다.");
            message.setText("반값습니다! 이메일 인증코드: " + code, "utf-8");
            message.setFrom(new InternetAddress(username));
            javaMailSender.send(message);
            return code;
        }
        return "fail";
    }

    public String idFind(String email) throws Exception {
        if (isValidEmail(email)) {
            List<String> idList = memberMapper.idFind(email);
            if (idList.size() == 0) {
                return "fail";
            }
            MimeMessage message = javaMailSender.createMimeMessage();
            message.addRecipients(Message.RecipientType.TO, email);
            message.setSubject("사회체육센터 가입한 아이디입니다.");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("아이디 목록\n");
            for (String id : idList) {
                // 앞 3자리 짤라서 *표 처리
                String change = id.substring(2);
                stringBuilder.append("**" + change + "\n");
            }
            message.setText(stringBuilder.toString(), "utf-8");
            message.setFrom(new InternetAddress(username));
            javaMailSender.send(message);
            return "suc";
        }
        return "fail";
    }

    // 메일 유효성 검사
    private static boolean isValidEmail(String email) {
        boolean err = false;
        String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(email);
        if (m.matches()) {
            err = true;
        }
        return err;
    }


    public String pwFind(String id, String email) throws Exception {
        String findId = memberMapper.pwFind(id, email);
        if (findId == null || !isValidEmail(email)) {
            return "fail";
        }
        String code = UUID.randomUUID().toString();
        String encode = passwordEncoder.encode(code);
        memberMapper.pwChange(id, email, encode);
        MimeMessage message = javaMailSender.createMimeMessage();
        message.addRecipients(Message.RecipientType.TO, email);
        message.setSubject("사회체육센터 변경된 임시비밀번호입니다.");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("임시비밀번호 : " + code + "\n");
        stringBuilder.append("반드시 비밀번호를 수정해주세요.");
        message.setText(stringBuilder.toString(), "utf-8");
        message.setFrom(new InternetAddress(username));
        javaMailSender.send(message);
        return "suc";
    }

}
