package com.team6.jejuana.service;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginService{
	public LoginDTO loginOk(String id, String password);
	
	//���̵� �ߺ��˻�
	public int idCheckCount(String id);
	
	//ȸ������
	public int loginInsert(LoginDTO dto);
	
	//아이디찾기
	public String idSelect(String name, String phone_num);
	
	//비밀번호찾기
	public LoginDTO idCount(String name, String id, String phone_num);
		
	//비밀번호 수정
	public int pwdUpdate(LoginDTO dto);
}
