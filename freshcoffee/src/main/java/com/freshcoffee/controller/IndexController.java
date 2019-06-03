package com.freshcoffee.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.freshcoffee.domain.product.ProductDTO;
import com.freshcoffee.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
//	private static final Logger logger = LoggerFactory.getLogger(IndexController.class); @Slf4j를 (lombok을 사용하기때문) 생략 가능
//	lgger.info("");
	@Inject
	private ProductService service;
	
	@RequestMapping("/")
	public String index(Model model) {
//		log.info(">>>> Index 페이지");
		HashMap<String, List<ProductDTO>> map = service.productList();
		model.addAttribute("pLists", map);
		
		return "index";
	}
}
