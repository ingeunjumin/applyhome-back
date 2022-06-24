package com.ingeunjumin.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ingeunjumin.project.mapper.UsersMapper;
import com.ingeunjumin.project.vo.AuthVO;
import com.ingeunjumin.project.vo.UsersVO;

@Service
public class AuthService implements UserDetailsService{

	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		UsersVO userVO  = usersMapper.selectUserInfo(userId);
		
		if(userVO == null) throw new UsernameNotFoundException("User Not Found");
         
		return new AuthVO(userVO);
	}

	public int setUser(UsersVO usersVO) {
		String password = usersVO.getUserPassword(); // 파라미터값 비밀번호 get
		password = passwordEncoder.encode(password); // 암호화
		usersVO.setUserPassword(password); // 암호화된 패스워드 set
		return usersMapper.insertUser(usersVO);
	}
	
	public List<Map<String,Object>> getUsersAllList() {
		System.out.println(usersMapper.selectUsersAll());
		return usersMapper.selectUsersAll();
	}

}