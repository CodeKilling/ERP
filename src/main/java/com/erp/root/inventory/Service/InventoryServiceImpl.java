package com.erp.root.inventory.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.erp.root.mybatis.inventory.InventoryMapper;

@Service
public class InventoryServiceImpl implements InventoryService{
	@Autowired
	InventoryMapper mapper;
	
	@Override
	public void getInventoryStatus(Model model, int num) {
		int pageLetter = 100; //페이지당 보여질 글 개수
		int allCount = mapper.selectInventoryCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("inventory", mapper.inventoryStatus(start, end));
	}
	
}
