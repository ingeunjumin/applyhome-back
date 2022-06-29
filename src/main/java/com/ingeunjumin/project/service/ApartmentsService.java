package com.ingeunjumin.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ingeunjumin.project.mapper.ApartmentsMapper;

@Service
public class ApartmentsService {
	@Autowired
	private ApartmentsMapper apartmentsMapper;
	
	/**
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 게시물 가져오기 &  페이징처리
	 */
	public List<Map<String, Object>> getApartmaentsAllList(int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return apartmentsMapper.ApartmentsAllList();
	}
	
	/**
	 * @return
	 * @author : In Seok
	 * @Date : 2022. 6. 29.
	 * comment : 게시물 보내기
	 */
	public Map<String, Object> getSelectApartmaents(int apartment_no){
		return apartmentsMapper.SelectApartments(apartment_no);
	}

}
