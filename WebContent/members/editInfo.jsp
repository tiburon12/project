<%@page import="com.project.vo.Member"%>
<%@page import="com.project.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String error = (String) request.getAttribute("error");

	MemberDAO dao = new MemberDAO();
	Member m = dao.getMember(mid);
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
				<li><a class="has_submenu">Community</a>
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
			style="margin-left: 300px; margin-right: 300px;">
			<h1 style="margin: 20px; font-size: 50px">회원정보</h1>
			<fieldset style="font-size: 20px">
				<legend></legend>
				<%
					if (error != null && !error.equals("")) {
				%>
				<p><%=error%></p>
				<%
					}
				%>
				<form action="editInfoProc.jsp" method="post">
					<div style="height: 700px;">
						<dl
							style="margin: 20px; height: 50px; border-bottom: 1px solid #000000">
							<dt style="width: 20%; float: left">아이디</dt>
							<dd style="width: 80%; float: left">
								<%=m.getMid()%></dd>
						</dl>
						<dl
							style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
							<dt style="width: 20%; float: left">비밀번호 확인</dt>
							<dd style="width: 80%; float: left">
								<input name="pwd" id="pwd" required placeholder="비밀번호입력"
									type="password" />
							</dd>
						</dl>
						<dl
							style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
							<dt style="width: 20%; float: left">이름</dt>
							<dd style="width: 80%; float: left"><%=m.getName()%></dd>
						</dl>
						<dl
							style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
							<dt style="width: 20%; float: left">이메일(수정)</dt>
							<dd style="width: 80%; float: left">
								<input name="email" id="email"
									pattern="\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}" required
									placeholder="<%=m.getEmail()%>" type="text" />
							</dd>
						</dl>
						<dl
							style="clear: both; margin: 20px; height: 50px; border-bottom: 1px solid #000000">
							<dt style="width: 20%; float: left">전화번호(수정)</dt>
							<dd style="width: 80%; float: left">
								<input name="phone" id="phone" required
									pattern="01[016789]-[0-9]{3,4}-[0-9]{4}"
									placeholder="<%=m.getPhone()%>" type="text" />
							</dd>
						</dl>
						<input type="hidden" name="mid" value="<%=m.getMid()%>"> <input
							name="send"
							style="margin-left: 20px; padding-top: 1px; padding-bottom: 5px;"
							class="formbutton" value="정보수정 " type="submit" /> <a
							href="myInfo.jsp" class="button"
							style="margin-left: 5px; padding: 3px; font-size: 19px; width: 85px; background: #8E959A; background-color: #8E959A;">취소</a>
					</div>
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