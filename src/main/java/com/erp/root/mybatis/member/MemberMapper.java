package com.erp.root.mybatis.member;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import com.erp.root.member.dto.MemberDTO;

public interface MemberMapper {
	public int register(MemberDTO dto);
	public MemberDTO chkId(String id);
	//public ArrayList<MemberDTO> memberList();
	public ArrayList<MemberDTO> memberList(@Param("start") int start,@Param("end") int end);
	public int selectMemberCount();
	public int modify(@Param("id") String id,@Param("pwd") String pwd,@Param("name") String name,@Param("grade") String grade, @Param("memno") String memno);
	public MemberDTO getMember(@Param("memno") String memno);
	public int delete(@Param("memno") String memno);
}
