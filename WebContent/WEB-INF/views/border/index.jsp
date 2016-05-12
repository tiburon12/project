<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>REVENTE</title>
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
				<li class="selected"><a href="index.do">Home</a></li>
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

		<div class="clear" style="height: 300px">
			<div
				style="width: 500px; height: 300px; float: left; margin-left: 20%; margin-top: 40px;">
				<span id="main_title" style="color: #ffffff">REVENTE</span>
			</div>
			<c:if test="${!empty sessionScope.mid}">
				<div
					style="border: solid 5px #ffffff; border-radius: 20px; float: left; margin-left: 10%; margin-top: 35px; width: 345px; height: 183px;">
					<h2 style="margin: 10px 0px 10px 30px; color: #96B1DC">${mid}님
					</h2>
					<h2 style="margin-left: 30px; margin-bottom: 10px; color: #96B1DC">환영합니다.</h2>
					<a href="myInfo.do" class="button"
						style="margin-left: 50px; padding: 5px; font-size: 20px; width: 100px; background: #8E959A; background-color: #8E959A;">내정보</a>
					<a href="logoutProc.do" class="button"
						style="margin-left: 5px; padding: 5px; font-size: 20px; width: 100px; background: #8E959A; background-color: #8E959A;">로그아웃</a>
				</div>
			</c:if>
			<c:if test="${empty sessionScope.mid}">
				<div style="float: left; margin-left: 10%; margin-top: 35px;">

					<form action="loginProc.do" method="post"
						style="border: solid 5px #ffffff; border-radius: 20px; width: 300px; height: 150px; padding-top: 35px; padding-left: 50px; font-size: 18px">
						<p style="margin-bottom: 10px;">
							<input style="border-radius: 10px;" name="mid" value=""
								type="text" required placeholder="아이디" />
						</p>
						<p>
							<input style="border-radius: 10px;" name="pwd" value=""
								type="password" required placeholder="비밀번호" />
						</p>
						<p>
							<input name="login"
								style="cursor: pointer; margin-left: 0px; padding-top: 4px; padding-bottom: 8px; width: 100px"
								class="formbutton" value="로그인" type="submit" /> <a
								href="signUp.do" class="button"
								style="margin-left: 5px; padding: 0px; font-size: 14px; width: 100px; background: #8E959A; background-color: #8E959A; height: 31px;">회원가입</a>
						</p>
					</form>
				</div>
			</c:if>

		</div>
		</header>

		<div id="body" class="width">
			<section id="content"> <article>
			<h2 style="margin: 20px">최신 상품 목록</h2>
			<c:if test="${!empty slist2}">
				<c:forEach var="i" items="${slist2}">
					<a href="detail.do?border=sell&pages=1&seq=${i.seq}"><img
						width="282" height="220"
						style="border-radius: 10px; border: 2px solid"
						src="upload/${i.fileSrc}" alt="" /></a>

				</c:forEach>
			</c:if> </article> </section>

			<section id="content">
			<div
				style="width: 600px; height: 160px; float: left; margin: 20px; border-top: 1px solid #000000">
				<h3>판매 게시판</h3>
				<dl style="margin: 20px;">
					<c:if test="${slist.size()>0}">
						<c:forEach var="i" items="${slist}" begin="0" end="4">
							<dd style="width: 80%; float: left">
								<a href="detail.do?border=sell&pages=1&seq=${i.seq}">${i.title}</a>
							</dd>
						</c:forEach>
					</c:if>
				</dl>
			</div>
			<div
				style="width: 600px; height: 160px; float: left; margin: 20px; border-top: 1px solid #000000">
				<h3>구매 게시판</h3>
				<dl style="margin: 20px;">
					<c:if test="${blist.size()>0}">
						<c:forEach var="i" items="${blist}" begin="0" end="4">
							<dd style="width: 80%; float: left">
								<a href="detail.do?border=buy&pages=1&seq=${i.seq}">${i.title}</a>
							</dd>

						</c:forEach>
					</c:if>
				</dl>
			</div>
			<div
				style="width: 600px; height: 160px; float: left; margin: 20px; border-top: 1px solid #000000">
				<h3>자유 게시판</h3>
				<dl style="margin: 20px;">
					<c:if test="${flist.size()>0}">
						<c:forEach var="i" items="${flist}" begin="0" end="4">
							<dd style="width: 80%; float: left">
								<a href="freeDetail.do?border=free&pages=1&seq=${i.seq}">${i.title}</a>
							</dd>
						</c:forEach>
					</c:if>
				</dl>
			</div>
			<div
				style="width: 600px; height: 160px; float: left; margin: 20px; border-top: 1px solid #000000">
				<h3>후기 게시판</h3>
				<dl style="margin: 20px;">
					<dd style="width: 80%; float: left">
						<a href="#">제목제목제목제목제목</a>
					</dd>
					<dd style="width: 80%; float: left">
						<a href="#">제목제목제목제목제목</a>
					</dd>
					<dd style="width: 80%; float: left">
						<a href="#">제목제목제목제목제목</a>
					</dd>
				</dl>
			</div>
			</section>

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