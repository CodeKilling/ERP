package com.erp.root.stock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erp.root.common.Common;
import com.erp.root.stock.dto.StockDTO;
import com.erp.root.stock.service.StockService;

@Controller
@RequestMapping("stock")
public class StockController {
	@Autowired
	StockService ss;
	
	@GetMapping("stockList")
	public String stockList(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		ss.stockList(model, num);
		return "stock/stockList";
	}
	
	@GetMapping("stockForm")
	public String stockForm(Model model) {
		model.addAttribute("command","Insert");
		ss.getStockProductList(model);
		ss.getStockAccountList(model);
		return "stock/stockForm";
	}
	
	@PostMapping("stockInsert")
	public void stockInsert(StockDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		
		/*
		 * System.out.println("called.");
		 * System.out.println(dto.getAccountNo());
		 */
		 
		String message = ss.stockInsert(dto, request);
		Common.writer(response, message);
	}
	
	@GetMapping("stockInfo")
	public String stockInfo(Model model,
			@RequestParam int stockNo) {
		model.addAttribute("command","Modify");
		ss.getStockProductList(model);
		ss.getStockAccountList(model);
		ss.getStockInfo(model, stockNo);
		return "stock/stockForm";
	}
	
	@PostMapping("stockModify")
	public void stockModify(StockDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		String message = ss.stockModify(dto, request);
		Common.writer(response, message);
	}
	
	@GetMapping("stockDelete")
	public void stockDelete(@RequestParam int stockNo,
			@RequestParam int productNo,
			@RequestParam int count,
			HttpServletResponse response,
			HttpServletRequest request) {
		String message = ss.stockDelete(stockNo, productNo, count, request);
		Common.writer(response, message);
	}
}
