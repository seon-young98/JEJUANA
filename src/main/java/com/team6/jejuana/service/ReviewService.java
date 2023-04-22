package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.ReviewSearchVO;

public interface ReviewService {
	//여행기록 메인
	public List<ReviewDTO> reviewBestSelect(); //인기글 목록
	public List<ReviewDTO> reviewAllSelect(ReviewSearchVO vo); //글 목록
	
	//글작성 창
	//작성할 플랜 선택
	public ReviewDTO reviewWriteSelect(int plan_no);
	public List<ReviewDTO> planSelect(int plan_no); //1플랜 당 여행지 총 개수
	public ReviewDTO onePlaceSelect(int place_no); //여행지 1개 선택
	public int starUpdate(int place_no, int rate); //별점등록
	public List<ReviewDTO> tagSelect(); //태그목록
	public int reviewInsert(ReviewDTO dto); //글등록
	
	//글선택(확인)
	public ReviewDTO reviewSelect(int plan_no);
	//조회수 증가
	public void reviewHitCount(int plan_no);
	//다녀온 코스
	public List<ReviewDTO> reviewCourse(int plan_no);
		
	//수정할 글 선택
	public ReviewDTO reviewEditSelect(int plan_no);
	//글수정(DB)
	public int reviewUpdate(ReviewDTO dto);
	
	//글 삭제
	public int reviewDelete(ReviewDTO dto);
}
