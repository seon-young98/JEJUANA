package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ReviewRateDAO;

@Service
public class ReviewRateServiceImpl implements ReviewRateService {
	@Inject
	ReviewRateDAO dao;
	
}
