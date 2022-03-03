package com.kh.nuts.park.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.park.service.ParkService;
import com.kh.nuts.park.vo.Park;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/park")
@Controller
public class ParkController {
	
	@Autowired
	private ParkService service;
	
	@RequestMapping("/list")
	public String list (Model model, String lat, String lng, String addr) {
		log.info("공원 리스트 불러옴");
		if(lat != null && lng != null) {
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		}
		return "/park/list";
	}
	@RequestMapping("/best")
	public String best (Model model, int no) {
				List<Park> list = new ArrayList<Park>();
				Park park = new Park();
				park.setManageNo("1");
				park.setParkNm("보라매 공원");
				park.setLatitude("37.49374329208935");
				park.setLongitude("126.91880862691224");
				park.setRdnmadr("서울특별시 동작구 여의대방로20길 33");
				park.setPhoneNumber("02-2181-1113");
				list.add(park);
				park = new Park();
				park.setManageNo("2");
				park.setParkNm("노을 공원");
				park.setLatitude("37.573644406674056");
				park.setLongitude("126.87519866738651");
				park.setRdnmadr("서울 마포구 하늘공원로 108-2");
				park.setPhoneNumber("02-120");	
				list.add(park);
				 park = new Park();
				park.setManageNo("3");
				park.setParkNm("서울숲 공원");
				park.setLatitude("37.54445583333356");
				park.setLongitude("127.03750677109572");
				park.setRdnmadr("서울 성동구 뚝섬로 273");
				park.setPhoneNumber("02-460-2905");
				list.add(park);
				 park = new Park();
				park.setManageNo("4");
				park.setParkNm("선유도 공원");
				park.setLatitude("37.54314558618999");
				park.setLongitude("126.90006855177582");
				park.setRdnmadr("서울 영등포구 선유로 343");
				park.setPhoneNumber("02-2181-1113");
				list.add(park);
				 park = new Park();
				park.setManageNo("5");
				park.setParkNm("한강 공원");
				park.setLatitude("37.52502914459228");
				park.setLongitude("126.93697497991596");
				park.setRdnmadr("서울특별시 영등포구 여의동로 330");
				park.setPhoneNumber("02-3780-0561");				
				list.add(park);
				
				switch (no) {
				case 1:
					model.addAttribute("lat","37.49374329208935");
					model.addAttribute("lng","126.91880862691224");
					break;
				case 2:
					model.addAttribute("lat","37.573644406674056");
					model.addAttribute("lng","126.87519866738651");
					break;
				case 3:
					model.addAttribute("lat","37.54445583333356");
					model.addAttribute("lng","127.03750677109572");
					break;
				case 4:
					model.addAttribute("lat","37.54314558618999");
					model.addAttribute("lng","126.90006855177582");
					break;
				case 5:
					model.addAttribute("lat","37.52502914459228");
					model.addAttribute("lng","126.93697497991596");
					break;

				}
			System.out.println(list);
			model.addAttribute("list", list);
		return "/park/best";
	}
	
	@RequestMapping("/parkMap")
	public String map (Model model, String lat, String lng, String addr) {
		
			List<Park> list = service.getParkList(lat, lng, addr);
			
			model.addAttribute("list", list);
			model.addAttribute("lat", lat);
			model.addAttribute("lng", lng);
	
		
		return "/park/parkMap";
		
	}
	@RequestMapping("/parkMap2")
	public String map2 (Model model, String lat, String lng, String addr) {
		
		List<Park> list = service.getParkList(lat, lng, addr);
		
		model.addAttribute("list", list);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		
		
		return "/park/list3";
		
	}
	

}
