<%@page import="com.project.dao.FreeBorderDAO"%>
<%@page import="com.project.vo.FreeBorder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pages = 1;
	String _pages = request.getParameter("pages");

	if (_pages != null && !_pages.equals("")) {
		pages = Integer.parseInt(_pages);
	}

	List<FreeBorder> list = null;
	FreeBorderDAO dao = new FreeBorderDAO();
	list = dao.getFreeBorderList(pages);

	int cnt = dao.getCount();
	int startPageNum = pages - (pages - 1) % 5;
	int endPageNum = cnt / 15 + (cnt % 15 == 0 ? 0 : 1);
	request.getSession().setAttribute("returnURL", "freeBorder.jsp?pages=" + pages);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>acceler - Free CSS Template by ZyPOP</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

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
			style="margin-left: 15%; margin-right: 15%;">
			<h1 style="margin: 20px; font-size: 70px">FREE</h1>
			<table cellspacing="0">
				<tr>
					<th style="width: 10%">SEQ</th>
					<th style="width: 40%">글제목</th>
					<th style="width: 20%">작성자</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 10%">조회수</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getSeq()%></td>
					<td><a
						href="freeDetail.jsp?border=free&pages=<%=pages%>&seq=<%=list.get(i).getSeq()%>"
						style="color: #666666"><%=list.get(i).getTitle()%></a></td>
					<td><%=list.get(i).getWriter()%></td>
					<td><%=list.get(i).getRegdate()%></td>
					<td><%=list.get(i).getHit()%></td>
				</tr>
				<%
					}
				%>
			</table>

			<div style="margin-top: 20px">
				<p style="float: left; margin-left: 40%; width: 45px">
					<%
						if (startPageNum != 1) {
					%>
					<a href="freeBorder.jsp?pages=<%=startPageNum - 1%>"><img
						style="margin-top: 5px" src="images/prev2.jpg" /></a>
					<%
						}
					%>
				</p>
				<p style="float: left; width: 80px">
					<%
						for (int i = 0; i < 5; i++) {
							if (startPageNum + i <= endPageNum) {
					%>
					<a
						style="font-size: 20px; font-weight: bold;<%if ((startPageNum + i) == pages) {%>
						color:#ff0000; font-size:25px; font-weight: bold;
						<%}%>"
						href="freeBorder.jsp?pages=<%=startPageNum + i%>"><%=startPageNum + i%></a>
					<%
						}
						}
					%>
				</p>
				<p style="float: left; width: 45px">
					<%
						if (startPageNum + 4 < endPageNum) {
					%>
					<a href="freeBorder.jsp?pages=<%=startPageNum + 5%>"><img
						style="margin-left: 10px; margin-top: 5px" src="images/next2.jpg" /></a>
					<%
						}
					%>
				</p>
				<div>
					<a href="freeWrite.jsp?border=free&pages=<%=pages%>"
						class="button button-reversed"
						style="margin-top: 10px; margin-left: 35%">글쓰기</a>
				</div>

			</div>

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