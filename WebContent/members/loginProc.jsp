<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");

	//db코드

	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);

	if (m == null) {
		// 		String error = "ID is not exist.";
		// 		response.sendRedirect("index.jsp?error=" + error);

		request.setAttribute("error", "아이디가 존재하지 않습니다.");
		request.getRequestDispatcher("login.jsp").forward(request, response);

	} else if (!pwd.equals(m.getPwd())) {
		// 		String error = "incorrect PassWord.";
		// 		response.sendRedirect("index.jsp?error=" + error);

		request.setAttribute("error", "비밀번호가 틀렸습니다.");
		request.getRequestDispatcher("login.jsp").forward(request, response);

	} else {
		request.getSession().setAttribute("mid", mid);

		String returnURL = (String) request.getSession().getAttribute("returnURL");
		if (returnURL != null && !returnURL.equals("")) { //게시판에서 온 사용자
			// 			String ctName=  request.getContextPath();
			response.sendRedirect(returnURL);
		} else {
			response.sendRedirect("index.jsp");
		}
	}
%>