<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_3">

<link rel="stylesheet" type="text/css"
	href="pages/category/category.css?ver241117_18">
<script>
function goDetail(productId) {
    window.location.href = `/productinfo?productId=${productId}`;
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
			<div>
				<h1>${current_category}</h1>
			</div>
			<div class="category-products">
				<c:forEach var="product" items="${products}">
					<div class="category-product"
						onclick=goDetail(${product.product_key})>
						<img class="category-img" src="${product.product_imgUrl}"
							alt="상품 이미지">
						<p>${product.product_name}</p>
						<p>${product.product_price}원</p>
					</div>
				</c:forEach>
				<!-- -->
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>