package com.kh.nuts.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.nuts.shop.vo.Shop;
import com.kh.nuts.shop.vo.ShopParsing;

@Service
public class ShopServiceImpl implements ShopService {

		ShopParsing sp = new ShopParsing();
	
	@Override
	public List<Shop> shopListByMain() {
		
		List<Shop> resultList = null;
		List<Shop> shopList = sp.passing("20","반려견용품");
		
		if(shopList.size() > 4) {
		resultList = shopList.subList(0, 4);
		}else {
			resultList = shopList;
		}
		
		
		
		
		
		return resultList;
	}

}
