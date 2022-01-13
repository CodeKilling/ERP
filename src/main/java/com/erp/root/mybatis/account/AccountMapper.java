package com.erp.root.mybatis.account;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.erp.root.account.dto.AccountDTO;

public interface AccountMapper {
	public int selectAccountCount();
	public ArrayList<AccountDTO> accountList(@Param("start") int start, @Param("end") int end);
	public int accountInsert(AccountDTO dto);
	public AccountDTO accountInfo(@Param("accountNo") int accountNo);
	public int accountModify(AccountDTO dto);
	public int accountDelete(@Param("accountNo") int accountNo);
}
