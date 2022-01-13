package com.erp.root.product.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface ProductService {
	public void productList(Model model, int num);
	public String productInsert(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void productInfo(Model model, int productno);
	public String productModify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public String productDelete(int productno, String imageFileName, HttpServletRequest request);
	public void productCategory(Model model);
	public void getCategory(Model model);
	public void getAccount(Model model);
	public void productFilterList(Model model, int num, String category);
}
