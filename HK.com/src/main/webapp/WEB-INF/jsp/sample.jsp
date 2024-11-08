<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 기본 CSS를 가져온다 -->
	<link rel="stylesheet" href="css/base.css"> 
	
	<!-- >> !TODO << -->
	<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
	<link rel="stylesheet" href="css/sample.css">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="header.jsp"%>
		
		<!-- >> !TODO -->
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<main class="sample">
			<h2>Sample Page</h2>
			<p>This is the sample content of the website.</p>
		</main>
		<!-- !TODO << -->
		
		<!-- footer 가져오기 -->
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>