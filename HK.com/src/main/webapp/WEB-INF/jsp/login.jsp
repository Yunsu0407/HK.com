<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>HK.com</title>
	<!-- 기본 CSS를 가져온다 -->
	<link rel="stylesheet" href="css/base.css"> 
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="header.jsp"%>
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<main class="main">
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
                    <a href="#">아이디찾기</a> |
                    <a href="#">비밀번호찾기</a> |
                    <a href="signup">회원가입</a>
                </div>
            </div>
		</main>
		<!-- footer 가져오기 -->
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
