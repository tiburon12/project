<%@page import="com.project.dao.FreeBorderDAO"%>
<%@page import="com.project.vo.FreeBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = (String) request.getSession().getAttribute("mid");
	String border = request.getParameter("border");

	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String content = request.getParameter("content");
	FreeBorder fb = new FreeBorder();
	fb.setTitle(title);
	fb.setWriter(mid);
	fb.setContent(content);

	int af = 0;
	FreeBorderDAO dao = new FreeBorderDAO();
	af = dao.insertBorder(fb);
	if (af > 0) {
		response.sendRedirect(border + "Border.jsp");
	}
%>