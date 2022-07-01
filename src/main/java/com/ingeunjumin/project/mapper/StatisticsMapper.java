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

}
