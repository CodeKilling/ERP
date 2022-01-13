package com.erp.root.product.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.erp.root.product.service.ProductFileService;
import com.erp.root.product.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductContoller {
	@Autowired
	ProductService ps;
	
	@GetMapping("productlist")
	public String productlist(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		//System.out.println("productlist() : called.");
		ps.productList(model, num);
		//ps.productCategory(model);
		ps.getCategory(model);
		return "product/productlist";
	}
	@GetMapping("productFilterList")
	public String productFilterList(Model model, 
									@RequestParam(required = false, defaultValue = "1") int num,
									@RequestParam String category) {
		ps.productFilterList(model, num, category);
		ps.getCategory(model);
		return "product/productlist";
	}
	
	@GetMapping("productinsertform")
	public String productAdd(Model model) {
		model.addAttribute("command","insert");
		ps.getCategory(model);
		ps.getAccount(model);
		return "product/productinsert";
	}
	
	@PostMapping("productInsert")
	public void productInsert(MultipartHttpServletRequest mul,
							  HttpServletResponse response,
							  HttpServletRequest request) {
		String message = ps.productInsert(mul, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}
	
	@GetMapping("download")
	public void download(@RequestParam("imageFileName") String imageFileName,
						 HttpServletResponse response) {
		response.addHeader("Content-disposition", "attachment;fileName="+imageFileName);
		File file = new File(ProductFileService.IMAGE_REPO + "/" + imageFileName);
		FileInputStream in;
		try {
			in = new FileInputStream(file);
			FileCopyUtils.copy(in, response.getOutputStream());
		    in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("productInfo")
	public String productInfo(Model model
							 ,@RequestParam int productno) {
		model.addAttribute("command","modify");
		ps.productInfo(model, productno);
		ps.getCategory(model);
		ps.getAccount(model);
		return "product/productinsert";
	}
	
	@PostMapping("productModify")
	public void productModify(MultipartHttpServletRequest mul,
							  HttpServletResponse response,
							  HttpServletRequest request) {
		String message = ps.productModify(mul, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}
	
	@GetMapping("productDelete")
	public void productDelete(@RequestParam("productno") int productno,
							  @RequestParam("imageFileName") String imageFileName,
							  HttpServletResponse response, 
					          HttpServletRequest request) {
		System.out.println("productDelete() : called.");
		System.out.println(imageFileName);
		String message = ps.productDelete(productno, imageFileName, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(message);
	}
	
}
