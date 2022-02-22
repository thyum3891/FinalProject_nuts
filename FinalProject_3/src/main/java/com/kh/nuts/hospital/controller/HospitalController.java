package com.kh.nuts.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hospital.service.HospitalService;
import com.kh.nuts.hospital.vo.Hospital;
import com.kh.nuts.hospital.vo.HospitalComment;

@Controller
public class HospitalController {
	
	@Autowired
	private HospitalService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@RequestMapping("/hospital/view")
	public String hospitalView(Model model, String addr, String title, String pageStr) {
		int page = 0;
		if(addr==null) {
			addr = "";
		}
		if(title==null) {
			title = "";
		}
		if(pageStr == null||pageStr.length()<1||pageStr.equals("0")) {
		 page = 1;
		}else {
			page = Integer.parseInt(pageStr);
		}
		List<Hospital> list = null;
		List<Hospital> listAll = null;
		try {
			int count = service.selectCountbyHospital(addr, title);
			System.out.println(count);
			PageInfo pageInfo = new PageInfo(page, 5, count, 10);
			list = service.selectHospitalBySearch(addr, title, pageInfo);
			System.out.println(list);
			listAll = service.selectHospital(addr, title);
			model.addAttribute("hospList", list);
			model.addAttribute("pageInfo",pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "hospital/view";
	}
	
	@RequestMapping("/hospital/commentWrite")
	public String hospitalCommentWrite(Model model, MultipartFile upfile, HttpServletRequest request) {
		HospitalComment hospitalComment = new HospitalComment();
		if(upfile != null && upfile.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/hospital";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				hospitalComment.setOriginalFileName(upfile.getOriginalFilename());
				hospitalComment.setRenamedFileName(renameFileName);
			}
		}
		
		return "hospital/commentWrite";
	}
}
