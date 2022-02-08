package com.kh.nuts.walking.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.walking.service.WalkingService;
import com.kh.nuts.working.vo.WalkingParty;


@Controller
public class WalkingController {
	
	@Autowired
	private WalkingService service;
	
	@RequestMapping("/walking/create")
	public String mapPolyline(Model model, String pathAll, String pathOne, String distance, String estimated_time,
			String contant, String startTime,String startDate,HttpSession session) {
		
		try {
			
			WalkingParty wp = new WalkingParty();
			wp.setContant(contant);
			wp.setWriter_id("test");
//			wp.setWriter_id(((Member)session.getAttribute("member")).getId());
			wp.setContant(contant);
			wp.setDistance(distance);
			wp.setEstimated_time(estimated_time);
			wp.setPathAll(pathAll);
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/msg";
	}
	
	
	@RequestMapping("/walking/write")
	public String walkingWrite(Model model) {
		try {
			
			
		} catch (Exception e) {
			
		}
		
		return "walking/write";
	}
	@RequestMapping("/mapView2")
	public String mapPolyline2(Model model, String path) {
		try {
			List<String> pathList = new ArrayList<String>(Arrays.asList(path.replaceAll("\\)\\,\\(","\\/").replaceAll("\\(", "").replaceAll("\\)", "").split("\\/")));
			
			
			model.addAttribute("pathList",pathList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "/home2";
	}
	
}
