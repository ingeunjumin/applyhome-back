package com.ingeunjumin.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ingeunjumin.project.service.ApartmentsService;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 아파트 화면 컨트롤러
 */
@Controller
@Slf4j
public class ApartmentsController {
	@Autowired
	private ApartmentsService apartmentsService;
	
	@GetMapping("apartments")
	public String callApartmentsPage(ModelMap map, @RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize) {
		
		List<Map<String, Object>> list = apartmentsService.getApartmaentsAllList(pageNum, pageSize);
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		map.addAttribute("pageHelper", pageInfo);
		
		return "apartments";
	}
	
	
	@RequestMapping(value="/apartments/{apartment_no}", method = {RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> callSelectApartments(@PathVariable("apartment_no") int apartment_no) {
		return apartmentsService.getSelectApartmaents(apartment_no);
	}
  	
	

}
