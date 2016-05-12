<%@page import="com.project.dao.CommentDAO"%>
<%@page import="com.project.dao.PickDAO"%>
<%@page import="com.project.dao.FreeBorderDAO"%>
<%@page import="com.project.dao.SellBorderDAO"%>
<%@page import="com.project.dao.BuyBorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String seq = request.getParameter("seq");
	String border = request.getParameter("border");

	int af = 0;
	if (border.equals("buy")) {
		BuyBorderDAO dao = new BuyBorderDAO();
		af = dao.delBorder(seq);
	} else if (border.equals("sell")) {
		PickDAO pdao = new PickDAO();
		pdao.delPick(seq);
		CommentDAO cdao = new CommentDAO();
		cdao.delCommentWriter(seq);
		SellBorderDAO dao = new SellBorderDAO();
		af = dao.delBorder(seq);

	} else if (border.equals("free")) {
		FreeBorderDAO dao = new FreeBorderDAO();
		af = dao.delBorder(seq);
	}

	if (af > 0) {
		response.sendRedirect(border + "Border.jsp");
	}
%>
