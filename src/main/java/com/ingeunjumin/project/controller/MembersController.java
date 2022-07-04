package com.ingeunjumin.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ingeunjumin.project.service.UserService;
import com.ingeunjumin.project.vo.AuthorityVO;
import com.ingeunjumin.project.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author sangwon Hyun
 * @date 2022. 6. 28.
 * @comment : 멤버관리화면 컨트롤러
 */
@Controller
@Slf4j
@Component
public class MembersController {

	@Autowired
	private UserService userService;

	/**
		 * @Method Name : callMembersPage
		 * @return : String
		 * @author : geunhwan Ryu
		 * @date : 2022. 7. 4.
		 * @upDate : 
		 *comment : 로그,전체사용자,페이징처리 함수
		 */
	@GetMapping("/member")
	public String callMembersPage(ModelMap modelMap,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize) {
		log.info("[ Call /member - GET ]");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();// security에서 로그인한 사람에 정보를 체크 후 불러옴
		UsersVO vo = (UsersVO) auth.getPrincipal(); // UsersVO 사용자 권한정보가 저장된 vo
		List<AuthorityVO> list = userService.getAuth(vo.getUserId());// 사용자 권한 조회
		vo.setAuthorities(list);// 사용자 권한 vo에 set
		
		List<Map<String, Object>> list1 = userService.getUsersAllList(pageNum,pageSize);
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list1);
		
		modelMap.addAttribute("pageHelper", pageInfo);
		modelMap.addAttribute("name", vo.getUsername());
		modelMap.addAttribute("auth", vo.getAuthorities());
		return "member";
	}

	/**
		 * @Method Name : callUserNo
		 * @return : UsersVO
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 30.
		 * @upDate : 
		 *comment : 특정 계정 정보 가져오기
		 */
	@GetMapping("/member/{userNo}")
	@ResponseBody
	public UsersVO callUserNo(@PathVariable("userNo") int userNo) {
		return userService.getSelecteUserNo(userNo);
	}
	
	
	/**
		 * @Method Name : callUpdateUser
		 * @return : UsersVO
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 30.
		 * @upDate : 
		 *comment : 특정 계정 업데이트
		 */
	@CrossOrigin
	@PatchMapping("/member/update")
	@ResponseBody
	public int callUpdateUser(@RequestBody UsersVO vo) {
		return userService.getUpdateUser(vo);
	}

	
	/**
		 * @Method Name : callSearchUsers
		 * @return : List<Map<String,Object>>
		 * @author : geunhwan Ryu
		 * @date : 2022. 6. 30.
		 * @upDate : 
		 *comment : search 계정 조회 (테스트)
		 */
	@GetMapping("/member/search")
	public String callSearchUsers(ModelMap map , 
			@RequestParam("search") String search,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize){
		
		List<Map<String, Object>> list = userService.getSelectSearchUsers(search,pageNum,pageSize);
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		map.addAttribute("search", search);
		map.addAttribute("pageHelper", pageInfo);
		
		return "member";
	}
	
//  @Scheduled(cron="0/3 * * * * *")
//  public void test2() {
//      System.out.println("@Scheduled annotation : 1분에 1번씩 console 찍기");
//      System.out.println("현재시간 => "+ new Date());
//      log.info("[ Call /member - GET ]");
//  }
}
