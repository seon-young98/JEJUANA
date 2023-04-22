package com.team6.jejuana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	
	@GetMapping("/test2")
	public ModelAndView test2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list/test2");
		return mav;
	}
	
	@GetMapping("/test3")
	public ModelAndView test3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list/test3");
		return mav;
	}
	

	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/postmanager")
	public ModelAndView postmanager() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/postmanager");
		return mav;
	}
	
	@GetMapping("/usermanager")
	public ModelAndView usermanager() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/usermanager");
		return mav;
	}
}
