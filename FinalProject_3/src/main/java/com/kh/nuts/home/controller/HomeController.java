package com.kh.nuts.home.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hospital.service.HospitalService;
import com.kh.nuts.hospital.vo.Hospital;
import com.kh.nuts.hotdog.service.HotdogService;
import com.kh.nuts.hotdog.vo.Hotdog;
import com.kh.nuts.notice.service.NoticeService;
import com.kh.nuts.notice.vo.Notice;
import com.kh.nuts.park.service.ParkService;
import com.kh.nuts.shop.service.ShopService;
import com.kh.nuts.shop.vo.Shop;
import com.kh.nuts.walking.service.WalkingService;
import com.kh.nuts.walking.vo.WalkingParty;

@Controller
public class HomeController {
	
	@Autowired
	WalkingService wpService;
	
	@Autowired
	ParkService parkService;
	
	@Autowired
	HospitalService hpService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	HotdogService hotdogService;
	
	@RequestMapping("/")
	public String main(Model model) {
		
		List<Hospital> hospList = null;
		List<Notice> noticeList = null;
		List<Hotdog> hotdogList = null;
		int count = hpService.selectCountbyHospital("", "");
		System.out.println(count);
		PageInfo pageInfo = new PageInfo(1, 1, count, 6);
		hospList = hpService.selectHospitalBySearch("", "", pageInfo);
		model.addAttribute("hospList", hospList);
		model.addAttribute("pageInfo",pageInfo);
		
		
		List<Shop> shopList = shopService.shopListByMain();
		model.addAttribute("shopList", shopList);
		
		pageInfo = new PageInfo(1, 1, count, 5);
		
		noticeList = noticeService.getNoticeList(pageInfo, null, null);
		System.out.println(noticeList);
		model.addAttribute("noticeList", noticeList);
		
		hotdogList = hotdogService.selectHotdogList(pageInfo, "", "");
		model.addAttribute("hotdogList", hotdogList);
		
		
		return "home/homeView";
	}
	
	@RequestMapping("home/wpAjax")
	public String wpAjax(Model model, String lat, String lon) {
		
		List<WalkingParty> wpList = null;
		String reqStr = null;
		try {
			reqStr = wpService.selectReqNo();
			wpList = wpService.selectAll(lat, lon, "");
			model.addAttribute("myLat",lat);
			model.addAttribute("myLng",lon);
			model.addAttribute("wpList",wpList);
			model.addAttribute("reqStr",reqStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "home/wpAjax";
	}
	

}
