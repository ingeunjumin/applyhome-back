package com.ingeunjumin.project.api;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
}
