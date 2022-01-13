package com.erp.root.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Common {

	public static void init(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
	}

	public static void alert(HttpServletResponse response, String alertText) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + alertText + "');</script> ");
		out.flush();
	}

	public static void alertAndMovePage(HttpServletResponse response, String alertText, String nextPage)
			throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + alertText + "'); location.href='" + nextPage + "';</script> ");
		out.flush();
	}

	public static void alertAndBackPage(HttpServletResponse response, String alertText) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + alertText + "'); history.go(-1);</script>");
		out.flush();
	}
	
	public static String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "'; </script>";
		return message;
	}
	
	public static void writer(HttpServletResponse response, String message) {
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
