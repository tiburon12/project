<%@page import="com.project.dao.CommentDAO"%>
<%@page import="com.project.vo.FreeBorder"%>
<%@page import="com.project.dao.FreeBorderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.vo.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = null;
	FreeBorder fb = null;
	List<Comment> list = null;
	String pages = request.getParameter("pages");
	String border = request.getParameter("border");
	String seq = request.getParameter("seq");
	int c_pages = 1;
	if (request.getSession().getAttribute("mid") == null) {
		//로그인 상태 아님 ->로그인 페이지로 이동
		request.getSession().setAttribute("returnURL",
				"freeDetail.jsp?border=" + border + "&seq=" + seq + "&pages=" + pages);
		response.sendRedirect("login.jsp");
		return;
	} else {
		mid = (String) request.getSession().getAttribute("mid");
		FreeBorderDAO dao = new FreeBorderDAO();
		fb = dao.getBorder(seq);
		CommentDAO cdao = new CommentDAO();
		list = new ArrayList<Comment>();
		list = cdao.getCommentList(border, c_pages, seq);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>acceler - Free CSS Template by ZyPOP</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
	<div id="container">

		<header>
		<div class="width">
			<h1>
				<a style="color: #544354" href="index.jsp">REVENTE</a>
			</h1>

			<nav>

			<ul class="sf-menu dropdown">
				<li><a href="index.jsp">Home</a></li>
				<li><a class="has_submenu" href="sellBorder.jsp">Sell</a>
					<ul>
						<li><a href="sellBorderCate.jsp?category=의류">의류</a></li>
						<li><a href="sellBorderCate.jsp?category=도서">도서</a></li>
						<li><a href="sellBorderCate.jsp?category=전자제품">전자제품</a></li>
						<li><a href="sellBorderCate.jsp?category=기타">기타</a></li>
					</ul></li>
				<li><a class="has_submenu" href="buyBorder.jsp">Buy</a>
					<ul>
						<li><a href="buyBorderCate.jsp?category=의류">의류</a></li>
						<li><a href="buyBorderCate.jsp?category=도서">도서</a></li>
						<li><a href="buyBorderCate.jsp?category=전자제품">전자제품</a></li>
						<li><a href="buyBorderCate.jsp?category=기타">기타</a></li>
					</ul></li>
				<li class="selected"><a class="has_submenu">Community</a>
					<ul>
						<li><a href="freeBorder.jsp">자유게시판</a></li>
						<li><a href="reviewBorder.jsp">후기게시판</a></li>
					</ul></li>
				<li><a class="has_submenu">My Page</a>
					<ul>
						<li><a href="pickList.jsp">찜목록</a></li>
						<li><a href="myNotice.jsp">내 상품</a></li>
					</ul></li>
			</ul>

			</nav>
		</div>

		<div class="clear"></div>
		</header>

		<div id="body" class="width"
			style="margin-left: 12%; margin-right: 12%;">
			<fieldset style="font-size: 20px">
				<legend style="font-size: 30px"><%=border.toUpperCase()%></legend>
				<div style="height: 800px;">
					<dl
						style="margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">제목</dt>
						<dd style="width: 80%; float: left"><%=fb.getTitle()%></dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">작성일</dt>
						<dd style="width: 80%; float: left"><%=fb.getRegdate()%></dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">작성자</dt>
						<dd style="width: 80%; float: left"><%=fb.getWriter()%></dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">조회수</dt>
						<dd style="width: 80%; float: left"><%=fb.getHit()%></dd>
					</dl>
					<div
						style="clear: both; padding: 15px 15px 80px 15px; border-bottom: 1px solid #000000">
						<img src="" /><br /><%=fb.getContent()%>
					</div>
					<div style="padding: 10px; margin: 10px; background: #c0c0c0">
						<p style="padding-left: 20px; border-bottom: 1px solid #000000">댓글</p>
						<div style="padding-left: 50px">
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<dl style="margin: 20px; height: 50px;">
								<dt style="width: 10%; float: left"><%=list.get(i).getWriter()%></dt>
								<dd style="width: 60%; float: left"><%=list.get(i).getContent()%></dd>
								<dd style="width: 20%; font-size: 15px; float: left"><%=list.get(i).getRegdate()%></dd>
								<dd style="width: 10%; float: left">
									<%
										if (mid.equals(list.get(i).getWriter())) {
									%><a
										href="commentDelProc.jsp?c_seq=<%=list.get(i).getC_seq()%>"><i
										class="material-icons">&#xE872;</i></a>
									<%
										}
									%>
								</dd>
							</dl>
							<%
								}
							%>
						</div>
						<form action="commentRegProc.jsp"
							style="border-top: 1px solid #000000; padding: 10px">
							<div>
								<textarea rows="4" name="content"
									style="border-radius: 10px; width: 90%; margin-left: 3%;"></textarea>
							</div>
							<input type="hidden" name="seq" value="<%=seq%>" /> <input
								type="hidden" name="border" value="<%=border%>" /> <input
								type="hidden" name="pages" value="<%=pages%>" /> <input
								type="hidden" name="notice_writer" value="<%=fb.getWriter()%>" />
							<div style="margin-left: 86.5%; margin-top: 10px;">
								<input style="border-radius: 10px; width: 85px;" type="submit"
									name="reg" value="등록" />
							</div>
						</form>
					</div>
					<div>
						<%
							if (fb.getWriter().equals(mid)) {
						%>
						<a
							href="delNoticeProc.jsp?seq=<%=fb.getSeq()%>&border=<%=border%>"
							class="button button-reversed"
							style="margin-top: 20px; margin-left: auto; float: left">삭제</a> <a
							href="editFreeNotice.jsp?border=<%=border%>&seq=<%=fb.getSeq()%>&pages=<%=pages%>"
							class="button button-reversed"
							style="margin-top: 20px; margin-left: 20px; float: left">수정</a>
						<%
							}
						%>
						<a href="<%=border%>Border.jsp?pages=<%=pages%>"
							class="button button-reversed"
							style="margin-top: 20px; margin-left: 20px; float: left">목록으로</a>
					</div>
				</div>
			</fieldset>
			<div class="clear"></div>
		</div>

		<footer>
		<div class="footer-content width">
			<ul>
				<li><h4>Proin accumsan</h4></li>
				<li><a href="#">Rutrum nulla a ultrices</a></li>
				<li><a href="#">Blandit elementum</a></li>
				<li><a href="#">Proin placerat accumsan</a></li>
				<li><a href="#">Morbi hendrerit libero </a></li>
				<li><a href="#">Curabitur sit amet tellus</a></li>
			</ul>

			<ul>
				<li><h4>Condimentum</h4></li>
				<li><a href="#">Curabitur sit amet tellus</a></li>
				<li><a href="#">Morbi hendrerit libero </a></li>
				<li><a href="#">Proin placerat accumsan</a></li>
				<li><a href="#">Rutrum nulla a ultrices</a></li>
				<li><a href="#">Cras dictum</a></li>
			</ul>

			<ul>
				<li><h4>Suspendisse</h4></li>
				<li><a href="#">Morbi hendrerit libero </a></li>
				<li><a href="#">Proin placerat accumsan</a></li>
				<li><a href="#">Rutrum nulla a ultrices</a></li>
				<li><a href="#">Curabitur sit amet tellus</a></li>
				<li><a href="#">Donec in ligula nisl.</a></li>
			</ul>

			<ul class="endfooter">
				<li><h4>Suspendisse</h4></li>
				<li>Integer mattis blandit turpis, quis rutrum est. Maecenas
					quis arcu vel felis lobortis iaculis fringilla at ligula. Nunc
					dignissim porttitor dolor eget porta.</li>
			</ul>

			<div class="clear"></div>
		</div>
		<div class="footer-bottom">
			<p>
				&copy; YourSite 2014. <a href="http://zypopwebtemplates.com/">Free
					HTML5 Templates</a> by ZyPOP
			</p>
		</div>
		</footer>
	</div>
</body>
</html>