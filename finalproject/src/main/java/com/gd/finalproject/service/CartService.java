package com.gd.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.mapper.CartMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
}
