package com.ingeunjumin.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ingeunjumin.project.vo.ApartmentsVO;

@Mapper
public interface ApartmentsMapper {
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : Apartments 테이블 게시물가져오기
	 */
	public List<ApartmentsVO> ApartmentsAllList();
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : select 컬럼정보 보내기
	 */
	public ApartmentsVO SelectApartments(int apartmentsNo);
	
	/**
	 * @param vo
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 아파트업데이트
	 */
	public int updateApartments(ApartmentsVO vo);
	
	/**
	 * @param studentsName
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 아파트 검색 리스트
	 */
	public  List<ApartmentsVO> selectSearchApartmentsList(String studentsName);
}
