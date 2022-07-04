package com.ingeunjumin.project.service;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingeunjumin.project.mapper.StatisticsMapper;

@Service
public class StatisticsService {
	
	@Autowired
	private StatisticsMapper statisticsMapper;
	
	public List<Map<String,Object>> getSelectSixMonthStatistics(){
		String startDate = "2021-06";
		String endDate = "2021-11";
		return statisticsMapper.selectSixMonthStatistics(startDate,endDate);
	}
	
	public List<Map<String,Object>> getSelectMonthTradeCountAndAvgSalesAmount(){
		String startDate = "2021-06";
		String endDate = "2021-11";
		List<Map<String,Object>> list = statisticsMapper.selectMonthTradeCountAndAvgSalesAmount(startDate, endDate);
		System.out.println(list.size());
		return statisticsMapper.selectMonthTradeCountAndAvgSalesAmount(startDate, endDate);
	}
	
}
