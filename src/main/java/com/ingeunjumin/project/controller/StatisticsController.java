package com.ingeunjumin.project.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ingeunjumin.project.service.StatisticsService;
import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.vo.ApartmentsVO;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;



/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 통계화면 컨트롤러
 */
@Controller
@Slf4j
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/data")
	public String callStatisticsPage(
			ModelMap map,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize
			) {
		
		log.info("[ Call /statistics - GET ]");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UsersVO vo = (UsersVO) auth.getPrincipal();
		
		List<AuthorityVO> list = userService.getAuth(vo.getUserId());
		vo.setAuthorities(list);
		
		List<Map<String,Object>> CrawlingList = statisticsService.getCrawlingDataAllList(pageNum, pageSize);
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>(CrawlingList);
		map.addAttribute("pageHelper", pageInfo);		
		
		return "data";
	}
	
	@GetMapping("/data/{subscriptionNo}")
	@ResponseBody
	public Map<String, Object> callSubscriptionNoSelect(
			@PathVariable("subscriptionNo") int subscriptionNo
			){
		return statisticsService.getSubscriptionNoSelect(subscriptionNo);
	}
	
	@GetMapping("/statistics/sixmonth/contract")
	@ResponseBody
	public List<Map<String,Object>> callSixmonthContract(){
		log.info("[ Call /statistics/sixmonth/contract - GET ]");
		return statisticsService.getSelectSixMonthStatistics();
	}
	
	@GetMapping("/statistics/sixmonth/trade/sale")
	@ResponseBody
	public List<Map<String,Object>> callSixmonthTradeCountAndAvgSaleAmount(){
		log.info("[ Call /statistics/sixmonth/trade/sale - GET ]");
		return statisticsService.getSelectMonthTradeCountAndAvgSalesAmount();
	}
	
	@GetMapping("/home/aptTop/{gu}")
	@ResponseBody
	public List<Map<String,Object>> callAptTop(@PathVariable("gu") String gu, ModelMap map){
		return statisticsService.getSelectTopAptPrice(gu);
	}
	
	
}
