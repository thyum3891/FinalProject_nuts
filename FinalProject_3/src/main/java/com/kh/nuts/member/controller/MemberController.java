package com.kh.nuts.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.member.service.MemberService;
import com.kh.nuts.member.vo.Member;

@SessionAttributes("loginMember")

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete(); // 세션을 종료하는 코드!
		
		return "redirect:/";
	}
	
	@GetMapping("/member/enroll")
	public String enrollPage() {
		return "member/enroll";
	}
	
	@PostMapping("/member/enroll")
	public String enroll(Member member, Model model, MultipartFile upfile, HttpServletRequest request) {
		
		System.out.println(member);
		try {
			if(upfile != null && upfile.isEmpty() == false) {
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/member";
				System.out.println(savePath);
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
	
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String id){
		System.out.println(id);
		boolean result = service.validateById(id);
		System.out.println(result);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(Model model, String userId, String userPwd) {
		
		try {
			Member loginMember = service.login(userId, userPwd);
			
			if(loginMember != null) {
				model.addAttribute("loginMember",loginMember); // 어노테이션을 통해 Session으로 처리되는 코드 
				return "redirect:/";
			}else {
				model.addAttribute("msg","아이디나 패스워드가 일치하지 않습니다!");
				model.addAttribute("location", "/");
				
				
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
	
}
