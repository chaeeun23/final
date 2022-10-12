package com.gd.finalproject.config;


import com.gd.finalproject.secrity.handler.KakaoLoginSucHandler;
import com.gd.finalproject.secrity.handler.LoginFailHandler;
import com.gd.finalproject.secrity.handler.LoginSucHandler;
import com.gd.finalproject.secrity.provider.LoginAuthProvider;
import com.gd.finalproject.service.OAuth2Service;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@RequiredArgsConstructor
@Order
public class SecurityConfig {

    private final OAuth2Service oAuth2Service;
    private final LoginFailHandler loginFailHandler;
    private final LoginSucHandler loginSucHandler;
    private final KakaoLoginSucHandler kakaoLoginSucHandler;
    private final LoginAuthProvider loginAuthProvider;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .authenticationProvider(loginAuthProvider)
                // 요청 url 권한관련
                .authorizeRequests(auth -> auth
                                .antMatchers("/mainImg/**").permitAll()
                                .antMatchers("/memberImg/**").permitAll()
                                .antMatchers("/resources/**").permitAll()
                                .antMatchers("/resource/**").permitAll()
                                .antMatchers("/anonymous/**").anonymous()
                                .antMatchers("/admin/**").hasAuthority("ADMIN")
                                .antMatchers("/member/**").hasAuthority("USER")
                     .antMatchers("/**").permitAll()
//                                .anyRequest().authenticated()
//                                .antMatchers("/home").permitAll()// 그외 모든 요청 인증 되어야 한다
                        //        .antMatchers("/**").permitAll() // 임시로 모든 권한 오픈
                        /*.antMatchers("/resources/**").permitAll() // 리소스 허용
                        .antMatchers("/resource/**").permitAll() // 리소스 허용
                        .antMatchers("/home").permitAll()
                        .antMatchers("/강사/**").hasAnyAuthority("TEACHER", "ADMIN")*/)
                // 로그인 관련
                .formLogin(form -> form
                        .loginPage("/anonymous/login-form") // 로그인페이지 주소
                        .loginProcessingUrl("/anonymous/login") // 로그인 검증할 url
                        .successHandler(loginSucHandler)
                        .failureHandler(loginFailHandler) // 실패시 이동할 url
                      )
                // 카카오 로그인 관련
                .oauth2Login(oauth -> oauth.loginPage("/anonymous/login-form")
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
                        .expiredUrl("/anonymous/login-form")
                )
                .cors().and()
                // csrf란
                // 사이트 간 요청 위조(Cross-Site Request Forgery)
                // 인터넷 사용자(희생자)가 자신의 의지와는 무관하게 공격자가 의도한 행위(등록, 수정, 삭제 등)를 특정 웹사이트에 요청하도록 만드는 공격
                // 스프링에서는 POST,PUT,DELETE 등 GET을 제외한 서버에서 토큰을 발급하여 토큰이 일치할 경우만 요청을 승낙한다
                // <sec:csrfInput/> 를 폼안에 이용하면 쉽게 토큰검증을 진행할 수 있다. ex) <input type="hidden" name="_csrf" value="a2ed13cc-4598-4263-a584-fecef684a0fa">
                // .csrf().csrfTokenRepository(new CookieCsrfTokenRepository())
                .csrf().disable()
                .build();
    }


  /*  @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        // 인증할때 어떤 객체랑 패스워드 엔코더 쓸껀지
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(memberService);
        authProvider.setPasswordEncoder(passwordEncoder);
        return authProvider;
    }*/

}
