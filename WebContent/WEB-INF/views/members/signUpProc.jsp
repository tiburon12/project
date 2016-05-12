<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);
	if (m != null) {
		request.setAttribute("error", "아이디 중복확인을 해주세요.");
		request.getRequestDispatcher("signUp.jsp").forward(request, response);
	} else {
		Member newm = new Member();
		newm.setMid(mid);
		newm.setPwd(pwd);
		newm.setName(name);
		newm.setEmail(email);
		newm.setPhone(phone);

		int af = dao.addMember(newm);

		if (af > 0) {
			response.sendRedirect("index.jsp");
		} else {
			out.write("회원가입중 오류발생");
		}

	}
%>