package com.kh.nuts.notice.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.member.vo.Member;
import com.kh.nuts.notice.service.NoticeService;
import com.kh.nuts.notice.vo.Notice;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	
	@GetMapping("/list")
	public String list(Model model, String pageStr, String quary, String date) {
		int page = 1;
		
		if(pageStr != null ) {
			if(Integer.parseInt(pageStr) > 0) {
			page = Integer.parseInt(pageStr);
			}
		}
		
		if(date != null) {
			if(date.equals("")) {
				date = null;
			}
		}
		PageInfo pageInfo = new PageInfo(page, 5, service.getNoticeCount(quary, date), 10);
		List<Notice> list = service.getNoticeList(pageInfo, quary, date);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/notice/list";
	}
	
	@GetMapping("/view")
	public String view(Model model, String notice_no) {
		Notice notice = service.findByNo(notice_no);
		System.out.println();
		model.addAttribute("notice", notice);

		return "/notice/view";
	}
	
	@GetMapping("/write")
	public String writeView() {
		
		return "notice/write"; 
	}
	
	@PostMapping("/write")
	public String write(Model model, HttpServletRequest request, HttpSession session, Notice notice, MultipartFile upfile) {
		
		Member loginId = (Member)session.getAttribute("loginMember");
		if(loginId == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요");
			model.addAttribute("location", "/login");
			return "/common/msg";
		}else {
			if (loginId.getId().equals("admin") == false) {
				model.addAttribute("msg", "잘못된 접근입니다");
				model.addAttribute("location", "notice/list");
				return "/common/msg";
			}
		}
		
		if(upfile != null && upfile.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/notice";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				notice.setFilename(upfile.getOriginalFilename());
				notice.setRe_filename(renameFileName);
			}
		}
		

		int result = service.saveNotice(notice);

		if (result > 0) {
			model.addAttribute("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addAttribute("location", "/notice/list");
		} else {
			model.addAttribute("msg", "게시글이 등록을 실패하였습니다.");
			model.addAttribute("location", "/notice/list");
		}

		
		return "/common/msg";
	}
	@RequestMapping("/delete")
	public String deleteBoard(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			String notice_no) {
		
		int result = service.deleteNotice(notice_no);
		
		if (result > 0) {
			model.addAttribute("msg", "글이 삭제되었습니다.");
			model.addAttribute("location", "/notice/list");
		} else {
			model.addAttribute("msg", "글 삭제에 실패하였습니다.");
			model.addAttribute("location", "/notice/list");
		}
		
		return "/common/msg";
	}
	
	@GetMapping("/update")
	public String updateView(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			String notice_no) {

		Notice notice = service.findByNo(notice_no);
		

		if (loginMember.getId().equals("admin") ) {
			model.addAttribute("notice", notice);
			return "notice/edit";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("location", "/notice/list");
			return "/common/msg";
		}

	}
	
	@PostMapping("/update")
	public String update(Model model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			 MultipartFile reloadFile, Notice notice) {

		if(loginMember != null) {
			if (loginMember.getId().equals("admin") == false) {
				model.addAttribute("msg", "잘못된 접근입니다");
				model.addAttribute("location", "/notice/list");
				return "/common/msg";
			}
		}else {
			model.addAttribute("msg", "로그인 후 이용해주세요");
			model.addAttribute("location", "/login");
			return "/common/msg";
		}

		if (reloadFile != null && reloadFile.isEmpty() == false) {
			// 파일 저장하는 로직 구성
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/notice";
			
			if(notice.getRe_filename() != null) {
				service.deleteFile(savePath+"/"+notice.getRe_filename());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				notice.setFilename(reloadFile.getOriginalFilename());
				notice.setRe_filename(renameFileName);
			}
		}


		int result = service.saveNotice(notice);

		if (result > 0) {
			model.addAttribute("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addAttribute("location", "/notice/view?notice_no=" + notice.getNotice_no());
		} else {
			model.addAttribute("msg", "게시글이 수정에 실패하였습니다.");
			model.addAttribute("location", "/notice/update?no=" + notice.getNotice_no());
		}


		return "/common/msg";
	}
	
}


