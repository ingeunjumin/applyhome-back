package com.ingeunjumin.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.ingeunjumin.project.mapper.ApartmentsMapper;
import com.ingeunjumin.project.vo.ApartmentsVO;

@Service
public class ApartmentsService {
	@Autowired
	private ApartmentsMapper apartmentsMapper;
	
	/**
	 * @param pageNum
	 * @param pageSize
	 * @return	List<ApartmentsVO>
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 게시물 가져오기 &  페이징처리
	 */
	public List<ApartmentsVO> getApartmaentsAllList(int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return apartmentsMapper.ApartmentsAllList();
	}
	

	/**
	 * @param apartmentsNo
	 * @return ApartmentsVO
	 * @author : In Seok
	 * @Date : 2022. 7. 8.
	 * comment : 
	 */
	public ApartmentsVO getSelectApartmaents(int apartmentsNo){
		return apartmentsMapper.SelectApartments(apartmentsNo);
	}
	
	/**
	 * @param vo
	 * @param apartment_no
	 * @return	int
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 게시물수정
	 */
	@Transactional(rollbackFor = Exception.class)
	public int updateApartmaents(int apartmentsNo,ApartmentsVO vo) {
		vo.setApartmentsNo(apartmentsNo);
		int row =apartmentsMapper.updateApartments(vo);
		return row;
	}
	
	/**
	 * @param apartmentsName
	 * @param pageNum
	 * @param pageSize
	 * @return	List<ApartmentsVO>
	 * @author : In Seok
	 * @Date : 2022. 6. 30.
	 * comment : 게시물 서치
	 */
	public List<ApartmentsVO> getSearchApartmentsList(String apartmentsName,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return apartmentsMapper.selectSearchApartmentsList(apartmentsName);
	}

}
