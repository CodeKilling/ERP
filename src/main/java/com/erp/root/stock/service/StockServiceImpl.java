package com.erp.root.stock.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.erp.root.common.Common;
import com.erp.root.mybatis.stock.StockMapper;
import com.erp.root.stock.dto.StockDTO;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	StockMapper mapper;
	
	@Override
	public void getStockProductList(Model model) {
		try {
			model.addAttribute("product",mapper.getStockProductList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void getStockAccountList(Model model) {
		try {
			model.addAttribute("account",mapper.getStockAccountList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String stockInsert(StockDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			//result = mapper.stockInsert(dto);
			mapper.stockInsert(dto);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Stock Insert Success.";
			url = "/stock/stockList";
		}else {
			msg = "Stock Insert Failed.";
			url = "/stock/stockForm";
		}
		return Common.getMessage(request, msg, url);
	}

	@Override
	public void stockList(Model model, int num) {
		int pageLetter = 20; //페이지당 보여질 글 개수
		int allCount = mapper.selectStockCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("stock", mapper.stockList(start, end));
	}

	@Override
	public void getStockInfo(Model model, int stockNo) {
		try {
			model.addAttribute("stock",mapper.getStockInfo(stockNo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String stockModify(StockDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.stockModify(dto);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Stock Modify Success.";
			url = "/stock/stockList";
		}else {
			msg = "Stock Modify Failed.";
			url = "/stock/stockInfo?stockNo=" + dto.getStockNo();
		}
		return Common.getMessage(request, msg, url);
	}

	@Override
	public String stockDelete(int stockNo, int productNo, int count, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.stockDelete(stockNo, productNo, count);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Stock Delete Success.";
			url = "/stock/stockList";
		}else {
			msg = "Stock Delete Failed.";
			url = "/stock/stockList";
		}
		return Common.getMessage(request, msg, url);
	}
	
	
}
