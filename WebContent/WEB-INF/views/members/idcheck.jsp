<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);

	if (m == null) {
		out.write("YES");
	} else {
		out.write("NO");
	}
%>
