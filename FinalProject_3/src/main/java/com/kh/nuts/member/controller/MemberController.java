package com.kh.nuts.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.member.service.MemberService;
import com.kh.nuts.member.vo.Member;
import com.kh.nuts.walking.service.WalkingService;
import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;

@SessionAttributes("loginMember")

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	WalkingService wpService;
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete(); 
		
		return "redirect:/";
	}
	

	
	@GetMapping("/member/enroll")
	public String enrollPage() {
		return "member/enroll";
	}
	
	@PostMapping("/member/enroll")
	public String enroll(Member member, Model model, MultipartFile upfile, HttpServletRequest request) {
		
		try {
			if(upfile != null && upfile.isEmpty() == false) {
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/member";
				String renameFileName = service.saveFile(upfile, savePath); 

				if (renameFileName != null) {
					member.setProfile_ori_name(upfile.getOriginalFilename());
					member.setProfile_re_name(renameFileName);
				}
			}
			
			int result = service.saveMember(member);
			
			if(result > 0) {
				model.addAttribute("msg", "회원 가입에 성공하였습니다.");
				model.addAttribute("location", "/");
			}else {
				model.addAttribute("msg", "회원 가입에 실패하였습니다. 다시 한번 확인해주세요.");
				model.addAttribute("location", "/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/msg";
	}
	@PostMapping("/member/update")
	public String updateMember(Member member, Model model, MultipartFile upfile, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		try {
			if(upfile != null && upfile.isEmpty() == false) {
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/member";
				String renameFileName = service.saveFile(upfile, savePath); 
				
				if (renameFileName != null) {
					member.setProfile_ori_name(upfile.getOriginalFilename());
					member.setProfile_re_name(renameFileName);
				}
			}else {
				member.setProfile_ori_name(loginMember.getProfile_ori_name());
				member.setProfile_re_name(loginMember.getProfile_re_name());
			}
			
			int result = service.updateMember(member);
			
			if(result > 0) {
				model.addAttribute("msg", "회원 정보 수정 완료");
				model.addAttribute("location", "/");
				model.addAttribute("loginMember",member); 
				
			}else {
				model.addAttribute("msg", "회원 정보 수정에 실패하였습니다. 다시 한번 확인해주세요.");
				model.addAttribute("location", "/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/msg";
	}
	
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String id){
		boolean result = service.validateById(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(Model model, String userId, String userPwd) {
		
		try {
			Member loginMember = service.login(userId, userPwd);
			
			if(loginMember != null) {
				model.addAttribute("loginMember",loginMember); 
				return "redirect:/";
			}else {
				model.addAttribute("msg","아이디나 패스워드가 일치하지 않습니다!");
				model.addAttribute("location", "/");
				return "common/msg";
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/msg";
	}
	@GetMapping("/login")
	public String loginPage() {

		return "member/login";
	}
	
	@RequestMapping("/myPage")
	public String myPage(Model model,HttpSession session) {
		List<WalkingParty> wpList = null;
		List<WalkingRequest> partnerList = null;
		try {
			Member loginId = (Member)session.getAttribute("loginMember");
			
			if(loginId != null) {
				wpList = wpService.selectMyParty(loginId.getId());
				model.addAttribute("wpList", wpList);
				partnerList = wpService.selectWalkingPartner(loginId.getId());
				model.addAttribute("partnerList", partnerList);
			}else {
				model.addAttribute("msg","로그인이 필요한 서비스입니다.");
				model.addAttribute("location", "/");
				return "common/msg";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/myPage";
	}
	@RequestMapping("/myPageModal")
	public String myPageModal(Model model, String party_no) {
		List<WalkingRequest> reqList = null;
		int count = 0;
		try {
				count = wpService.ReqCount(party_no);
				reqList = wpService.selectReqIdInfo(party_no);
				model.addAttribute("reqList", reqList);
				model.addAttribute("count",count);
				model.addAttribute("party_no",party_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/myPageModal";
	}
	
	@ResponseBody
	@RequestMapping("/myPage/ReqUpdate")
	public ResponseEntity<Map<String, Object>> myPageReqUpdate(String req_no, String stat) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = wpService.partyReqUdate(req_no, stat);
			map.put("validate", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	@ResponseBody
	@RequestMapping("/myPage/partyStatUpdate")
	public ResponseEntity<Map<String, Object>> myPagePartyUpdate(String party_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = wpService.partyStatUdate(party_no);
			map.put("validate", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
}
