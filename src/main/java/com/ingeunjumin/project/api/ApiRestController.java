package com.ingeunjumin.project.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/v1") 
@Slf4j
@CrossOrigin
public class ApiRestController {
	
	@Autowired
	private ApiService apiService;
	
	@GetMapping("/")
	public List<Map<String, Object>> callApartments(@RequestParam("type") String type) {
		log.info("[ Call /api/v1/?type="+type+" - GET ]");
		switch(type) {
			case "apartments" : return apiService.getAllApartments();
		}
		return null;
	}
	
	@GetMapping("/apartments")
	public Map<String, Object> callApartmentsInfo(@RequestParam("aptno") int aptNo) {
		log.info("[ Call /api/v1/apartments?aptno="+aptNo+" - GET ]");
		return apiService.getApartmentsInfo(aptNo);
	}
	
	
}
