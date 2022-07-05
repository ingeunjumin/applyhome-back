package com.ingeunjumin.project.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ingeunjumin.project.service.ExcelService;

@Controller
public class ExcelController {
	@Autowired
	private ExcelService excelService;
	
	@GetMapping("/excel/Apartments")
	public void downloadExcelFile(HttpServletResponse response) throws Exception{
	String today = new SimpleDateFormat("yyyy-MM-dd" , Locale.KOREA).format(new Date());
	String title = "인근주민_아파트정보";
	
	//엑셀 파일을 보내겠다.
	response.setContentType("ms-vnd/excel");
	//엑셀 파일 이름 수정
	response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(today+"_"+title,"UTF-8")+".xls");
	Workbook workBook = excelService.makeExcelForm();
	workBook.write(response.getOutputStream());
	workBook.close();
	        
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
	}
}
