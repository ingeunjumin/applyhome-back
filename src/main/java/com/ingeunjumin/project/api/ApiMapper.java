package com.ingeunjumin.project.api;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ApiMapper {

	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 6. 30.
	 * comment : 아파트 위 경도 조회
	 */
	public List<Map<String, Object>> selectAllApartments();
	
	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 6. 30.
	 * comment : 아파트 상세정보 조회
	 */
	public Map<String, Object> selectOneApartments(int apartmentsNo);
	
	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 6. 30.
	 * comment : 아파트 최근 3개월 거래내역
	 */
	public List<Map<String, Object>> selectApartmentsContract(@Param("apartmentsNo")int apartmentsNo, @Param("date")String date);

	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 7. 2.
	 * comment : 상권 데이터 조회
	 */
	public List<Map<String, Object>> selectBusinessArea();

	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 7. 3.
	 * comment : 대전에서 가장 비싼 탑 5 아파트 조회
	 */
	public List<Map<String, Object>> selectTopFiveApartments();
	
	/**
	 * @return
	 * @author : Sangwon Hyun
	 * @date : 2022. 7. 6.
	 * comment : 대전 아파트 청약 조회
	 */
	public List<Map<String, Object>> selectSubscriptionApartments();
}
