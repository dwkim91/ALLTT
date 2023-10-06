package com.app.alltt.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
    @Autowired
    private CustomAuthenticationEntryPoint customAuthenticationEntryPoint;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
	    http
	        .authorizeRequests()
	        	.antMatchers("/community", "/support/inquiry", "/member").hasAnyRole("USER", "ADMIN")
	            .antMatchers("/**").permitAll()
	            .and()
	        .formLogin()
	            .loginPage("/login")
	            .permitAll()
	            .and()
	        .logout()
	            .logoutUrl("/member/logout")
	            .permitAll()
	            .and()
            .exceptionHandling()
            	.authenticationEntryPoint(customAuthenticationEntryPoint)
            	.accessDeniedPage("/login")
            .and()
            	.csrf().disable();
	}
	
}