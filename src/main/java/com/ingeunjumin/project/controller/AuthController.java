package com.ingeunjumin.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String loadLoginPage() {
		log.info("[ Call /login - GET ]"); // ??? : 
		return "login";
	}
	
	@GetMapping("/usersAll")
	public List<Map<String, Object>> callUsersAll(){
		return userService.getUsersAllList();
	}
	
	@PostMapping("/join")
	public @ResponseBody int callJoin(@RequestBody UsersVO usersVO) {
		return userService.setUser(usersVO);
	}
	
}
