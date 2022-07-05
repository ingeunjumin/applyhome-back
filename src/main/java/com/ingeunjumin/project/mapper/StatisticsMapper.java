package com.ingeunjumin.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StatisticsMapper {
	
	
	/**
		 * @Method Name : selectSixMonthStatistics
		 * @return : List<Map<String,Object>>
		 * @author : geunhwan Ryu
		 * @date : 2022. 7. 1.
		 * @upDate : 
		 *comment : 6개월 매매 평균 금액 조회
		 */
	public List<Map<String,Object>> selectSixMonthStatistics(
			@Param("startDate") String startDate,
			@Param("endDate") String endDate
			);

	/**
		 * @Method Name : selectMonthTradeCountAndSalesAmount
		 * @return : List<Map<String,Object>>
		 * @author : geunhwan Ryu
		 * @date : 2022. 7. 4.
		 * @upDate : 
		 *comment : 구별 월 매매 건수 && 월 평균 매매금액 조회
		 */
	public List<Map<String,Object>> selectMonthTradeCountAndAvgSalesAmount(
			@Param("startDate") String startDate,
			@Param("endDate") String endDate
			);
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 7. 4.
	 * comment : 구별 TOP5 가격 아파트 조회~
	 */
	public List<Map<String, Object>> selectTopApartPrice(@Param("gu") String gu);
}
