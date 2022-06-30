package com.ingeunjumin.project.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApiService {

	@Autowired
	private ApiMapper mapper;
	
	public List<Map<String, Object>> getAllApartments(){
		return 	mapper.selectAllApartments();
	}
	
	public Map<String, Object> getApartmentsInfo(int aptNo){
		Map<String, Object> map = mapper.selectOneApartments(aptNo);
		int price = (int) map.get("price");
		
		return map;
	}
	
}
