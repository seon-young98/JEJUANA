package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;

public interface NoticeDAO {
	public List<NoticeDTO> gonggiSelect();
	public List<NoticeDTO> noticeSelect(PagingTwoVO vo);
	public int totalRecord(PagingTwoVO vo);
}
