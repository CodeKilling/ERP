package com.erp.root.release.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.erp.root.common.Common;
import com.erp.root.mybatis.release.ReleaseMapper;
import com.erp.root.release.dto.ReleaseDTO;
import com.erp.root.stock.dto.StockDTO;

@Service
public class ReleaseServiceImpl implements ReleaseService{
	@Autowired
	ReleaseMapper mapper;
	
	@Override
	public void getReleaseList(Model model, int num) {
		int pageLetter = 20; //페이지당 보여질 글 개수
		int allCount = mapper.selectReleaseCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("release", mapper.releaseList(start, end));
	}
	
	@Override
	public void getPreData(Model model, int num) {
		int pageLetter = 20; //페이지당 보여질 글 개수
		int allCount = mapper.selectPreDataCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("preData", mapper.preData(start, end));
	}

	@Override
	public void getReleaseProductList(Model model) {
		try {
			model.addAttribute("product",mapper.getReleaseProductList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void getReleaseAccountList(Model model) {
		try {
			model.addAttribute("account",mapper.getReleaseAccountList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String releaseInsert(StockDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.releaseInsert(dto);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Release Insert Success.";
			url = "/release/releaseList";
		}else {
			msg = "Release Insert Failed.";
			url = "/release/releaseForm?stockNo=" + dto.getStockNo();
		}
		return Common.getMessage(request, msg, url);
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
	public void getReleaseInfo(Model model, int releaseNo) {
		try {
			model.addAttribute("stock",mapper.getReleaseInfo(releaseNo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String releaseModify(ReleaseDTO dto, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.releaseModify(dto);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Release Modify Success.";
			url = "/release/releaseList";
		}else {
			msg = "Release Modify Failed.";
			url = "/release/releaseInfo?releaseNo=" + dto.getReleaseNo();
		}
		return Common.getMessage(request, msg, url);
	}

	@Override
	public String releaseDelete(int releaseNo, int productNo, int count, HttpServletRequest request) {
		int result = 0;
		String msg, url;
		try {
			result = mapper.releaseDelete(releaseNo, productNo, count);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if(result == 1) {
			msg = "Release Delete Success.";
			url = "/release/releaseList";
		}else {
			msg = "Release Delete Failed.";
			url = "/release/releaseList";
		}
		return Common.getMessage(request, msg, url);
	}

}
