<%@page import="com.project.dao.SellBorderDAO"%>
<%@page import="com.project.dao.BuyBorderDAO"%>
<%@page import="com.project.vo.Border"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String seq = request.getParameter("seq");
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String content = request.getParameter("content");
	String border = request.getParameter("border");
	String pages = request.getParameter("pages");

	Border b = new Border();
	b.setSeq(seq);
	b.setTitle(title);
	b.setCategory(category);
	b.setContent(content);

	int af = 0;
	if (border.equals("buy")) {
		BuyBorderDAO dao = new BuyBorderDAO();
		af = dao.updateBorder(b);
	} else if (border.equals("sell")) {
		SellBorderDAO dao = new SellBorderDAO();
		af = dao.updateBorder(b);
	}

	if (af > 0) {
		response.sendRedirect(border + "Border.jsp?pages=" + pages);
	}
%>
