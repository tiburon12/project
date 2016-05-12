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
			style="margin-left: 300px; margin-right: 300px;">
			<h1 style="margin: 20px; font-size: 50px">회원정보</h1>
			<fieldset style="font-size: 20px">
				<legend></legend>
				<div style="height: 700px;">
					<dl
						style="margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">아이디</dt>
						<dd style="width: 80%; float: left">
							${m.mid }</dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">이름</dt>
						<dd style="width: 80%; float: left">${m.name}</dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">이메일</dt>
						<dd style="width: 80%; float: left">${m.email}</dd>
					</dl>
					<dl
						style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
						<dt style="width: 20%; float: left">전화번호</dt>
						<dd style="width: 80%; float: left">${m.phone}</dd>
					</dl>
					<div style="padding-left: 20px">
						<a href="editInfo.do?mid=${m.mid}"
							class="button button-reversed"
							style="margin-top: 20px; margin-left: auto; float: left">정보
							수정</a> <a href="delInfo.do?mid=${m.mid}"
							class="button button-reversed"
							style="margin-top: 20px; margin-left: 20px; float: left">회원
							탈퇴</a>
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