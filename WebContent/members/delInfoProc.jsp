<%@page import="com.project.dao.CommentDAO"%>
<%@page import="com.project.dao.FreeBorderDAO"%>
<%@page import="com.project.dao.BuyBorderDAO"%>
<%@page import="com.project.dao.SellBorderDAO"%>
<%@page import="com.project.dao.PickDAO"%>
<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");

	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);

	if (!m.getPwd().equals(pwd)) {
		request.setAttribute("error", "비밀번호가 틀렸습니다.");
		request.getRequestDispatcher("delInfo.jsp?mid=" + mid).forward(request, response);
	} else {
		CommentDAO cdao = new CommentDAO();
		PickDAO pdao = new PickDAO();
		SellBorderDAO sdao = new SellBorderDAO();
		BuyBorderDAO bdao = new BuyBorderDAO();
		FreeBorderDAO fdao = new FreeBorderDAO();
		cdao.delCommentWriter(mid);
		pdao.delPickMid(mid);
		sdao.delBorderMid(mid);
		bdao.delBorderMid(mid);
		fdao.delBorderMid(mid);

		int af = dao.deleteMember(m);

		if (af > 0) {
			response.sendRedirect("logoutProc.jsp");
		}
	}
%>