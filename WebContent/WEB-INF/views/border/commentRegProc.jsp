<%@page import="com.project.dao.CommentDAO"%>
<%@page import="com.project.vo.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = (String) request.getSession().getAttribute("mid");
	String seq = request.getParameter("seq");
	String content = request.getParameter("content");
	String notice_writer = request.getParameter("notice_writer");
	String pages = request.getParameter("pages");
	String border = request.getParameter("border");
	Comment c = new Comment();
	c.setNotice_seq(seq);
	c.setWriter(mid);
	c.setContent(content);
	c.setNotice_writer(notice_writer);
	c.setKind(border);

	int af = 0;
	CommentDAO dao = new CommentDAO();
	af = dao.insertComment(c);

	if (af > 0) {
		if (border.equals("free")) {
			response.sendRedirect("freeDetail.jsp?border=" + border + "&pages=" + pages + "&seq=" + seq);
		} else {
			response.sendRedirect("detail.jsp?border=" + border + "&pages=" + pages + "&seq=" + seq);
		}
	}
%>