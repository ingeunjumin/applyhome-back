package com.ingeunjumin.project.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ingeunjumin.project.vo.AuthVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@GetMapping("/home")
	public String loadHomePage(ModelMap modelMap) {
		log.info("[ Call /home - GET ]");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		AuthVO autoVO = (AuthVO) auth.getPrincipal();
	    String userAuth = autoVO.getAuth();
	    String userName = autoVO.getUsername();
	    modelMap.addAttribute("userAuth",userAuth);
	    modelMap.addAttribute("userName",userName);
		return "home";
	}
}
