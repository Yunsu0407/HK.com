<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title></title>
	<!-- 기본 CSS를 가져온다 -->
	<link rel="stylesheet" href="css/base.css"> 
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="header.jsp"%>
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<main class="main">
			<div class="main_entrance_picture">
				대문 사진입니다.
			</div>
		
		</main>
		<!-- footer 가져오기 -->
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>