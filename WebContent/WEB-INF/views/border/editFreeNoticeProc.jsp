<%@page import="com.project.vo.FreeBorder"%>
<%@page import="com.project.dao.FreeBorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String seq = request.getParameter("seq");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String border = request.getParameter("border");
	String pages = request.getParameter("pages");

	FreeBorder fb = new FreeBorder();
	fb.setSeq(seq);
	fb.setTitle(title);
	fb.setContent(content);

	int af = 0;
	if (border.equals("free")) {
		FreeBorderDAO dao = new FreeBorderDAO();
		af = dao.updateBorder(fb);
	}

	if (af > 0) {
		response.sendRedirect(border + "Border.jsp?pages=" + pages);
	}
%>
