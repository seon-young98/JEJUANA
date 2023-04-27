
package com.team6.jejuana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team6.jejuana.dto.ReviewComDTO;
import com.team6.jejuana.service.ReviewComService;

@RestController
public class ReviewComController {
	@Autowired
	ReviewComService service;
	
	//댓글 등록
	@PostMapping("/commentSend")
	public String commentSend(ReviewComDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("logId"));
		
		int result = service.commentInsert(dto);
		System.out.println(dto.toString());
		return result+"";
	}
	
	//댓글 목록
	@GetMapping("/commentList")
	public List<ReviewComDTO> commentList(int target_no) {
		List<ReviewComDTO> list = service.commentListSelect(target_no);
		return list;
	}
	
	//댓글 수정
	@PostMapping("/commentEdit")
	public String commentEdit(ReviewComDTO dto, HttpSession session) {
		dto.setId((String)session.getAttribute("logId"));
		int result = service.commentUpdate(dto);
		return String.valueOf(result);
	}
	
	//댓글 삭제
	@GetMapping("/commentDelete")
	public String commentDelete(int comment_no, HttpSession session) {
		String id = (String)session.getAttribute("logId");
		return String.valueOf(service.commentDelete(comment_no, id));
	
	}
}
