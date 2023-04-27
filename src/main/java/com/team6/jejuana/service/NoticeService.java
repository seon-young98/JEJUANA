package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;

public interface NoticeService {
	public List<NoticeDTO> gonggiSelect();
	public List<NoticeDTO> noticeSelect(PagingTwoVO vo);
	public int totalRecord(PagingTwoVO vo);
}