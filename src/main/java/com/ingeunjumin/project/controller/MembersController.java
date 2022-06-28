package com.ingeunjumin.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 멤버관리화면 컨트롤러
 */
@Controller
@Slf4j
public class MembersController {
	
	@GetMapping("/member")
	public String callMembersPage() {
		return "member";
	}
	
}
