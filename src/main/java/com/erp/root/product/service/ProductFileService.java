package com.erp.root.product.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ProductFileService {
	public static final String IMAGE_REPO = "D:/erp_image";
	public String saveFile(MultipartFile file);
	public String getMessage(HttpServletRequest request, String msg, String url);
	public void deleteImage(String originFileName);
}
