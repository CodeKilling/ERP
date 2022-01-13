package com.erp.root.account.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.erp.root.account.dto.AccountDTO;

public interface AccountService {
	public void accountList(Model model, int num);
	public String accountInsert(AccountDTO dto, HttpServletRequest request);
	public void accountInfo(Model model, int accountNo);
	public String accountModify(AccountDTO dto, HttpServletRequest request);
	public String accountDelete(int accountNo, HttpServletRequest request);
}
