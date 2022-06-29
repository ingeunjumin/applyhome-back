package com.ingeunjumin.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApartmentsMapper {
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : Apartments 테이블 게시물가져오기
	 */
	public List<Map<String, Object>> ApartmentsAllList();
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : select 컬럼정보 보내기
	 */
	public Map<String, Object> SelectApartments(int apartment_no);
}
