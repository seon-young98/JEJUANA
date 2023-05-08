package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.ReviewDTO;

public interface ManagerService {
	
	//������ - ����
	public int commontotalRecord(PagingDTO dto);
	public List<ReviewDTO> commonpageSelect(PagingDTO dto);
	public int commonMultiUpdate(List<Integer> noList);
	public LoginDTO commonSelect(int no);
	public int commonEditOk(LoginDTO dto);
	
	//������ - �Խñ�
	public int reviewtotalRecord(PagingDTO dto);
	public List<ReviewDTO> reviewpageSelect(PagingDTO dto);
	public int reviewMultiUpdate(List<Integer> noList);
	public ReviewDTO reviewSelect(int plan_no);
	public int reviewUpdate(int plan_no);

}