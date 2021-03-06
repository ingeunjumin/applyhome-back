package com.ingeunjumin.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

@Mapper
public interface UsersMapper {
	
	
	/**
		 * @Method Name : selectUserInfo
		 * @return : UsersVO
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 24.
		 * @upDate : 
		 *comment : 특정 사용자 조회
		 */
	public UsersVO selectUserInfo(@Param("userId") String userId);
	
	
	/**
	 * @param userId
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 6. 25.
	 * comment : 특정 사용자 권한 조회
	 */
	public List<AuthorityVO> selectUserAuth(@Param("userId") String userId);
	
	/**
		 * @Method Name : selectUsersAll
		 * @return : List<Map<String,Object>>
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 24.
		 * @upDate : 
		 *comment : 전체 사용자 조회
		 */
	public List<UsersVO> selectUsersAll();
	
	/**
		 * @Method Name : insertUsers
		 * @return : int
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 24.
		 * @upDate : 
		 *comment : 사용자 저장
		 */
	public int insertUser(UsersVO usersVO);
	
	/**
		 * @Method Name : deleteUsers
		 * @return : int
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 24.
		 * @upDate : 
		 *comment : 사용자 삭제
		 */
	public int deleteUser(@Param("userNo") int userNo);
	
	/**
		 * @Method Name : updateUsers
		 * @return : int
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 24.
		 * @upDate : 
		 *comment : 사용자 수정
		 */
	public int updateUser(@RequestBody UsersVO userVo);
	
	
	/**
		 * @Method Name : selectUsersNo
		 * @return : UsersVO
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 29.
		 * @upDate : 
		 *comment : 특정 계정 조회
		 */
	public UsersVO selectUserNo(@Param("userNo") int userNo);
	
	
	/**
		 * @Method Name : selectSearchUsers
		 * @return : List<Map<String,Object>>
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 30.
		 * @upDate : 
		 *comment : search users
		 */
	public List<Map<String, Object>> selectSearchUsers(String search);
	
	/**
	 * @param userNo
	 * @param roleId
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 7. 7.
	 * comment : 사용자 권한 주기
	 */
	public int insertAuth(@Param("userNo") int userNo, @Param("roleId") int roleId);


}
