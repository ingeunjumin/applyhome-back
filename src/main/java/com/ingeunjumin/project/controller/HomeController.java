package com.ingeunjumin.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@Autowired
	private UserService UserService;
	
	@GetMapping("/home")
	public String loadHomePage(ModelMap modelMap) {
		log.info("[ Call /home - GET ]"); 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UsersVO vo = (UsersVO) auth.getPrincipal();
	    
		List<AuthorityVO> list = UserService.getAuth(vo.getUserId());
		vo.setAuthorities(list);
		
	    modelMap.addAttribute("name",vo.getUsername());
	    modelMap.addAttribute("auth",vo.getAuthorities());
		return "home";
	}
}
