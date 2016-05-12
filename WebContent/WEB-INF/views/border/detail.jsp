<%@page import="com.project.dao.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.vo.Comment"%>
<%@page import="com.project.dao.SellBorderDAO"%>
<%@page import="com.project.dao.BuyBorderDAO"%>
<%@page import="com.project.vo.Border"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li><a class="has_submenu" href="buyBorder.do">Buy</a>
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
			style="margin-left: 12%; margin-right: 12%;">
			<fieldset style="font-size: 20px">
				<legend style="font-size: 30px">${border}</legend>
				<div style="height: 800px;">
					<dl
						style="margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left; font-weight: 900;">제목</dt>
						<dd style="width: 30%; float: left; font-size: 15px">${b.title}</dd>
						<dt style="width: 20%; float: left; font-weight: 900;">카테고리</dt>
						<dd style="width: 30%; float: left; font-size: 15px">${b.category}</dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left; font-weight: 900;">작성일</dt>
						<dd style="width: 30%; float: left; font-size: 15px">${b.regdate}</dd>
						<dt style="width: 20%; float: left; font-weight: 900;">작성자</dt>
						<dd style="width: 30%; float: left; font-size: 15px">${b.writer}</dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left; font-weight: 900;">조회수</dt>
						<dd style="width: 30%; float: left; font-size: 15px">${b.hit}</dd>

						<c:if test="${border==sell}">
							<dt style="width: 20%; float: left; font-weight: 900;">찜</dt>
							<dd style="width: 30%; float: left; font-size: 15px">${b.pick}</dd>
						</c:if>

					</dl>
					<div
						style="clear: both; margin: 20px; padding: 15px; border-bottom: 1px solid #000000;">

						<c:if test="${!empty b.fileSrc}">
							<img src="upload/${b.fileSrc}" />
							<br />

						</c:if>
						${b.content}

						<c:if test="${border=='sell'}">
							<p>
								<a
									style="background: red; border-radius: 5px; margin-top: 80px; margin-left: 10px;"
									href="pickUpProc.do?border=${border}&seq=${seq}"
									class="button">PICK</a>

								<c:if test="${!empty error}">
									<span>${error}</span>
								</c:if>

							</p>
						</c:if>

					</div>
					<div style="padding: 10px; margin: 30px; background: #c0c0c0">
						<p style="padding-left: 20px; border-bottom: 1px solid #000000">댓글</p>
						<div style="padding-left: 50px">

							<c:forEach var="n" items="${list}">
								<dl style="margin: 20px; height: 50px;">
									<dt style="width: 10%; float: left">${n.writer}</dt>
									<dd style="width: 60%; float: left">${n.content}</dd>
									<dd style="width: 20%; font-size: 15px; float: left">${n.regdate}</dd>
									<dd style="width: 10%; float: left">
										<c:if test="${mid==n.writer}">
											<a href="commentDelProc.do?c_seq=${n.c_seq}"><i
												class="material-icons">&#xE872;</i></a>

										</c:if>
									</dd>
								</dl>
							</c:forEach>

						</div>
						<form action="commentRegProc.do"
							style="border-top: 1px solid #000000; padding: 10px">
							<div>
								<textarea rows="4" name="content"
									style="border-radius: 10px; width: 90%; margin-left: 3%;"></textarea>
							</div>
							<input type="hidden" name="seq" value="${seq}" /> <input
								type="hidden" name="border" value="${border}" /> <input
								type="hidden" name="pages" value="${pages}" /> <input
								type="hidden" name="notice_writer" value="${b.writer}" />
							<div style="margin-left: 86.5%; margin-top: 10px;">
								<input style="border-radius: 10px; width: 85px;" type="submit"
									name="reg" value="등록" />
							</div>
						</form>
					</div>
					<div style="padding-left: 30px">
						<c:if test="${b.writer==mid}">
							<a href="delNoticeProc.do?seq=${b.seq}&border=${border}"
								class="button button-reversed"
								style="margin-top: 20px; margin-left: auto; float: left">삭제</a>
							<a
								href="editNotice.do?border=${border}&seq=${b.seq}&pages=${pages}"
								class="button button-reversed"
								style="margin-top: 20px; margin-left: 20px; margin-right: 20px; float: left">수정</a>
						</c:if>
						<a href="${border}Border.do?pages=${pages}"
							class="button button-reversed"
							style="margin-top: 20px; float: left">목록으로</a>
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
