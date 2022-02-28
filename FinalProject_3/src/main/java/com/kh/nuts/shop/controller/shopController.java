package com.kh.nuts.shop.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nuts.shop.vo.Shop;
import com.kh.nuts.shop.vo.ShopParsing;

@RequestMapping("/shop")
@Controller
public class shopController {

	static private List<Shop> shopList;
	
	@GetMapping("/search")
	public String shop(Model model, @RequestParam(defaultValue = "1") int page, String category, String query) {
		List<Shop> tempShopList = null;
		List<Shop> shopList1 = null;
		List<Shop> shopList2 = null;
		List<Shop> best = null;
		if(category == null) {
			category = "반려견용품";
		}
		if(query == null) {
			query = "";
		}
		System.out.println(category+query);
		shopList = new ShopParsing().passing("100",category+" "+query);
			
		
		System.out.println(shopList.size());
		
		int maxPage = 0;
		maxPage = shopList.size()/10;
		if(shopList.size()%10 > 0) {
			maxPage += 1;
		}
		if(maxPage > 5) {
			maxPage = 5;
		}
		
		if(shopList.size() > 10) {
		
			tempShopList = shopList.subList((page-1) * 10, page * 10 );
		}else {
			tempShopList = shopList;
		}
		
		if (tempShopList.size() > 5) {
			shopList1 = tempShopList.subList(0,5);
			shopList2 = tempShopList.subList(5,10);
			best = tempShopList.subList(0, 3);
		}else {
			shopList1 = tempShopList;
			if (tempShopList.size()>3) {
				best = tempShopList.subList(0, 3);
			}else {
				best = tempShopList;
			}
		}
			
		
		
		model.addAttribute("shopList1",shopList1);
		model.addAttribute("shopList2",shopList2);
		model.addAttribute("best",best);
		model.addAttribute("page",page);
		model.addAttribute("maxPage",maxPage);
		
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
