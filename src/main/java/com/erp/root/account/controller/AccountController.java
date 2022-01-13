package com.erp.root.account.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erp.root.account.dto.AccountDTO;
import com.erp.root.account.service.AccountService;

@Controller
@RequestMapping("account")
public class AccountController {
	@Autowired
	AccountService as;

	@GetMapping("accountlist")
	public String accountlist(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		as.accountList(model, num);
		return "account/accountlist";
	}

	@GetMapping("accountForm")
	public String accountForm(Model model,
			@RequestParam String cmd,
			@RequestParam(required = false, defaultValue = "1") int accountNo) {
		model.addAttribute("command", cmd);
		if (cmd.equals("Modify")) {
			as.accountInfo(model, accountNo);
		}
		return "account/accountForm";
	}

	@PostMapping("accountInsert")
	public void accountInsert(AccountDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		/*
		 * System.out.println("called.");
		 * System.out.println(dto.getName());
		 * System.out.println(dto.getContact());
		 * System.out.println(dto.getAddr());
		 */
		String message = as.accountInsert(dto, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}

	@PostMapping("accountModify")
	public void accountModify(AccountDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		String message = as.accountModify(dto, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}
	
	@GetMapping("accountDelete")
	public void accountDelete(@RequestParam int accountNo,
			HttpServletResponse response,
			HttpServletRequest request) {
		String message = as.accountDelete(accountNo, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}
}
