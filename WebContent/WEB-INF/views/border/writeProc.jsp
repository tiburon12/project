<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.project.dao.SellBorderDAO"%>
<%@page import="com.project.dao.BuyBorderDAO"%>
<%@page import="com.project.vo.Border"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = "/upload";
	ServletContext sct = request.getServletContext();
	String realPath = sct.getRealPath(path);
	System.out.println(realPath);

	// 	String path = "C:/Users/user/jsp/workspace/project/WebContent/upload";
	// 	ServletContext sct = request.getServletContext();
	// 	// 	String realPath = sct.getRealPath(path);
	// 	String realPath = path;
	// 	System.out.println(realPath);

	//1,2(실제파일저장되는경로),3(최대파일크기),4(문자set),5(같은이름이있을때 파일이름변경방식)
	MultipartRequest mulReq = new MultipartRequest(request, realPath, 10 * 1024 * 1024, "UTF-8",
			new DefaultFileRenamePolicy());

	String mid = (String) request.getSession().getAttribute("mid");
	String border = mulReq.getParameter("border");
	String title = mulReq.getParameter("title");
	String category = mulReq.getParameter("category");
	String content = mulReq.getParameter("content");
	String fileSrc = mulReq.getFilesystemName("file");//실제로 저장되는 파일이름
	Border b = new Border();
	b.setTitle(title);
	b.setCategory(category);
	b.setWriter(mid);
	b.setContent(content);
	b.setFileSrc(fileSrc);

	int af = 0;
	if (border.equals("buy")) {
		BuyBorderDAO dao = new BuyBorderDAO();
		af = dao.insertBorder(b);
	} else {
		SellBorderDAO dao = new SellBorderDAO();
		af = dao.insertBorder(b);
	}

	if (af > 0) {
		response.sendRedirect(border + "Border.jsp");
	}
%>