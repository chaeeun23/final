package com.gd.finalproject.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
public class KakaoProfile {
    private Long id;
    private Properties properties;
    private KakaoAccount kakao_account;

    @Getter
    @ToString
    public static class KakaoAccount{
        private String email;
        private String birthday;
        private boolean birthday_needs_agreement;
    }

    @Getter
    @ToString
    public static class Properties{
        private String nickname;
        private String profile_image;
        private String thumbnail_image;
    }
}
