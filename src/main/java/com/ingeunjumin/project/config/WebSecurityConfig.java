package com.ingeunjumin.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.ingeunjumin.project.service.AuthService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
    private AuthService authService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth)throws Exception {
		auth.userDetailsService(authService).passwordEncoder(passwordEncoder());
	}

	@Override
	public void configure(WebSecurity web) {
		web.ignoring().antMatchers("/resources/static/*/**");
	}
	
	@Override
	// HTTP 시큐리티 관련 보안 설정
    protected void configure(HttpSecurity http) throws Exception{
		 http
		 .authorizeRequests().antMatchers("/resources/static/*/**","/login","/join").permitAll()//security 대상에서 제외
		 .anyRequest().authenticated();
		 http
		 .csrf().disable();//CSRF 기능 off
		 http
		 .formLogin().loginPage("/login")
		 .usernameParameter("userId")
		 .passwordParameter("userPassword")
		 .defaultSuccessUrl("/home"); //로그인 성공시 이동할 경로
		 http
		 .logout()
		 .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //로그아웃 경로
		 .deleteCookies("JSESSIONID") //쿠키 제거
         .invalidateHttpSession(true) //로그아웃시 세션 제거
         .clearAuthentication(true) //권한정보 제거
         .permitAll();
		 http
		 .exceptionHandling()
		 .accessDeniedPage("/access-denied"); //권한없는유저가 요청시 접속할 경로
	}
	
}
