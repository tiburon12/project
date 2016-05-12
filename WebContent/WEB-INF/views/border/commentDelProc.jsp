<%@page import="com.project.vo.Comment"%>
<%@page import="com.project.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String c_seq = request.getParameter("c_seq");

	CommentDAO dao = new CommentDAO();
	int af = dao.delComment(c_seq);

	if (af > 0) {
		String returnURL = (String) request.getSession().getAttribute("returnURL");
		response.sendRedirect(returnURL);
	}
%>