package com.team6.jejuana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.NoticeDAO;
import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> gonggiSelect() {
		return dao.gonggiSelect();
	}

	@Override
	public List<NoticeDTO> noticeSelect(PagingTwoVO vo) {
		return dao.noticeSelect(vo);
	}

	@Override
	public int totalRecord(PagingTwoVO vo) {
		return dao.totalRecord(vo);
	}

}

