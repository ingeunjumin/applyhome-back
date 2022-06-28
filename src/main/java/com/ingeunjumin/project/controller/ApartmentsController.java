package com.ingeunjumin.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 아파트 화면 컨트롤러
 */
@Controller
@Slf4j
public class ApartmentsController {
	@GetMapping("/apartments")
	public String callApartmentsPage() {
		return "apartments";
	}

}