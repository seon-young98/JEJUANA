package com.team6.jejuana.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	NoticeService service;
	
	@GetMapping("/noticeList")
	public ModelAndView notice(PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecord(vo));
		
		//공지사항리스트
		mav.addObject("gList", service.gonggiSelect());
		
		//문의사항리스트
		mav.addObject("vo", vo);
		mav.addObject("list", service.noticeSelect(vo));
		
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	@GetMapping("/noticeWrite")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/noticeWrite");
		return mav;
	}
}
