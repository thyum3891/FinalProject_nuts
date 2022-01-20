package com.kh.nuts.mapController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MapController {
	@RequestMapping("/mapView")
	public String mapPolyline(Model model, String path) {
		try {
			System.out.println(path);
			
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
