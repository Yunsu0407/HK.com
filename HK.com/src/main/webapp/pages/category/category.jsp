<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_3">

<link rel="stylesheet" type="text/css"
	href="pages/category/category.css?ver241117_23">
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
		<%
		String jdbcUrl = "jdbc:mysql://" + System.getenv("DB_ADDR") + ":3306/webpro";
		if (jdbcUrl == null || jdbcUrl.isEmpty()) {
			out.println("DB_ADDR 환경 변수가 설정되지 않았습니다.");
			return; // 흐름 중단
		}

		String dbUser = "yunsu0407"; // 데이터베이스 사용자명
		String dbPassword = "gksdbstn12A!"; // 데이터베이스 비밀번호
		String category = (String) request.getAttribute("current_category");
		String table;
		if (category.equals("상의")) {
			table = "Top";
			category = "top";
		} else if (category.equals("하의")) {
			table = "Bottom";
			category = "bottom";
		} else {
			table = "Shoes";
			category = "shoes";
		}

		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버 로드
			conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			// 2. 쿼리 실행
			stmt = conn.createStatement();
			sql = "SELECT * FROM " + table; // 데이터 가져오는 SQL
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("DB 연동 오류: " + e.getMessage());
			e.printStackTrace();
			return; // 흐름 중단
		}

		Product[] products = new Product[6];

		int count = 0;
		while (rs.next()) {
			int id = rs.getInt(category + "ID");
			String name = rs.getString(category + "Name");
			int price = rs.getInt(category + "Price");
			String image = rs.getString(category + "Image");
			products[count] = new Product(id, name, price, image);
			++count;
		}

		request.setAttribute("products", products);
		%>
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div>
				<h1>${current_category}</h1>
			</div>
			<div class="category-products">
				<c:forEach var="product" items="${products}">
					<a class="category-product"
						href="productinfo?productId=${product.product_key}"> <img
						class="category-img" src="${product.product_imgUrl}" alt="상품 이미지">
						<p>${product.product_name}</p>
						<p>${product.product_price}원</p>

					</a>
				</c:forEach>
				<!-- -->
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>