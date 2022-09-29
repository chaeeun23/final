package com.gd.finalproject.config;


import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.service.OAuth2Service;
import com.gd.finalproject.service.handler.KakaoLoginSucHandler;
import com.gd.finalproject.service.handler.LoginFailHandler;
import com.gd.finalproject.service.handler.LoginSucHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@RequiredArgsConstructor
@Order(Ordered.HIGHEST_PRECEDENCE)
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    private final MemberService memberService;
    private final PasswordEncoder passwordEncoder;
    private final OAuth2Service oAuth2Service;
    private final LoginFailHandler loginFailHandler;
    private final LoginSucHandler loginSucHandler;
    private final KakaoLoginSucHandler kakaoLoginSucHandler;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .authenticationProvider(authenticationProvider())
                // 요청 url 권한관련
                .authorizeRequests(auth -> auth
                                .antMatchers("/mainImg/**").permitAll()
                                .antMatchers("/memberImg/**").permitAll()
                                .antMatchers("/resources/**").permitAll()
                                .antMatchers("/resource/**").permitAll()
                                .antMatchers("/sign/**").anonymous()
                                .antMatchers("/**").permitAll()
                        // .anyRequest().authenticated() // 그외 모든 요청 인증 되어야 한다
                        //        .antMatchers("/**").permitAll() // 임시로 모든 권한 오픈
                        /*.antMatchers("/resources/**").permitAll() // 리소스 허용
                        .antMatchers("/resource/**").permitAll() // 리소스 허용
                        .antMatchers("/home").hasAnyAuthority("USER", "ADMIN", "TEACHER")
                        .antMatchers("/강사/**").hasAnyAuthority("TEACHER", "ADMIN")*/)
                // 로그인 관련
                .formLogin(form -> form
                        .loginPage("/member/login-form") // 로그인페이지 주소
                        .loginProcessingUrl("/member/login") // 로그인 검증할 url
                        .successHandler(loginSucHandler)
                        .failureHandler(loginFailHandler) // 실패시 이동할 url
                        .permitAll())
                // 카카오 로그인 관련
                .oauth2Login(oauth -> oauth.loginPage("/member/login-form")
                        .successHandler(kakaoLoginSucHandler)
                        .userInfoEndpoint() // 로그인 성공 후 사용자정보를 가져온다
                        .userService(oAuth2Service)) //사용자정보를 처리할 때 사용
                // 로그아웃 관련 옵션
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .logoutSuccessUrl("/")
                        .invalidateHttpSession(true))
                .exceptionHandling().accessDeniedPage("/")
                .and()
                // 세션 관련 옵션
                .sessionManagement(session -> session
                        .maximumSessions(5) // 최대 허용 세션 수
                        .maxSessionsPreventsLogin(false)
                        .expiredUrl("/member/login-form")
                )
                .csrf().disable()
                .build();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        // 인증할때 어떤 객체랑 패스워드 엔코더 쓸껀지
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(memberService);
        authProvider.setPasswordEncoder(passwordEncoder);
        return authProvider;
    }

}
