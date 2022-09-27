package com.gd.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
	
}
