package com.ingeunjumin.project.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApartmentsVO {
	private int apartmentsNo;//아파트번호
	private String apartmentsName;//아파트이름
	private int price;//아파트 가격
	private String addr;//아파트 지번주소
	private String gu;//구이름
	private String dong;//동이름
	private String latitude;//위도
	private String longitude;//경도
	private String createAt;//아파트 건립날짜
	private String heatType;//난방방식
	private int dongCnt;//동수
	private int sedeCnt;//세대수
	private String manageType;//관리 방식
	private int leasableArea;//주거지역면적

	
}
