package com.exam.pro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.pro.service.UserInfoService;
import com.exam.pro.vo.UserInfoVO;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoService uiService;

	@GetMapping("/join")
	public String goJoin() {
		return "user/join";
	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserInfoVO user, Model m) {
		user.setUiBirth(user.getUiBirth().replace("-", ""));
		m.addAttribute("msg", "회원가입에 실패하였습니다.");
		m.addAttribute("url", "/join");
		if(uiService.getUserInfoVOByUiId(user) != null) {
			m.addAttribute("msg", "이미 등록되었습니다.");
			m.addAttribute("url", "/join");
		}else if(uiService.join(user)) {
			m.addAttribute("msg", "회원가입 되었습니다.");
			m.addAttribute("url", "/login");
		}
		return "common/msg";
	}
	
	@GetMapping("/login")
	public String goLogin() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserInfoVO userInfo, HttpSession session,Model m) {
		String msg="아이디 비밀번호를 확인해주세요.";
		String url = "/login";
		if(uiService.login(userInfo, session)) {
			msg = "로그인 성공";
			url = "/";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "common/msg";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "user/profile";
	}
}
