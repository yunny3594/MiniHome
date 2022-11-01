package org.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mini.model.MemberVO;
import org.mini.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;

	//
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		return "/member/member";
	}

	// 회원가입
	@RequestMapping(value = "/SignUp", method = RequestMethod.GET)
	public String SignUp() {
		return "/member/SignUp";
	}

	@RequestMapping(value = "/SignUp", method = RequestMethod.POST)
	public String SignUp(MemberVO mvo) {
		ms.signup(mvo);
		return "redirect:/member";
	}

	// 회원정보리스트
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model model) {
		model.addAttribute("memberList", ms.memberList());
		return "/member/memberList";
	}

	// 회원 디테일
	@RequestMapping(value = "/memberDetail", method = RequestMethod.GET)
	public String memberDetail(MemberVO mvo, Model model) {
		model.addAttribute("memberDetail", ms.memberDetail(mvo));
		return "/member/memberDetail";
	}

	// 회원정보수정
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public String modify(MemberVO mvo, RedirectAttributes rttr) {
		ms.modify(mvo);
		rttr.addAttribute("userid", mvo.getUserid());
		return "redirect:/memberDetail";
	}

	// 회원탈퇴
	@RequestMapping(value = "/memberRemove", method = RequestMethod.GET)
	public String remove(MemberVO mvo,HttpSession session) {
		ms.remove(mvo);
		session.invalidate();
		return "redirect:/member";
	}

	// 로그인 이동
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String getLogin() {
		return "/member/Login";
	}

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String postLogin(MemberVO mvo, HttpServletRequest request) {
		MemberVO login = ms.login(mvo);
		HttpSession session = request.getSession();
		if (login != null) { // 로그인 성공
			session.setAttribute("login", login);
			return "redirect:/";
		} else {
			session.setAttribute("login", null);
			return "redirect:/Login";
		}
	}

	// 로그아웃
	@GetMapping("/Logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
