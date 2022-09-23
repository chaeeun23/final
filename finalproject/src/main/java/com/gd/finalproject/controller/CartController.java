package com.gd.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gd.finalproject.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired CartService cartService;
	
	
}
