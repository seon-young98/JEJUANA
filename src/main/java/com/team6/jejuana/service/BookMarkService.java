package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.BookMarkDTO;

public interface BookMarkService {
	public int bookMarkInsert(BookMarkDTO dto);
	public List<BookMarkDTO> bookListSelect(String id);
	public int dataDelete(int no);
}