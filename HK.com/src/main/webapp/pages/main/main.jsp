<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.Product"%>
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
	href="pages/main/main.css?ver241113_47">
<script>
	function goDetail(productId) {
		if (!productId) {
			alert("상품 ID가 제공되지 않았습니다. main");
			return;
		}
		console.log(`Navigating to productinfo with productId: ${productId}`);
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

		String dbUser = "hkcom"; // 데이터베이스 사용자명
		String dbPassword = "2189"; // 데이터베이스 비밀번호

		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버 로드
			conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			// 2. 쿼리 실행
			stmt = conn.createStatement();
			sql = "SELECT * FROM MainView"; // 데이터 가져오는 SQL
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("DB 연동 오류: " + e.getMessage());
			e.printStackTrace();
			return; // 흐름 중단
		}

		Product[] products = new Product[9];

		int count = 0;
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			products[count] = new Product(id, name, price, image);
			++count;
		}

		request.setAttribute("products", products);
		%>
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div class="main-entrance-picture">
				<img class="entrance-picture" src="assets/main/entrance.jpg"
					alt="대문 사진">
			</div>

			<div class="main-products">
				<c:forEach var="product" items="${products}">
					<a class="main-product"
						href="productinfo?productId=${product.product_key}"> <img
						class="main-product-img" src="${product.product_imgUrl}"
						alt="상품 이미지" />
						<p>${product.product_name}</p>
						<p>${product.product_price}원</p>
					</a>
				</c:forEach>
			</div>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
