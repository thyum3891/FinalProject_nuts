package com.kh.nuts.hotdog.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hotdog.service.HotdogService;
import com.kh.nuts.hotdog.vo.Hotdog;
import com.kh.nuts.hotdog.vo.HotdogLike;
import com.kh.nuts.member.vo.Member;

@Controller
public class HotdogController {
	
	@Autowired
	HotdogService service;
	
	@RequestMapping("/hotdog/list")
	public String list(Model model, String pageStr, String title, String nick_name) {
		
			try {
				if(title == null || title.length() < 1) {
					title = "";
				}
				if(nick_name == null || nick_name.length() < 1) {
					nick_name = "";
				}
				if (pageStr == null) {
				pageStr = "1";
				}
					int page = Integer.parseInt(pageStr);
					if(page < 1) {
						page = 1;
					}
				
				
				PageInfo pageInfo = new PageInfo(page, 10, service.selectCount(title,nick_name), 10);
				List<Hotdog> list = service.selectHotdogList(pageInfo, title, nick_name);
				model.addAttribute("list", list);
				model.addAttribute("pageInfo", pageInfo);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		
		return "/hotdog/list";
	}
	
	@GetMapping("/hotdog/write")
	public String write(Model model) {
		return "/hotdog/write";
	}
	
	@GetMapping("/hotdog/edit")
	public String edit(Model model, String hot_no, HttpSession session ) {
		Member loginId = (Member)session.getAttribute("loginMember");
		if(loginId == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("location", "/login");
			return "common/msg";
		}
		Hotdog hotdog = service.selectHotdogDetail(hot_no);
		if(loginId.getId().equals(hotdog.getWrite()) == false) {
			model.addAttribute("msg","잘못 된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		model.addAttribute("hotdog", hotdog);
		
		return "/hotdog/edit";
	}
	
	@PostMapping("/hotdog/write")
	public String write(Model model, MultipartHttpServletRequest multiReq, HttpServletRequest request, Hotdog hotdog, HttpSession session) {
		Member loginId = (Member)session.getAttribute("loginMember");
		
		if(loginId == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("location", "/login");
			return "common/msg";
		}
		
		try {
			List<MultipartFile> mtList = multiReq.getFiles("upfiles");
			
			
				if(mtList.isEmpty()==false||mtList !=null) {
					List<String> orifList = new ArrayList<String>();
					List<String> refList = new ArrayList<String>();
				for(MultipartFile upfile : mtList) {
					String rootPath = request.getSession().getServletContext().getRealPath("resources");
					String savePath = rootPath + "/upload/hotdog";
					String renameFileName = service.saveFile(upfile, savePath); 
					if (renameFileName != null) {
						orifList.add(upfile.getOriginalFilename());
						refList.add(renameFileName);
					}
				}
				hotdog.setFilename(orifList.toString());
				hotdog.setRe_filename(refList.toString());
				}
			int result = service.insertHotdog(hotdog);
			
			if(result > 0) {
				model.addAttribute("msg", "게시글 등록 성공");
				model.addAttribute("location", "/hotdog/list");
			}else {
				model.addAttribute("msg", "게시글 등록 실패");
				model.addAttribute("location", "/hotdog/list");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "common/msg";
	}
	@PostMapping("/hotdog/edit")
	public String edit(Model model, MultipartHttpServletRequest multiReq, HttpServletRequest request, Hotdog hotdog, HttpSession session) {
		Member loginId = (Member)session.getAttribute("loginMember");
		
		if(loginId == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("location", "/login");
			return "common/msg";
		}
		if(loginId.getId().equals(hotdog.getWrite()) == false) {
			model.addAttribute("msg","잘못 된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		try {
			List<MultipartFile> mtList = multiReq.getFiles("upfiles");
			
			
			if(mtList.isEmpty()==false||mtList !=null) {
				List<String> orifList = new ArrayList<String>();
				List<String> refList = new ArrayList<String>();
				for(MultipartFile upfile : mtList) {
					String rootPath = request.getSession().getServletContext().getRealPath("resources");
					String savePath = rootPath + "/upload/hotdog";
					String renameFileName = service.saveFile(upfile, savePath); 
					if (renameFileName != null) {
						orifList.add(upfile.getOriginalFilename());
						refList.add(renameFileName);
					}
				}
				hotdog.setFilename(orifList.toString());
				hotdog.setRe_filename(refList.toString());
			}
			int result = service.insertHotdog(hotdog);
			
			if(result > 0) {
				model.addAttribute("msg", "게시글 수정 성공");
				model.addAttribute("location", "/hotdog/list");
			}else {
				model.addAttribute("msg", "게시글 수정 실패");
				model.addAttribute("location", "/hotdog/list");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "common/msg";
	}
	
	@RequestMapping("/hotdog/detail")
	public String detail(Model model, String hot_no,HttpSession session) {
		Member loginId = (Member)session.getAttribute("loginMember");
		try {
			if(loginId != null) {
			HotdogLike like = service.selectLike((hot_no+loginId.getId()));
			System.out.println((hot_no+loginId.getId()));
			System.out.println(like);
			model.addAttribute("like",like);
			}
			Hotdog hotdog = service.selectHotdogDetail(hot_no);
			model.addAttribute("hotdog",hotdog);
			
			System.out.println(hotdog.getRe_filename());
			if(hotdog.getRe_filename() != null) {
				List<String> fileList = Arrays.asList(hotdog.getRe_filename().replaceAll("\\[", "").replaceAll("\\]", "").split(", "));
				model.addAttribute("fileList",fileList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/hotdog/detail";
	}
	
	@RequestMapping("/hotdog/like")
	public String like(Model model, HotdogLike hotdogLike, HttpSession session) {
		Member loginId = (Member)session.getAttribute("loginMember");
		if(loginId == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("location", "/");
		}else {
			System.out.println(hotdogLike);
			int result = service.insertLike(hotdogLike);
			
			if(result > 0) {
				model.addAttribute("msg", "좋아요 +1 :)");
			}else {
				model.addAttribute("msg", "좋아요에 실패하였습니다.");
			}
			
			model.addAttribute("location", "/hotdog/detail?hot_no="+hotdogLike.getHot_no());
		}
		
		return "common/msg";
		
	}
	@RequestMapping("/hotdog/delete")
	public String delete(Model model, String hl_id, String hot_no, HttpSession session) {
		Member loginId = (Member)session.getAttribute("loginMember");
		if(loginId == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("location", "/");
		}else {
			int result = service.deleteLike(hl_id);
			
			if(result > 0) {
				model.addAttribute("msg", "좋아요 취소 :(");
			}else {
				model.addAttribute("msg", "좋아요 취소에 실패하였습니다.");
			}
			
			model.addAttribute("location", "/hotdog/detail?hot_no="+hot_no);
		}
		
		return "common/msg";
		
	}
	
}
