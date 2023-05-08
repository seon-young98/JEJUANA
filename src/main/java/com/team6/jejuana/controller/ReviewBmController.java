package com.team6.jejuana.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.ReviewBmDTO;
import com.team6.jejuana.service.ReviewBmService;

@RestController
public class ReviewBmController {
	@Autowired
	ReviewBmService service;
	
	//�ϸ�ũ
	@GetMapping("/review/reviewBm")
	public ModelAndView reviewBm(int target_no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
	
		ReviewBmDTO dto = new ReviewBmDTO();
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.setTarget_no(target_no);
		
		int cnt = service.reviewBmSelect(dto);
		
		if(cnt<1) {
			String book_name = service.reviewInfoSelect(target_no).getBook_name();
			dto.setBook_name(book_name);
			System.out.println(dto.toString());
			try {
				service.reviewBmInsert(dto);
				System.out.println(dto.toString());
				mav.addObject("msg", "�ϸ�ũ�� ����Ǿ����ϴ�.");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(dto.toString());
				mav.addObject("msg", "�ϸ�ũ ���忡 �����Ͽ����ϴ�.");
			}
		}else {
			mav.addObject("msg", "�̹� ��ϵ� �ϸ�ũ�Դϴ�.");
		}
		mav.setViewName("review/result");
		
		return mav;
		}

}