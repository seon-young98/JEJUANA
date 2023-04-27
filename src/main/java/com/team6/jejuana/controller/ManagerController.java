package com.team6.jejuana.controller;

import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.service.ManagerService;

@RestController
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	ManagerService service;
	
	//유저 관리자 변경
		@PostMapping("commonUpdate")
		public ModelAndView commonUpdate(ReviewDTO dto,PagingDTO vo) {
			int result = service.commonMultiUpdate(dto.getNoList());
			ModelAndView mav = new ModelAndView();
			mav.addObject("nowpage",vo.getNowPage());
			
			if(vo.getSearchWord()!=null && !vo.getSearchWord().equals("")) {
				mav.addObject("searchKey", vo.getSearchKey());
				mav.addObject("searchWord", vo.getSearchWord());
				
			}

			mav.setViewName("redirect:commonmanager1");
			return mav;
		}
		
	//유저 세부정보 출력
	@GetMapping("/commonmanager2")
	public ModelAndView usermanager2(int common_no,PagingDTO vo) {
		ModelAndView mav = new ModelAndView();
	
		LoginDTO dto = service.commonSelect(common_no);
		mav.addObject("dto",dto);
		mav.addObject("vo",vo);
		mav.setViewName("manager/commonmanager2");
		return mav;
	}

	@RequestMapping(value="/commonEditOk", method = RequestMethod.POST)
	@ResponseBody
	public String commonEditOk( LoginDTO dto) {
		String message = "";
		int cnt = service.commonEditOk(dto);
		
		if(cnt>0){
			message = "<script>alert('success!');location.href='commonmanager1';</script>";
		}else {// 수정실패시 -> 이전페이지(알림)
			message = "<script>alert('failure!.');location.href='commonmanager1';</script>";
		}
		return message;
	}
	
	//게시글 목록 출력
	@GetMapping("/reviewmanager")	//	/board/boardList
	public ModelAndView reviewmanager(PagingDTO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.reviewtotalRecord(vo));
		mav.addObject("list",service.reviewpageSelect(vo));
		
		mav.addObject("vo",vo);
		mav.setViewName("manager/reviewmanager");
		return mav;
	}
	
		
	//게시글의 활성화/비활성화 변경
	@PostMapping("reviewUpdate")
	public ModelAndView reviewUpdate(ReviewDTO dto,PagingDTO vo) {
		int result = service.reviewMultiUpdate(dto.getNoList());//삭제
		ModelAndView mav = new ModelAndView();
		mav.addObject("nowpage",vo.getNowPage());
		
		if(vo.getSearchWord()!=null && !vo.getSearchWord().equals("")) {
			mav.addObject("searchKey", vo.getSearchKey());
			mav.addObject("searchWord", vo.getSearchWord());
			
		}

		mav.setViewName("redirect:reviewmanager");
		return mav;
	}
}