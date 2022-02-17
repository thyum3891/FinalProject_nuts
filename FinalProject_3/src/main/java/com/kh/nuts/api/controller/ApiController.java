package com.kh.nuts.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nuts.hospital.service.HospitalService;
import com.kh.nuts.hospital.vo.Hospital;
import com.kh.nuts.hospital.vo.HospitalParsing;
import com.kh.nuts.park.service.ParkService;
import com.kh.nuts.park.vo.Park;
import com.kh.nuts.park.vo.ParkParsing;

@Controller
public class ApiController {

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	ParkService parkService;
	
	@RequestMapping("/api/view")
	public String api(Model model) {
		
		return "api/view";
	}
	@RequestMapping("/api/park")
	public String parkParsing(Model model) {
		List<Park> parkList =null;
		try {
			parkService.deletePark();
			ParkParsing ps = new ParkParsing();
			int count = ps.getTotalCount();
			System.out.println("예상 반복 횟수 : "+count);

			int num = 1000;
			for(int i = 1;i*num<count;i++) {
				parkList=ps.passing(i,num);
				for(Park p : parkList) {
					parkService.insertPark(p);
				}
				System.out.println("공원 등록 "+i+"번째");
			}
			model.addAttribute("msg","공원api 등록 완료");
			model.addAttribute("location","/api/view");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","공원api 등록 실패");
			model.addAttribute("location","/api/view");
		}
		return "common/msg";
	}
	
	@RequestMapping("/api/hospital")
	public String hospitalParsing(Model model) {

		HospitalParsing hs = new HospitalParsing();
		List<Hospital> hospitalList = null;

		try {
			hospitalService.deleteHospital();
			int count = Integer.parseInt(hs.totalCount());
			System.out.println("예상 반복 횟수 : "+count);
			int num = 1000;
			for (int i = 1; i * num <= count; i++) {
				hospitalList = hs.parsing(i, num);
				for (Hospital h : hospitalList) {
					hospitalService.insertHospital(h);
				}
				System.out.println("병원 등록 "+i+"번째");
			}
			model.addAttribute("msg","병원api 등록 완료");
			model.addAttribute("location","/api/view");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","병원api 등록 실패");
			model.addAttribute("location","/api/view");
		}
		
		return "common/msg";

	}
}
