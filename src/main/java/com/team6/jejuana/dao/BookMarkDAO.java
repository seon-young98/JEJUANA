package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.BookMarkDTO;

public interface BookMarkDAO {
	public int bookMarkInsert(BookMarkDTO dto);
	public List<BookMarkDTO> bookListSelect(String id);
	public int dataDelete(int no);
	//별점추가
	public int bookmarkRateck(String book_name); 
	public double bookmarkRate(String book_name); 
	

}