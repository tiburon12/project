<%@page import="com.project.vo.Pick"%>
<%@page import="com.project.dao.PickDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String p_num = request.getParameter("p_num");
	PickDAO dao = new PickDAO();
	int af = dao.delPickP_num(p_num);

	if (af > 0) {
		response.sendRedirect("pickList.jsp");
	}
%>