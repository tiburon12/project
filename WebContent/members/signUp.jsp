<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String error = (String) request.getAttribute("error");
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnCheckUid').click(function() {
			$.ajax({
				type : "POST",
				url : "idcheck.jsp",
				dataType : 'text',
				data : {
					"mid" : $('#mid').val()
				},
				success : function(data) {
					if ($.trim(data) == "YES") {
						var ddd = $.trim(data);
						alert("사용가능한 아이디입니다.");
					} else {
						alert("이미 존재하는 아이디입니다.");
					}
				}
			});
		});
	});

	//비밀번호체크
	function validate() {
		if ($('#pwd').val() != $('#pwd2').val()) {
			alert("비밀번호가 다릅니다. 확인해주세요.");
			return false;
		}
	}
</script>
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
			style="margin-left: 15%; margin-right: 15%;">
			<h1 style="margin: 20px; font-size: 50px">회원가입</h1>
			<fieldset>

				<form name="signUp" action="signUpProc.jsp" method="post"
					onsubmit="return validate()"
					style="padding: 60px; width: 500px; border: solid 3px; border-radius: 20px; margin: 7% 0% 15% 26%; font-size: 20px">
					<%
						if (error != null && !error.equals("")) {
					%>
					<p><%=error%></p>
					<%
						}
					%>
					<p>
						<label for="mid">아이디:</label> <input name="mid" id="mid" value=""
							type="text" pattern="[a-zA-Z][a-zA-Z0-9]{3,11}" required
							placeholder="4~12자리 영문자" /><a class="button" id="btnCheckUid"
							style="cursor: pointer; height: 20px; background: #666666; font-weight: 300; padding-top: 0px; margin-left: 10px; padding-bottom: 15px;">중복확인</a>
					</p>
					<p>
						<label for="email">비밀번호:</label> <input name="pwd" id="pwd"
							value="" type="password" required placeholder="4자리 이상" />
					</p>
					<p>
						<label for="name">비밀번호 확인:</label> <input name="pwd2" id="pwd2"
							value="" type="password" required placeholder="4자리 이상" />
					</p>
					<p>
						<label for="name">이름:</label> <input name="name" id="name"
							value="" type="text" required />
					</p>
					<p>
						<label for="name">이메일:</label> <input name="email" id="email"
							value="" type="text" required pattern="\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}"/>
					</p>
					<p>
						<label for="name">전화번호:</label> <input name="phone" id="phone"
							value="" type="text" pattern="01[016789]-[0-9]{3,4}-[0-9]{4}"
							required placeholder="01x-xxxx-xxxx" />
					</p>
					<p>
						<input name="send" style="margin-left: 300px;" class="formbutton"
							value="가입하기" type="submit" />
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