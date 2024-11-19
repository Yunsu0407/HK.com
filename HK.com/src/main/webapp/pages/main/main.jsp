<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_2">
<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css"
	href="pages/main/main.css?ver241113_41">
<script>
function goDetail(productId) {
    window.location.href = `productinfo?productId=${productId}`;
}
</script>
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div class="main-entrance-picture">
				<img class="entrance-picture">
			</div>

			<div class="main-products">
				<c:forEach var="product" items="${products}">
					<div class="main-product"
						onclick="goDetail(${product.product_key})">
						<img class="main-product-img" src="${product.product_imgUrl}"
							alt="상품 이미지" />
						<p>${product.product_name}</p>
						<p>${product.product_price}원</p>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
