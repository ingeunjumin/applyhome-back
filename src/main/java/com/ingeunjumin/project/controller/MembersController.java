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

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 멤버관리화면 컨트롤러
 */
@Controller
@Slf4j
public class MembersController {
	
	@Autowired
	private UserService UserService;
	
	@GetMapping("/member")
	public String callMembersPage(ModelMap modelMap) {
		log.info("[ Call /member - GET ]"); 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();//security에서 로그인한 사람에 정보를 체크 후 불러옴
		UsersVO vo = (UsersVO) auth.getPrincipal(); //UsersVO 사용자 권한정보가 저장된 vo
		List<AuthorityVO> list = UserService.getAuth(vo.getUserId());//사용자 권한 조회
		vo.setAuthorities(list);//사용자 권한 vo에 set
		
	    modelMap.addAttribute("name",vo.getUsername());
	    modelMap.addAttribute("auth",vo.getAuthorities());
		return "member";
	}
	
}
