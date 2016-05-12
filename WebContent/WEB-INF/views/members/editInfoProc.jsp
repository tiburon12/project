<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);

	if (!m.getPwd().equals(pwd)) {
		request.setAttribute("error", "비밀번호가 틀렸습니다.");
		request.getRequestDispatcher("editInfo.jsp?mid=" + mid).forward(request, response);
	} else {
		Member newm = new Member();
		newm.setMid(mid);
		newm.setEmail(email);
		newm.setPhone(phone);
		int af = dao.updateMember(newm);

		if (af > 0) {
			response.sendRedirect("myInfo.jsp?mid=" + mid);
		}
	}
%>
