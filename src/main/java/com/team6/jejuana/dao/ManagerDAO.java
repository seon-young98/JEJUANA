package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.CommonDTO;
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.ReviewDTO;

public interface ManagerDAO {
	
	
	//������ - ����
	public int commontotalRecord(PagingDTO dto);
	
	public List<ReviewDTO> commonpageSelect(PagingDTO dto);
	
	public int commonMultiUpdate(List<Integer> noList);
		
	public CommonDTO commonSelect(int no);
	
	public int commonEditOk(CommonDTO dto);
	
	
	//������ - �Խñ�
	public int reviewtotalRecord(PagingDTO dto);
	
	public List<ReviewDTO> reviewpageSelect(PagingDTO dto);

	public int reviewMultiUpdate(List<Integer> noList);
	
	
}
