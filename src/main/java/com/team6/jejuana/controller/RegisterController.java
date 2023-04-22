package com.team6.jejuana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.RegisterDTO;
import com.team6.jejuana.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService service;
	
	//로그인폼
		@GetMapping("/loginForm")
		public String login() {
			return "register/loginForm";//		/WEB-INF/views/register/loginForm.jsp
		}
	
	//로그인(DB)
		@PostMapping("/loginOk")
		public ModelAndView loginOk(String userid, String userpwd, HttpServletRequest request, HttpSession session) {
			System.out.println("userid->"+ userid);
			System.out.println("userpwd->"+ userpwd);
			RegisterDTO dto = service.loginOk(userid, userpwd);
			System.out.println(dto);

			ModelAndView mav = new ModelAndView();
			if(dto != null) {//로그인 성공
				session.setAttribute("logId", dto.getUserid());
				session.setAttribute("logName", dto.getUsername());
				session.setAttribute("logStatus", "Y");
				mav.setViewName("list/test2");
			}else {//로그인실패
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		
		//로그아웃 - 세션제거
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session) {
			session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("list/test2");
			
			return mav;
		}
}
