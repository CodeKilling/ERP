package com.erp.root.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.root.common.Common;
import com.erp.root.common.session.MemberSessionName;
import com.erp.root.member.dto.MemberDTO;
import com.erp.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	@Autowired
	MemberService ms;
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("membership")
	public String membership() {
		//System.out.println("membership() : called.");
		return "member/membership";
	}
	
	@PostMapping("register")
	public void register(MemberDTO dto, HttpServletResponse response) throws IOException {
		System.out.println("register() : called.");
		/*
		System.out.println("id = " + dto.getId());
		System.out.println("pwd = " + dto.getPwd());
		System.out.println("name = " + dto.getName());
		*/
		int result = 0;
		try {
			result = ms.register(dto);
			response.setContentType("text/html; charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("result = " + result);
		if(result == 1) {
			//return "redirect:login";
			Common.alertAndMovePage(response, "Register Success.", "login");
		}else if(result == -1) {
			System.out.println("result is -1 ? = " + result);
			Common.alertAndMovePage(response, "Register Fail. : your Id is already in use on this server.", "membership");
		}
		//return "member/membership";
	}
	
	@PostMapping("userlogin")
	public String userlogin(@RequestParam String id
						   ,@RequestParam String pwd
						   ,RedirectAttributes rs) {
		System.out.println("userlogin : called.");
		//System.out.println("id = " + id);
		//System.out.println("pwd = " + pw);
		int result = ms.userCheck(id, pwd);
		if(result == 1) {
			rs.addAttribute("id",id);
			return "redirect:successLogin";
		}else if(result == -2) {
			rs.addFlashAttribute("msg","wrong password");
			return "redirect:login";
		}else {
			rs.addFlashAttribute("msg","id is not exist");
			return "redirect:login";
		} 
	}
	
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id
							   ,HttpSession session) {
		session.setAttribute(LOGIN, id);
		session.setAttribute(GRADE, ms.chkGrade(id));
		return "redirect:../index";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute(LOGIN) != null) {
			session.invalidate();
		}
		return "redirect:login";
	}
	
	@GetMapping("memberlist")
	public String memberlist(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		ms.memberList(model, num);
		return "member/memberlist";
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, @RequestParam String memno) {
		ms.memberInfo(model, memno);
		return "member/memberinfo";
	}
	
	@PostMapping("memberModify")
	public String memberModify(@RequestParam String id
							  ,@RequestParam String pwd
							  ,@RequestParam String name
							  ,@RequestParam String grade
							  ,@RequestParam String memno
							  ,RedirectAttributes rs) {
		int result = ms.memberModify(id, pwd, name, grade, memno);
		if(result == 1) {
			rs.addFlashAttribute("msg","Modify Success.");
			return "redirect:memberlist";
		}else {
			rs.addFlashAttribute("msg","Modify Failed.");
			return "redirect:memberInfo?memno="+memno;
		}
	}
	
	@GetMapping("memberDelete")
	public String memberDelete(@RequestParam String memno
							   ,RedirectAttributes rs) {
		//System.out.println("memno = " + memno);
		int result = ms.memberDelete(memno);
		if(result == 1) {
			rs.addFlashAttribute("msg","Delete Success.");
		}else {
			rs.addFlashAttribute("msg","Delete Failed.");
		} 
		return "redirect:memberlist";
	}
}
