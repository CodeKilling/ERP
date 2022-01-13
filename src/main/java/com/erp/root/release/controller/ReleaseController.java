package com.erp.root.release.controller;

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
import com.erp.root.release.dto.ReleaseDTO;
import com.erp.root.release.service.ReleaseService;
import com.erp.root.stock.dto.StockDTO;

@Controller
@RequestMapping("release")
public class ReleaseController {
	@Autowired
	ReleaseService rs;
	
	@GetMapping("releaseList")
	public String releaseList(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		rs.getReleaseList(model, num);
		return "release/releaseList";
	}
	
	@GetMapping("releasePreForm")
	public String releasePreForm(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		rs.getPreData(model, num);
		return "release/releasePreForm";
	}
	
	@GetMapping("releaseForm")
	public String releaseForm(Model model, @RequestParam int stockNo) {
		model.addAttribute("command","Insert");
		rs.getReleaseProductList(model);
		rs.getReleaseAccountList(model);
		rs.getStockInfo(model, stockNo);
		return "release/releaseForm";
	}
	
	@PostMapping("releaseInsert")
	public void releaseInsert(StockDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		//System.out.println(dto.getName());
		String message = rs.releaseInsert(dto, request);
		Common.writer(response, message);
	}
	
	@GetMapping("releaseInfo")
	public String releaseInfo(Model model, @RequestParam int releaseNo) {
		model.addAttribute("command", "Modify");
		rs.getReleaseProductList(model);
		rs.getReleaseAccountList(model);
		rs.getReleaseInfo(model, releaseNo);
		return "release/releaseForm";
	}
	
	@PostMapping("releaseModify")
	public void releaseModify(ReleaseDTO dto,
			HttpServletResponse response,
			HttpServletRequest request) {
		//System.out.println(dto.getReleaseDay());
		String message = rs.releaseModify(dto, request);
		Common.writer(response, message);
	}
	
	@GetMapping("releaseDelete")
	public void releaseDelete(@RequestParam int releaseNo,
			@RequestParam int productNo,
			@RequestParam int count,
			HttpServletResponse response,
			HttpServletRequest request) {
		String message = rs.releaseDelete(releaseNo, productNo, count, request);
		Common.writer(response, message);
	}
}
