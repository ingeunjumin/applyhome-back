package com.ingeunjumin.project.api;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingeunjumin.project.utils.DistanceHandler;

@Service
public class ApiService {

	@Autowired
	private ApiMapper mapper;
	@Autowired
	private DistanceHandler distanceHandler;
	
	public List<Map<String, Object>> getAllApartments(){
		return 	mapper.selectAllApartments();
	}
	
	public Map<String, Object> getApartmentsInfo(int aptNo){
		Map<String, Object> map = mapper.selectOneApartments(aptNo);
		int price = (int) map.get("price");
		String strPrice = "";
		
		if(price >= 10000) {
			String hundredMillion = Integer.toString(price).substring(0,1);
			strPrice = hundredMillion+"억 ";
		}
		String tenMillion = Integer.toString(price).substring(1);
		tenMillion = new DecimalFormat("###,###").format(Integer.parseInt(tenMillion));
		map.put("strPrice", strPrice+tenMillion);

		String latitude = map.get("latitude").toString();
		String longitude = map.get("longitude").toString();
		map.put("businessList", getBusinessArea(latitude, longitude)); //근처 1.5km 안에 있는 상권 조회 함수 호출

		return map;
	}
	
	public List<Map<String, Object>> selectApartmentsContract(int apartmentsNo, int term){
		String date = "";
		if(term == 3) { //3개월 거래내역
			date = "2021-09-00";
		}
		if(term == 6) { //6개월 거래내역
			date = "2021-06-00";
		}
		if(term == 12) { //1년 거래내역
			date = "2021-01-00";
		}
		List<Map<String, Object>> list = mapper.selectApartmentsContract(apartmentsNo, date);
		if(list.size() == 0) {
			list = mapper.selectApartmentsContract(apartmentsNo, "2021-01-00");
		}
		return list;
	}

	public List<Map<String, Object>> getBusinessArea(String latitude, String longitude){

		List<Map<String, Object>> businesList = mapper.selectBusinessArea();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		double boundary = 1.5;

		for(Map<String, Object> data : businesList){
			double targetLat = Double.parseDouble(data.get("latitude").toString());
			double targetLon = Double.parseDouble(data.get("longitude").toString());
			double result = distanceHandler.calculateDistance( Double.parseDouble(latitude), Double.parseDouble(longitude), 
			targetLat, targetLon);

			if(result <= boundary){
				list.add(data);
			}
		}
		return list;
	}
 
}
