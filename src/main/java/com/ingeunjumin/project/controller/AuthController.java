package com.ingeunjumin.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ingeunjumin.project.service.AuthService;
import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.utils.CaptchaSettings;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;


/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 권한 관련 컨트롤러
 */
@Controller
@Slf4j
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	CaptchaSettings captchaSettings;
	
	@GetMapping("/login")
	public String loadLoginPage(ModelMap map) {
		log.info("[ Call /login - GET ]");
		map.addAttribute("getSite",captchaSettings.getSite());
		return "login";
	}
	
	@PostMapping("/join")
	public @ResponseBody int callJoin(@RequestBody UsersVO usersVO) {
		return userService.setUser(usersVO);
	}
	
	@PostMapping("/valid-recaptcha")
    public @ResponseBody boolean validRecaptcha(HttpServletRequest request){
		boolean isResult = true;
    	String response = request.getParameter("g-recaptcha-response");
    	boolean isRecaptcha = authService.verifyRecaptcha(response); //인증 메소드 서비스로 분리
    	if(!isRecaptcha) {
    		isResult = false;
    	}
    	return isResult;
   }
	
}
