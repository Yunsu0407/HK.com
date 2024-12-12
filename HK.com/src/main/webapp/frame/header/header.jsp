<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" type="text/css"
	href="frame/header/header.css?ver241113_2">
</head>
<body>
	<div class="header">
		<div class="header-logo">
			<a class="header-anchor" href="./">HK.com</a>
		</div>

		<div class="header-categories">
			<a class="header-anchor header-category" href="category?category=상의">
				상의 </a> <a class="header-anchor header-category"
				href="category?category=하의"> 하의 </a> <a
				class="header-anchor header-category" href="category?category=신발">
				신발 </a>
		</div>

		<div class="header-buttons">
			<%
			// 세션에서 userPK 확인
			HttpSession hkcomSession = request.getSession(false); // 기존 세션 가져오기
			if (hkcomSession != null && hkcomSession.getAttribute("userID") != null) {
				// 세션에 userPK가 있으면 로그아웃 버튼 표시
			%>
			<a class="header-anchor header-button" href="logout">로그아웃</a>
			<%
			} else {
			// 세션에 userPK가 없으면 로그인 및 회원가입 버튼 표시
			%>
			<a class="header-anchor header-button" href="signup">회원가입</a> <a
				class="header-anchor header-button" href="login">로그인</a>
			<%
			}
			%>

			<!-- 
			<a class="header-anchor header-button" href="signup">회원가입</a>
			<a class="header-anchor header-button" href="login">로그인</a> 
			-->
			<a class="header-anchor header-button" href="cart">장바구니</a>
		</div>
	</div>
</body>
</html>