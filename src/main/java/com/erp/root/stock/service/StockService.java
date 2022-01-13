package com.erp.root.stock.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.erp.root.stock.dto.StockDTO;

public interface StockService {
	public void getStockProductList(Model model);
	public void getStockAccountList(Model model);
	public String stockInsert(StockDTO dto, HttpServletRequest request);
	public void stockList(Model model, int num);
	public void getStockInfo(Model model, int stockNo);
	public String stockModify(StockDTO dto, HttpServletRequest request);
	public String stockDelete(int stockNo, int productNo, int count, HttpServletRequest request);
}
