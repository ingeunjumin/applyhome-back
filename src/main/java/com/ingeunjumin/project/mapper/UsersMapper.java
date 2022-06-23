package com.ingeunjumin.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ingeunjumin.project.vo.UsersVO;

@Mapper
public interface UsersMapper {
	
	public int insertUsers(UsersVO usersVO);
	public UsersVO selectUserInfo(@Param("userId") String userId);
}
