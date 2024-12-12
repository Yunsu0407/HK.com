<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Complete</title>
<!-- 기본 CSS 가져오기 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">

<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css"
	href="pages/order/order.css?ver241212_1">
</head>
<body>
	<%
	// 장바구니 초기화
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().startsWith("cart_")) {
		cookie.setMaxAge(0);
		cookie.setPath("/HK.com");
		response.addCookie(cookie);
			}
		}
	}
	%>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<!-- 페이지 내용 -->
		<div class="main">
			<div class="order-box">
				<h1>주문이 완료되었습니다.</h1>
				<p>고객님께서 주문하신 상품이 성공적으로 접수되었습니다.</p>
				<p>구매해 주셔서 감사합니다! 😊</p>
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
