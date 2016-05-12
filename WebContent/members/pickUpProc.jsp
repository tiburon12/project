<%@page import="com.project.vo.Border"%>
<%@page import="java.util.List"%>
<%@page import="com.project.vo.Pick"%>
<%@page import="com.project.dao.PickDAO"%>
<%@page import="com.project.dao.SellBorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String returnURL = (String) request.getSession().getAttribute("returnURL");
	String mid = (String) request.getSession().getAttribute("mid");
	String seq = request.getParameter("seq");
	PickDAO pdao = new PickDAO();
	List<Pick> plist = null;
	plist = pdao.getPickList(mid);
	System.out.println(plist.size());
	if (plist.size() > 0) {
		for (int i = 0; i < plist.size(); i++) {

			if (plist.get(i).getNotice_seq().equals(seq)) {
				request.setAttribute("error", "이미 찜한 게시글 입니다.");
				request.getRequestDispatcher(returnURL).forward(request, response);
				return;
			}
		}
	}
	SellBorderDAO dao = new SellBorderDAO();
	Border b = dao.getBorder(seq);
	int af = 0;
	Pick p = new Pick();
	p.setOwner(mid);
	p.setNotice_seq(seq);
	p.setCategory(b.getCategory());
	p.setTitle(b.getTitle());
	p.setWriter(b.getWriter());
	af = pdao.insertPick(p);

	af = dao.updatePick(seq);

	if (af > 0) {
		response.sendRedirect(returnURL);
	}
%>