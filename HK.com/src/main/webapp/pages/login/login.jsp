<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css" href="pages/login/login.css?ver241113_1" >
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div class="login-container">
				<h2>로그인</h2>
				<form action="loginAction.jsp" method="post">
					<div class="input-group">
						<input type="text" name="userid" placeholder="아이디">
					</div>
					<div class="input-group">
						<input type="password" name="password" placeholder="비밀번호">
					</div>

					<button type="submit" class="login-button">로그인</button>
				</form>
				<div class="login-links">
					<a href="#">아이디찾기</a> | <a href="#">비밀번호찾기</a> | <a href="signup">회원가입</a>
				</div>
			</div>
		</div>
		
		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
