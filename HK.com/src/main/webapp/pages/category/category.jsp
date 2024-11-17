<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_3">

<link rel="stylesheet" type="text/css"
	href="pages/category/category.css?ver241117_18">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<%
		String currCategory = request.getParameter("category");
		if (currCategory == null) {
			currCategory = "임시";
		}
		request.setAttribute("currCategory", currCategory);

		String[] categoryName = { "카테고리1", "카테고리2", "카테고리3", "카테고리4", "카테고리5", "카테고리6" };
		String[] categoryPrice = { "가격1", "가격2", "가격3", "가격4", "가격5", "가격6" };

		// 배열을 Map 형태로 결합하여 전달
		List<Map<String, String>> categories = new ArrayList<>();
		for (int i = 0; i < categoryName.length; i++) {
			Map<String, String> category = new HashMap<>();
			category.put("name", categoryName[i]);
			category.put("price", categoryPrice[i]);
			categories.add(category);
		}

		request.setAttribute("categories", categories);
		%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div>
				<h1>${currCategory}</h1>
			</div>
			<div class="category-products">
				<c:forEach var="category" items="${categories}">
					<div class="category-product">
						<img class="category-img">
						<p>${category.name}</p>
						<p>${category.price}</p>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>