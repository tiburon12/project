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
			style="margin-left: 15%; margin-right: 15%;">
			<h1 style="margin: 20px; font-size: 50px">로그인</h1>
			<c:if test="${!empty error}">
				<p>${error}</p>

			</c:if>
			<fieldset style="height: 500px">
				<form action="loginProc.do" method="post"
					style="margin-left: 26%; font-size: 20px; margin-top: 100px; border: solid 1px; border-radius: 20px; width: 400px; padding: 50px">
					<p>
						<label for="name">아이디:</label> <input name="mid" id="mid" value=""
							type="text" />
					</p>
					<p>
						<label for="pwd">비밀번호:</label> <input name="pwd" id="pwd" value=""
							type="password" />
					</p>
					<p>
						<input name="login"
							style="margin-left: 20px; width: 40%; padding: 6px 0px 5px 0px"
							class="formbutton" value="로그인" type="submit" /> <a
							href="signUp.do" class="button"
							style="margin-left: 5px; padding: 0px; font-size: 14px; width: 40%; height: 33px; background: #8E959A; background-color: #8E959A;">회원가입</a>
					</p>
				</form>
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