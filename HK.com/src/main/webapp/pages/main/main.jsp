<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css" href="pages/main/main.css?ver241113_2">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div class="main-entrance-picture">대문 사진</div>
			<div class="main-new-arrival">신상품 사진</div>
			<div class="main-discount-items">할인 상품 사진</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>