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
		List<Shop> resultList = sp.passing("10");
		int index = resultList.size();
		
		for(int i=4; i<index;i++) {
			resultList.remove(i);
		}
		
		
		return resultList;
	}

}
