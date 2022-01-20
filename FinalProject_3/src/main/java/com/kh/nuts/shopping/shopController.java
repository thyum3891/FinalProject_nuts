package com.kh.nuts.shopping;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class shopController {
	static private List<ShoppingVO> shopList;
	{
		if(shopList == null) {
			shopList = new Passing().passing();
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
	
}
