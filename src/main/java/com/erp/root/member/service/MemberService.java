package com.erp.root.member.service;

import org.springframework.ui.Model;

import com.erp.root.member.dto.MemberDTO;

public interface MemberService {
	public int register(MemberDTO dto);
	public int userCheck(String id, String pw);
	public void memberList(Model model, int num);
	public String chkGrade(String id);
	public void memberInfo(Model model, String memno);
	public int memberModify(String id, String pwd, String name, String grade, String memno);
	public int memberDelete(String memno);
}
