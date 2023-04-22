package com.team6.jejuana.dao;

import com.team6.jejuana.dto.RegisterDTO;

public interface RegisterDAO {
		//추상메소드
		public RegisterDTO loginOk(String userid, String userpwd);
}
