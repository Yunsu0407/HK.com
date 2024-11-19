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
			//			currCategory = "임시";
			currCategory = "상의";

		}
		request.setAttribute("currCategory", currCategory);

		// 코딩 시작
		class Dummy {
			private String name;
			private int price;
			private String img;

			public Dummy(String name, int price, String img) {
				this.name = name;
				this.price = price;
				this.img = img;
			}

			public String getName() {
				return name;
			}

			public int getPrice() {
				return price;
			}

			public String getImg() {
				return img;
			}
		}

		String dummy_path = "assets/products/";

		String temp = dummy_path + "top/top01.png";
		request.setAttribute("temp", temp);

		String dummy_type;
		Dummy[] dummies = new Dummy[6];

		if (currCategory.equals("상의")) {
			dummy_type = "top";

		} else if (currCategory.equals("하의")) {
			dummy_type = "bottom";
		} else { // 신발)
			dummy_type = "shoes";
		}
		for (int i = 0; i < 6; ++i) {
			String dummy_name = currCategory + "0" + (i + 1); // 직접 문자열을 생성
			int dummy_price = 10000 + 1000 * i;
			String dummy_img = String.format("%s/%s/%s0%d.png", dummy_path, dummy_type, dummy_type, (i + 1));
			dummies[i] = new Dummy(dummy_name, dummy_price, dummy_img);
		}

		request.setAttribute("dummy", dummies);
		// 코딩 끝

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
				<!--			
				<c:forEach var="category" items="${categories}">
					<div class="category-product">
						<img class="category-img" src="${temp }">
						<p>${category.name}</p>
						<p>${category.price}</p>
					</div>
				</c:forEach>
				-->
				<!-- -->
				<c:forEach var="product" items="${dummy}">
					<div class="category-product">
						<img class="category-img">
						<p>${product.getName()}</p>
						<p>${product.getPrice()}</p>

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