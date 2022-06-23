package com.ingeunjumin.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ingeunjumin.project.service.AuthService;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AuthController {
	
	@Autowired
	private AuthService authService;
	
	@GetMapping("/login")
	public String loadLoginPage() {
		log.info("[ Call /login - GET ]"); // ??? : 
		return "login";
	}
	
	@PostMapping("/join")
	public @ResponseBody int callJoin(@RequestBody UsersVO usersVO) {
		return authService.setUser(usersVO);
	}
}
