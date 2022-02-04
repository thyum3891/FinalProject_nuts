package com.kh.nuts.working.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class WorkingController {
	@RequestMapping("/mapView")
	public String mapPolyline(Model model, String pathAll, String pathStart, String distance, String time) {
		try {
			System.out.println(pathAll);
			System.out.println(pathStart);
			System.out.println(distance);
			System.out.println(time);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "/home";
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
