package com.ingeunjumin.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ingeunjumin.project.service.ApartmentsService;
import com.ingeunjumin.project.vo.ApartmentsVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 아파트 화면 컨트롤러
 */
@Controller
@Slf4j
public class ApartmentsController {
	@Autowired
	private ApartmentsService apartmentsService;

	/**
	 * @param map
	 * @param pageNum
	 * @param pageSize
	 * @return	"apartments.jsp"
	 * @author : In Seok
	 * @Date : 2022. 7. 8.
	 * comment : 
	 */
	@GetMapping("apartments")
	public String callApartmentsPage(ModelMap map, @RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize) {

		log.info("[ Call /apartments - GET ]");
		List<ApartmentsVO> list = apartmentsService.getApartmaentsAllList(pageNum, pageSize);
		PageInfo<ApartmentsVO> pageInfo = new PageInfo<ApartmentsVO>(list);
		map.addAttribute("pageHelper", pageInfo);

		return "apartments";
	}

	/**
	 * @param apartmentNo
	 * @return	ApartmentsVO
	 * @author : In Seok
	 * @Date : 2022. 6. 30. comment : 아파트번호 클릭시 apartmentsNo넘에 맞는 정보 출력
	 */
	@ResponseBody
	@GetMapping("/apartments/{apartmentsNo}")
	public ApartmentsVO callSelectApartments(@PathVariable("apartmentsNo") int apartmentNo) {
		log.info("[ Call /apartments/" + apartmentNo + " - GET ]");
		return apartmentsService.getSelectApartmaents(apartmentNo);
	}

	/**
	 * @param apartmentsNo
	 * @param vo
	 * @return	int
	 * @author : In Seok
	 * @Date : 2022. 6. 29. comment : 업데이트
	 */
	@ResponseBody
	@PatchMapping("/apartments/{apartmentsNo}")
	public int updateApartments(@PathVariable("apartmentsNo") int apartmentsNo, @RequestBody ApartmentsVO vo) {
		return apartmentsService.updateApartmaents(apartmentsNo, vo);
	}

	/**
	 * @param map
	 * @param name
	 * @param pageNum
	 * @param pageSize
	 * @return	"apartments.jsp"
	 * @author : In Seok
	 * @Date : 2022. 6. 30. comment : 아파트 검색!!
	 */
	@GetMapping("/apartments/search")
	public String callBoardSearchPage(ModelMap map, @RequestParam("name") String name,
			@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
		
		log.info("[ Call /apartments/" + name + " - GET ]");
		List<ApartmentsVO> list = apartmentsService.getSearchApartmentsList(name, pageNum, pageSize);

		String addSearcg = name;
		map.addAttribute("search", addSearcg);

		PageInfo<ApartmentsVO> pageInfo = new PageInfo<ApartmentsVO>(list);
		map.addAttribute("pageHelper", pageInfo);

		return "apartments";
	}

}
