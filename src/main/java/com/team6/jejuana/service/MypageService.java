package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.dto.PagingVO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.LoginDTO;

public interface MypageService {
	public int totalRecord(PagingVO vo);
	public List<PlanDTO> planAllSelect(PagingVO vo);
	public List<LoginDTO> profileSelect(String userid);
	public int mypagePlanMultiDel(List<Integer> noPList);
	public int totalRecordReview(PagingTwoVO vo);
	public List<ReviewDTO> reviewAllSelect(PagingTwoVO vo);
	public int mypageReviewMultiDel(List<Integer> noRList);
	public String pwdSelect(String userid);
	public LoginDTO userEdit(String userid); 
	public int userEditOk(LoginDTO dto);
	public int userDelete(String userid);
}
