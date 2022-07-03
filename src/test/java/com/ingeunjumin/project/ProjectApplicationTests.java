package com.ingeunjumin.project;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ingeunjumin.project.utils.DistanceHandler;

@SpringBootTest
class ProjectApplicationTests {

	@Autowired
	private DistanceHandler distanceHandler;

	@Test
	void contextLoads() {

		double myhomeLat = 36.3432473;
		double myhomeLon = 127.4487079;

		double targetLat = 36.3513074;
		double targetLon = 127.4375009;

		double result = distanceHandler.calculateDistance(myhomeLat, myhomeLon, targetLat, targetLon);
		System.out.println("KM : "+result);
		System.out.println("RESULT : "+String.format("%.1f", result));


		double boundary = 1.5;
		if(result <= boundary){
			System.out.println("1.5km 안에 목표물 발견 !!");
		}

	}

}
