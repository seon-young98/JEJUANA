package com.team6.jejuana.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int plan_no;
	private String review_subject;
	private String review_content;
	private int review_hit;
	private String id;
	private String writedate;
	private int activated;
	private String ip;
	private String tag;
	private String thumbnail;
	
	//여러 개의 레코드 한번에 삭제할 때 필요한 레코드 번호
	private List<Integer> noRList;
	
}
	
