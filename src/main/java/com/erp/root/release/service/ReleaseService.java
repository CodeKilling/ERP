package com.erp.root.release.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.erp.root.release.dto.ReleaseDTO;
import com.erp.root.stock.dto.StockDTO;

public interface ReleaseService {
	public void getReleaseList(Model model, int num);
	public void getPreData(Model model, int num);
	public void getReleaseProductList(Model model);
	public void getReleaseAccountList(Model model);
	public String releaseInsert(StockDTO dto, HttpServletRequest request);
	public void getStockInfo(Model model, int stockNo);
	public void getReleaseInfo(Model model, int releaseNo);
	public String releaseModify(ReleaseDTO dto, HttpServletRequest request);
	public String releaseDelete(int releaseNo, int productNo, int count, HttpServletRequest request);
}
