package com.kh.nuts.shop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.shop.vo.ShopParsing;
import com.kh.nuts.shop.vo.Shop;


@Controller
public class shopController {
	static private List<Shop> shopList;
	{
		if(shopList == null) {
			shopList = new ShopParsing().passing("100");
		}
	}
	
	@RequestMapping("/shop/list")
	public String shop(Model model) {
		try {
			model.addAttribute("shopList",shopList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/shop/list";
	}
	@RequestMapping("/test")
	public String test(Model model) {
		try {
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/common/header";
	}
	
}
