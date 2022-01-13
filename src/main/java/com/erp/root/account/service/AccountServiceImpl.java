package com.erp.root.account.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.erp.root.account.dto.AccountDTO;
import com.erp.root.mybatis.account.AccountMapper;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	AccountMapper mapper;
	
	@Override
	public void accountList(Model model, int num) {
		int pageLetter = 20; //페이지당 보여질 글 개수
		int allCount = mapper.selectAccountCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("accountList", mapper.accountList(start, end));
	}

	@Override
	public String accountInsert(AccountDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.accountInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 1) {
			msg = "Account Insert Success.";
			url = "/account/accountlist";
		}else {
			msg = "Account Insert Failed.";
			url = "/account/accountForm?cmd=Insert";
		}
		return getMessage(request, msg, url);
	}

	private String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "'; </script>";
		return message;
	}

	@Override
	public void accountInfo(Model model, int accountNo) {
		model.addAttribute("account",mapper.accountInfo(accountNo));
	}

	@Override
	public String accountModify(AccountDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.accountModify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 1) {
			msg = "Account Modify Success.";
			url = "/account/accountlist";
		}else {
			msg = "Account Modify Failed.";
			url = "/account/accountForm?cmd=Modify&accountNo="+dto.getAccountNo();
		}
		return getMessage(request, msg, url);
	}

	@Override
	public String accountDelete(int accountNo, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.accountDelete(accountNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 1) {
			msg = "Account Delete Success.";
			url = "/account/accountlist";
		}else {
			msg = "Account Delete Failed.";
			url = "/account/accountlist";
		}
		return getMessage(request, msg, url);
	}
	
}
