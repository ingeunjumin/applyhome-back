package com.ingeunjumin.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ingeunjumin.project.mapper.UsersMapper;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

@Service
public class UserService {
	
	@Autowired
	private PasswordEncoder passwordEncoder; 
	@Autowired
	private UsersMapper usersMapper;
	
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
	
	public List<AuthorityVO> getAuth(String userId){
		return usersMapper.selectUserAuth(userId);
	}
	
	public UsersVO getSelecteUserNo(int usersNo) {
		return usersMapper.selectUserNo(usersNo);
	}
	
}
