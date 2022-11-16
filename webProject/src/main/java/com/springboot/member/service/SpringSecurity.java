package com.springboot.member.service;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SpringSecurity extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http
        .csrf().disable() 
        .cors().disable()
        .formLogin().disable() //기본 로그인 페이지 없애기
        .headers().frameOptions().disable();
}


@Bean
public PasswordEncoder encoder() {
    return new BCryptPasswordEncoder();
}
}
	