package com.kh.nuts.shoppingController;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.shoppingVO.ShoppingParsing;
import com.kh.nuts.shoppingVO.ShoppingVO;


@Controller
public class shopController {
	static private List<ShoppingVO> shopList;
	{
		if(shopList == null) {
			shopList = new ShoppingParsing().passing();
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
