package com.ingeunjumin.project.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

public class AuthVO implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	private UsersVO usersVO;
	
	public AuthVO(UsersVO usersVO) {
		this.usersVO = usersVO;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(usersVO.getAuth()));
		return authorities;
	}

	@Override
	public String getPassword() {
		return usersVO.getUserPassword();
	}

	@Override
	public String getUsername() {
		return usersVO.getUserName();
	}

	public String getAuth() { 
		return usersVO.getAuth(); 
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
