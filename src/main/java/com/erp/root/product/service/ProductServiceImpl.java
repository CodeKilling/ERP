package com.erp.root.product.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.erp.root.mybatis.product.ProductMapper;
import com.erp.root.product.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper mapper;
	@Autowired
	ProductFileService pfs;
	
	@Override
	public void productList(Model model, int num) {
		int pageLetter = 10; //페이지당 보여질 글 개수
		int allCount = mapper.selectProductCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("productList", mapper.productList(start, end));
		//model.addAttribute("memberList", mapper.memberList());
	}

	@Override
	public String productInsert(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ProductDTO dto = new ProductDTO();
		dto.setId(mul.getParameter("id"));
		dto.setName(mul.getParameter("name"));
		dto.setCategory(mul.getParameter("category"));
		
		//dto.setAccountNo(Integer.parseInt(mul.getParameter("account")));
		
		MultipartFile file = mul.getFile("image_file_name");
		if(file.getSize() != 0) {
			dto.setImageFileName(pfs.saveFile(file));
		}else {
			dto.setImageFileName("nan");
		}
		int result = 0;
		String msg, url;
		try {
			result = mapper.productInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {
			msg = "Product Insert Success.";
			url = "/product/productlist";
		} else {
			msg = "Product Insert Failed.";
			url = "/product/productinsertform";
		}
		return pfs.getMessage(request, msg, url);
	}

	@Override
	public void productInfo(Model model, int productno) {
		model.addAttribute("product",mapper.productInfo(productno));
	}

	@Override
	public String productModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ProductDTO dto = new ProductDTO();
		dto.setProductno(Integer.parseInt(mul.getParameter("productno")));
		dto.setId(mul.getParameter("id"));
		dto.setName(mul.getParameter("name"));
		dto.setCategory(mul.getParameter("category"));
		
		//dto.setAccountNo(Integer.parseInt(mul.getParameter("account")));
		
		MultipartFile file = mul.getFile("image_file_name");
		if(file.getSize() != 0) {
			dto.setImageFileName(pfs.saveFile(file));
			pfs.deleteImage(mul.getParameter("originFileName"));
		}else {
			dto.setImageFileName(mul.getParameter("originFileName"));
		}
		int result = mapper.productModify(dto);
		String msg, url;
		if (result == 1) {
			msg = "Product Modify Success.";
			url = "/product/productlist";
		} else {
			msg = "Product Modify Failed.";
			url = "/product/productInfo?productno="+mul.getParameter("productno");
		}
		String message = pfs.getMessage(request, msg, url);
		return message;
	}

	@Override
	public String productDelete(int productno, String imageFileName, HttpServletRequest request) {
		int result = 0;
		try {
			result = mapper.productDelete(productno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg, url;
		if (result == 1) {
			pfs.deleteImage(imageFileName);
			msg = "Product Delete Success.";
			url = "/product/productlist";
		} else {
			msg = "Product Delete Failed.";
			url = "/product/productlist";
		}
		String message = pfs.getMessage(request, msg, url);
		return message;
	}

	@Override
	public void productCategory(Model model) {
		model.addAttribute("productCategory",mapper.productCategory());
	}

	@Override
	public void getCategory(Model model) {
		model.addAttribute("category",mapper.getCategory());
	}
	
	@Override
	public void getAccount(Model model) {
		model.addAttribute("account",mapper.getAccount());
	}
	
	@Override
	public void productFilterList(Model model, int num, String category) {
		int pageLetter = 10; //페이지당 보여질 글 개수
		int allCount = mapper.selectProductCount(); //총 개수
		int repeat = allCount / pageLetter; //반복횟수 및 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("current", num);
		model.addAttribute("repeat",repeat);
		model.addAttribute("productList", mapper.productFilterList(start, end, category));
	}

	
	
}
