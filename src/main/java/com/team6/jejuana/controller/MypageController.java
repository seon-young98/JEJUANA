package com.team6.jejuana.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.dto.PagingVO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.SmsResponseDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.MessageDTO;
import com.team6.jejuana.service.MypageService;
import com.team6.jejuana.service.SmsService;

@RestController
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	MypageService service;
	
	
	//마이페이지 일정관리
	@GetMapping("/mypagePlan")
	public ModelAndView mypagePlan(PagingVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecord(vo));
		
		vo.setId((String)session.getAttribute("loginId"));
		
		String userid = (String)session.getAttribute("loginId");
		
		List<LoginDTO> pDTO = service.profileSelect(userid);
		
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
	public ModelAndView mypageReview(PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecordReview(vo));
		
		vo.setId((String)session.getAttribute("loginId"));
		
		String userid = (String)session.getAttribute("loginId");
		
		List<LoginDTO> pDTO = service.profileSelect(userid);
		mav.addObject("proDTO", pDTO);
		
		mav.addObject("vo", vo);
		mav.addObject("list", service.reviewAllSelect(vo));
		mav.setViewName("mypage/mypageReview");
		return mav;
	}
	
	//리뷰삭제
	@PostMapping("/mypageReviewMultiDel")
	public ModelAndView mypageReviewMultiDel(ReviewDTO dto, PagingTwoVO vo) {
			
		int result = service.mypageReviewMultiDel(dto.getNoList());
			
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
	public ModelAndView mypageCourse(PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setId((String)session.getAttribute("loginId"));
		
		String userid = (String)session.getAttribute("loginId");
		
		List<LoginDTO> pDTO = service.profileSelect(userid);
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypageCourse");
		return mav;
	}
	
	//마이페이지 북마크(여행지)
	@GetMapping("/mypagePlace")
	public ModelAndView mypagePlace(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("loginId");
		
		List<LoginDTO> pDTO = service.profileSelect(userid);
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypagePlace");
		return mav;
	}
	
	//마이페이지 회원정보수정 비밀번호 확인
	@GetMapping("/mypageUserCheck")
	public ModelAndView mypageUserCheck(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("loginId");
		
		List<LoginDTO> pDTO = service.profileSelect(userid);
		mav.addObject("proDTO", pDTO);
		
		mav.setViewName("mypage/mypageUserCheck");
		return mav;
	}
	
	//비밀번호 확인
	@PostMapping("/mypageUser")
	public ModelAndView mypagePwdCheck(LoginDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("loginId");
		
		String password = service.pwdSelect(userid);
		String pwd = dto.getPassword();
		
		if(pwd.equals(password)) {
			List<LoginDTO> pDTO = service.profileSelect(userid);
			
			LoginDTO Udto = service.userEdit(userid);
			
			String email1 = Udto.getEmail1();
			String email2 = Udto.getEmail2();
			
			mav.addObject("email1", email1);
			mav.addObject("email2", email2);
			
			mav.addObject("proDTO", pDTO);
			mav.setViewName("mypage/mypageUser2");
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
		
		return mav;	
	}
	
	//회원정보 수정(DB)
	@PostMapping("/userEditOk")
	public ModelAndView userEditOk(LoginDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("loginId");
		dto.setId(userid);
		
		int cnt = service.userEditOk(dto);
		
		if(cnt>0) { //수정성공
			mav.addObject("msg", "회원정보가 수정되었습니다.");
			mav.addObject("url", "/jejuana");
			mav.setViewName("mypage/editOk");
		}else { //수정실패
			mav.addObject("msg", "회원정보 수정에 실패했습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
		return mav;
	}

	//회원탈퇴
	@PostMapping("/userDelete")
	public ModelAndView userDelete(HttpSession session, LoginDTO dto) {
		ModelAndView mav= new ModelAndView();
		
		String userid = (String)session.getAttribute("loginId");
		
		String password = service.pwdSelect(userid);
		String pwd = dto.getPassword();
		
		if(pwd.equals(password)) {
			int cnt = service.userDelete(userid);
			if(cnt>0) {
				session.invalidate();
				mav.addObject("msg", "회원 탈퇴 처리되었습니다.");
				mav.addObject("url", "/jejuana");
				mav.setViewName("mypage/editOk");
			}else {
				mav.addObject("msg", "회원 탈퇴 실패했습니다.");
				mav.setViewName("mypage/mypageDelete");
			}
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mav.setViewName("mypage/mypageDelete");
		}
		return mav;
	}
	
	
	//휴대폰 인증
	@Inject
	SmsService smsService;
	
	@GetMapping("/sendSms")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/sendSms");
			
		return mav;
	}
		
	@PostMapping("/smssend")
	public ModelAndView sendSms(MessageDTO messageDto, Model model, HttpSession session) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		SmsResponseDTO response = smsService.sendSms(messageDto);
		model.addAttribute("response", response);
			
		session.setAttribute("Anumber", messageDto.getContent());
		System.out.println(messageDto.getContent());
		mav.setViewName("mypage/sendSms");
			
		return mav;
	}
	
}