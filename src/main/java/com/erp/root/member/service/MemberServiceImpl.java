package com.erp.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.erp.root.member.dto.MemberDTO;
import com.erp.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mapper;
	
	@Override
	public int register(MemberDTO dto) {
		int result = 0;
		try {
			if(mapper.chkId(dto.getId()) == null) {
				result = mapper.register(dto);
			}else {
				System.out.println("아이디 중복.");
				result = -1;
			}
			/*
			 * if(mapper.chkId(dto.getId()).getId().equals(dto.getId())) {
			 * 
			 * }else {
			 * 
			 * }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int userCheck(String id, String pw) {
		int result = 0;
		try {
			MemberDTO dto = mapper.chkId(id);
			if(dto != null) {
				if(dto.getPwd().equals(pw)) {
					result = 1;
				}else {
					System.out.println("비번틀림.");
					result = -2;
				}
			}else {
				System.out.println("존재하지않는 아이디.");
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void memberList(Model model, int num) {
		int pageLetter = 20; //페이지당 보여질 글 개수
		int allCount = mapper.selectMemberCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("memberList", mapper.memberList(start, end));
		//model.addAttribute("memberList", mapper.memberList());
	}

	@Override
	public String chkGrade(String id) {
		MemberDTO dto = mapper.chkId(id);
		try {
			if(dto != null){
				return dto.getGrade();
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void memberInfo(Model model, String memno) {
		MemberDTO dto = mapper.getMember(memno);
		try {
			if(dto != null){
				model.addAttribute("member", dto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int memberModify(String id, String pwd, String name, String grade, String memno) {
		int result = 0;
		try {
			result = mapper.modify(id, pwd, name, grade, memno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int memberDelete(String memno) {
		int result = 0;
		try {
			result = mapper.delete(memno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
