package com.ingeunjumin.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
public class MembersController {

	@Autowired
	private UserService userService;

	@GetMapping("/member")
	public String callMembersPage(ModelMap modelMap) {
		log.info("[ Call /member - GET ]");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();// security에서 로그인한 사람에 정보를 체크 후 불러옴
		UsersVO vo = (UsersVO) auth.getPrincipal(); // UsersVO 사용자 권한정보가 저장된 vo
		List<AuthorityVO> list = userService.getAuth(vo.getUserId());// 사용자 권한 조회
		vo.setAuthorities(list);// 사용자 권한 vo에 set
		List<Map<String, Object>> usersData = userService.getUsersAllList();
		modelMap.addAttribute("name", vo.getUsername());
		modelMap.addAttribute("auth", vo.getAuthorities());
		modelMap.addAttribute("usersData", usersData);
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
		 *comment : search 계정 조회
		 */
	@GetMapping("/member/search")
	public String callSearchUsers(ModelMap map , 
			@RequestParam("search") String search,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize){
		List<Map<String, Object>> list = userService.getSelectSearchUsers(search);
		map.addAttribute("usersData", list);
		return "member";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
