package com.ingeunjumin.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.ingeunjumin.project.mapper.UsersMapper;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

@Service
@Component
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
	
	public List<Map<String,Object>> getUsersAllList(int pageNum,int pageSize) {
		
		PageHelper.startPage(pageNum, pageSize);
		
		return usersMapper.selectUsersAll();
	}
	
	public List<AuthorityVO> getAuth(String userId){
		return usersMapper.selectUserAuth(userId);
	}
	
	public UsersVO getSelecteUserNo(int usersNo) {
		return usersMapper.selectUserNo(usersNo);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	public int getUpdateUser(UsersVO vo) {
		String password = vo.getUserPassword();
		password = passwordEncoder.encode(password);
		vo.setUserPassword(password);
		return usersMapper.updateUser(vo);
	}
	
	public List<Map<String, Object>> getSelectSearchUsers(String search,int pageNum,int pageSize){
		
		PageHelper.startPage(pageNum, pageSize);
		
		return usersMapper.selectSearchUsers(search);
	}
	
    @Scheduled(cron="0 29 * * * *")
    public void test2() {
        System.out.println("@Scheduled annotation : 1분에 1번씩 console 찍기");
        System.out.println("쉬는시간이다!!!!!!!!!!!!!!!!!");
    }
	
}
