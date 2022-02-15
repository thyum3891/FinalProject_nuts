package com.kh.nuts.walking.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.nuts.walking.service.WalkingService;
import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WalkingController {
	
	@Autowired
	private WalkingService service;
	
	@RequestMapping("/walking/create")
	public String create(Model model, String pathAll, String pathOne, String distance, String estimated_time,
			String contant, String startTime,String startDate,HttpSession session) {
		
		try {
			
			WalkingParty wp = new WalkingParty();
			wp.setContant(contant);
			wp.setWriter_id("test");
//			wp.setWriter_id(((Member)session.getAttribute("member")).getId());
			wp.setContant(contant);
			wp.setDistance(distance);
			wp.setEstimated_time(estimated_time);
			pathAll = pathAll.replaceAll("\\)\\,\\(","\\/").replaceAll("\\(", "").replaceAll("\\)", "");
			System.out.println(pathAll.split("/"));
			wp.setPathAll(pathAll.split("/"));
			wp.setPathOne(pathOne);
			wp.setStart_date(startDate);
			wp.setStart_time(startTime);
			
			int result = service.insertWorkingParty(wp);
			
			System.out.println(wp);
			System.out.println(result);
			
			if(result>0) {
			model.addAttribute("msg", "모임이 등록되었습니다.");
			}else {
				model.addAttribute("msg", "등록에 실패하였습니다.");
			}
			model.addAttribute("location", "/walking/write");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/msg";
	}
	
	
	@RequestMapping("/walking/write")
	public String walkingWrite(Model model) {
		try {
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "walking/write";
	}
	@RequestMapping("/walking/view")
	public String walkingView(Model model) {
		try {
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "walking/view";
	}
	
	@RequestMapping("/walking/view2")
	public String walkingView2(Model model, String lat, String lon, String searchDate, String writerName) {
		List<WalkingParty> wpList = null;
		String reqStr = null;
		if(searchDate == null||searchDate.equals("")||searchDate.length() < 1) {
			searchDate = "";
		}
		try {
			reqStr = service.selectReqNo();
			System.out.println(reqStr);
			if(searchDate == null||searchDate.equals("")||searchDate.length() < 1) {
				System.out.println("셀렉트 올");
				wpList = service.selectAll(lat, lon, writerName);
				model.addAttribute("date","");
				model.addAttribute("nickName","");
			}else {
				System.out.println("셀렉트 서치");
				wpList = service.selectSearch(lat,lon, searchDate, writerName);
			}
			System.out.println(writerName);
			model.addAttribute("myLat",lat);
			model.addAttribute("myLng",lon);
			model.addAttribute("wpList",wpList);
			model.addAttribute("date",searchDate);
			model.addAttribute("nickName",writerName);
			model.addAttribute("reqStr",reqStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "walking/view2";
	}
	@RequestMapping("/walking/viewMap")
	public String walkingViewMap(Model model) {
		//, String lat, String lon, String searchDate, String writerName
		String lat = "37.480468681520065" ;
		String lon = "126.96437473799332";
		String searchDate = "2022/02/10";
		String writerName = "";
		try {
			if(searchDate.equals("default")) {
				searchDate = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
				System.out.println(searchDate);
			}
			System.out.println(writerName);
			List<WalkingParty> wpList = service.selectSearch(lat,lon, searchDate, writerName);
			
			System.out.println(wpList);
			model.addAttribute("myLat",lat);
			model.addAttribute("myLng",lon);
			model.addAttribute("wpList",wpList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/walking/viewMap";
	}
	
	@ResponseBody
	@PostMapping("/walking/partyReq")
	public ResponseEntity<Map<String,Object>> partyReqCreat(String partyNo, String reqId, String respId){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(partyNo);
		try {
		} catch (Exception e) {
			// TODO: handle exception
		}
			
		boolean creatStat = service.insertWalkingReq(partyNo, reqId, respId);
		map.put("creatStat", creatStat);
		
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
//	console.log('btn${wp.party_no}');
//	console.log('${wp.party_no}'+'${testId}');
//	var reqNo = '${wp.party_no}'+'${testId}';
//	reqFunction('btn${wp.party_no}', reqNo);
//	function reqFunction(btnId, reqNo){
//		
//		const btnIdDoc = document.getElementById(btnId);
//		
//		if(reqToStr.indexOf(reqNo) >= 0){
//			btnIdDoc.disabled = true;	
//		}else{
//			
//		}
//		
//	}
}
