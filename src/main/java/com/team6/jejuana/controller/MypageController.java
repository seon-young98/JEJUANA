package com.team6.jejuana.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.dto.PagingVO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.CommonDTO;
import com.team6.jejuana.service.MypageService;

@RestController
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	MypageService service;
	
	//마이페이지 일정관리
	@GetMapping("/mypagePlan")
	public ModelAndView mypagePlan(PagingVO vo) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecord(vo));
		System.out.println(vo.toString());
		
		List<CommonDTO> pDTO = service.profileSelect();
		
		mav.addObject("list", service.planAllSelect(vo));
		mav.addObject("vo", vo);
		mav.addObject("proDTO", pDTO);
		mav.setViewName("mypage/mypagePlan");
		
		return mav;	
	}
	
	//일정삭제
	@PostMapping("/mypagePlanMultiDel")
	public ModelAndView mypagePlanMultiDel(PlanDTO dto, PagingVO vo) {
		
		int result = service.mypagePlanMultiDel(dto.getNoPList());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("nowPage", vo.getNowPage());
		
		if(result>0) {
			mav.setViewName("redirect:mypagePlan?nowPage="+vo.getNowPage());
		}else {
			mav.addObject("msg", "일정 삭제에 실패했습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
		
		return mav;
	}
	
	//마이페이지 여행기록관리
	@GetMapping("/mypageReview")
	public ModelAndView mypageReview(PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecordReview(vo));
		System.out.println(vo.toString());
		
		List<CommonDTO> pDTO = service.profileSelect();
		mav.addObject("proDTO", pDTO);
		
		mav.addObject("vo", vo);
		mav.addObject("list", service.reviewAllSelect(vo));
		mav.setViewName("mypage/mypageReview");
		return mav;
	}
	
	//리뷰삭제
	@PostMapping("/mypageReviewMultiDel")
	public ModelAndView mypageReviewMultiDel(ReviewDTO dto, PagingTwoVO vo) {
			
		int result = service.mypageReviewMultiDel(dto.getNoRList());
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("nowPage", vo.getNowPage());
			
		if(result>0) {
			mav.setViewName("redirect:mypageReview?nowPage="+vo.getNowPage());
		}else {
			mav.addObject("msg", "여행기록 삭제에 실패했습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
			
		return mav;
	}
		
	//마이페이지 북마크(코스)
	@GetMapping("/mypageCourse")
	public ModelAndView mypageCourse(PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		
		List<CommonDTO> pDTO = service.profileSelect();
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypageCourse");
		return mav;
	}
	
	//마이페이지 북마크(여행지)
	@GetMapping("/mypagePlace")
	public ModelAndView mypagePlace() {
		ModelAndView mav = new ModelAndView();
		
		List<CommonDTO> pDTO = service.profileSelect();
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypagePlace");
		return mav;
	}
	
	//마이페이지 회원정보수정 비밀번호 확인
	@GetMapping("/mypageUserCheck")
	public ModelAndView mypageUserCheck() {
		ModelAndView mav = new ModelAndView();
		
		List<CommonDTO> pDTO = service.profileSelect();
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypageUserCheck");
		return mav;
	}
	
	//비밀번호 확인
	@PostMapping("mypagePwdCheck")
	public ModelAndView mypagePwdCheck(CommonDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		String password = service.pwdSelect();
		String pwd = dto.getPassword();
		
		if(pwd.equals(password)) {
			List<CommonDTO> pDTO = service.profileSelect();
			mav.addObject("proDTO", pDTO);
			mav.setViewName("mypage/mypageUser");
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
		
		return mav;
		
	}
}
