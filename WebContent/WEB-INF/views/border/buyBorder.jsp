<%@page import="com.project.dao.BuyBorderDAO"%>
<%@page import="com.project.vo.Border"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<a style="color: #544354" href="index.do">REVENTE</a>
			</h1>

			<nav>

			<ul class="sf-menu dropdown">
				<li><a href="index.do">Home</a></li>
				<li><a class="has_submenu" href="sellBorder.do">Sell</a>
					<ul>
						<li><a href="sellBorderCate.do?category=의류">의류</a></li>
						<li><a href="sellBorderCate.do?category=도서">도서</a></li>
						<li><a href="sellBorderCate.do?category=전자제품">전자제품</a></li>
						<li><a href="sellBorderCate.do?category=기타">기타</a></li>
					</ul></li>
				<li class="selected"><a class="has_submenu"
					href="buyBorder.do">Buy</a>
					<ul>
						<li><a href="buyBorderCate.do?category=의류">의류</a></li>
						<li><a href="buyBorderCate.do?category=도서">도서</a></li>
						<li><a href="buyBorderCate.do?category=전자제품">전자제품</a></li>
						<li><a href="buyBorderCate.do?category=기타">기타</a></li>
					</ul></li>
				<li><a class="has_submenu">Community</a>
					<ul>
						<li><a href="freeBorder.do">자유게시판</a></li>
						<li><a href="reviewBorder.do">후기게시판</a></li>
					</ul></li>
				<li><a class="has_submenu">My Page</a>
					<ul>
						<li><a href="pickList.do">찜목록</a></li>
						<li><a href="myNotice.do">내 상품</a></li>
					</ul></li>
			</ul>

			</nav>
		</div>

		<div class="clear"></div>
		</header>

		<div id="body" class="width"
			style="margin-left: 15%; margin-right: 15%;">
			<h1 style="margin: 20px; font-size: 70px">BUY</h1>
			<table cellspacing="0">
				<tr>
					<th style="width: 10%">SEQ</th>
					<th style="width: 10%">카테고리</th>
					<th style="width: 30%">글제목</th>
					<th style="width: 20%">작성자</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 10%">조회수</th>
				</tr>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.seq}</td>
						<td>${i.category}</td>
						<td><a
							href="detail.do?border=buy&pages=${pages}&seq=${i.seq}"
							style="color: #666666">${i.title}</a></td>
						<td>${i.writer}</td>
						<td>${i.regdate}</td>
						<td>${i.hit}</td>
					</tr>
				</c:forEach>
			</table>

			<div style="margin-top: 20px">
				<p style="float: left; margin-left: 40%; width: 45px">
					<c:if test="${startPageNum != 1}">

						<a href="buyBorder.do?pages=${startPageNum - 1}"><img
							style="margin-top: 5px" src="images/prev2.jpg" /></a>

					</c:if>
				</p>
				<p style="float: left; width: 80px">
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${startPageNum + i <= endPageNum}">
							<c:if test="${(startPageNum + i) == pages}">
								<a style="color: #ff0000; font-size: 25px; font-weight: bold;"
									href="buyBorder.do?pages=${startPageNum + i}">${startPageNum + i}</a>
							</c:if>
							<c:if test="${(startPageNum + i) != pages}">
								<a style="font-size: 20px; font-weight: bold;"
									href="buyBorder.do?pages=${startPageNum + i}">${startPageNum + i}</a>
							</c:if>

						</c:if>
					</c:forEach>
				</p>
				<p style="float: left; width: 45px">
					<c:if test="${startPageNum +4 < endPageNum}">
						<a href="buyBorder.do?pages=${startPageNum + 5}"><img
							style="margin-left: 10px; margin-top: 5px" src="images/next2.jpg" /></a>
					</c:if>
				</p>
				<div>
					<a href="write.jsp?border=buy&pages=${pages}"
						class="button button-reversed" style="margin-left: 35%">글쓰기</a>
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