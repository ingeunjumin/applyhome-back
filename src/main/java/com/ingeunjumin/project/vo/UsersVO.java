package com.ingeunjumin.project.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsersVO {
	private int userNo;
	private String userId;
	private String userPassword;
	private String userName;
	private String phone;
	private String email;
	private String auth; //사용자가 가지고 있는 권한
	private String createAt;
}
