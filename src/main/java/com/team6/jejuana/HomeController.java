package com.team6.jejuana;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.RegisterDTO;
import com.team6.jejuana.service.RegisterService;

@Controller
public class HomeController {
	@Autowired
	RegisterService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	//로그인폼
		@GetMapping("/loginForm")
		public String login() {
			return "register/loginForm";
		}
		
		//로그인(DB)
		@PostMapping("/loginOk")
		public ModelAndView loginOk(String id, String password, HttpServletRequest request, HttpSession session) {
			
			
			RegisterDTO dto = service.loginOk(id, password);
			//dto -> null인 경우 선택 레코드가 없다 -> 로그인 실패
			//    -> null이 아닌 경우 선택 레코드가 있다 -> 로그인 성공
			ModelAndView mav = new ModelAndView();
			System.out.println(dto);
			if(dto != null) { //로그인
	 			session.setAttribute("logId", dto.getId());
	 			session.setAttribute("logName", dto.getName());
	 			session.setAttribute("logStatus", "Y");
	 			mav.setViewName("review/reviewList");
			}else { //실패
				
				mav.setViewName("redirect:loginForm");
			}
			return mav;
		}
	
}
