package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.RegisterDAO;
import com.team6.jejuana.dto.RegisterDTO;

@Service
public class RegisterServicelmpl implements RegisterService{
	//按眉积己
		//	@AutoWired, @Inject : interface甫 按眉肺 积己
		@Inject
		RegisterDAO dao;

		@Override
		public RegisterDTO loginOk(String userid, String userpwd) {
			return dao.loginOk(userid, userpwd);
		}
}
