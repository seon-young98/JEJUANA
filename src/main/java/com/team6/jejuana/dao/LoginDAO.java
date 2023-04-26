package com.team6.jejuana.dao;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginDAO {
	public LoginDTO loginOk(String id, String password);
	
	//���̵��ߺ�üũ
	public int idCheckCount(String id);
	
	//ȸ������
	public int loginInsert(LoginDTO dto);
	
	//���̵�ã��
	public String idSelect(String name, String phone_num);
	
	//��й�ȣã��
	public LoginDTO idCount(String name, String id, String phone_num);
		
	//��й�ȣ ����
	public int pwdUpdate(LoginDTO dto);
}
