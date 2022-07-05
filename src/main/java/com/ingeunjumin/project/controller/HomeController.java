package com.ingeunjumin.project.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 홈화면 컨트롤러
 */
@Controller
@Slf4j
public class HomeController {

	@Autowired
	private UserService UserService;
	
	@RequestMapping(value = {"/home", "/"} , method = RequestMethod.GET)
	public String loadHomePage(ModelMap modelMap) {
		log.info("[ Call /home - GET ]"); 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UsersVO vo = (UsersVO) auth.getPrincipal();
	    
		List<AuthorityVO> list = UserService.getAuth(vo.getUserId());
		vo.setAuthorities(list);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd" , Locale.KOREA);
		String strTodday = formatter.format(Calendar.getInstance().getTime());
		
		modelMap.addAttribute("today", strTodday);
	    modelMap.addAttribute("name",vo.getUsername());
	    modelMap.addAttribute("auth",vo.getAuthorities());
		return "home";
	}
	
}
