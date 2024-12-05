<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241117_1">
<link rel="stylesheet" type="text/css"
	href="pages/cart/cart.css?ver241117_15">
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/frame/header/header.jsp"%>

		<%
		// 쿠키 읽기
		Cookie[] cookies = request.getCookies();
		List<String> cartDataList = new ArrayList<>();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if (cookieName.startsWith("cart_")) { // cart_로 시작하는 쿠키만 읽기
			cartDataList.add(cookie.getValue()); // 쿠키 값을 추가
				}
			}
		}

		if (cartDataList.isEmpty()) {
			// out.println("장바구니가 비었습니다.");
		} else {
			for (String cartData : cartDataList) {
				// out.println("장바구니 데이터: " + cartData + "<br/>"); // 디버깅용 출력
			}
		}

		// 장바구니 데이터 파싱
		List<Map<String, String>> cartItems = new ArrayList<>();

		for (String cartData : cartDataList) {
			String[] items = cartData.split(","); // 각 상품 정보는 쉼표(,)로 구분
			for (String item : items) {
				String[] details = item.split("-"); // 상품ID, 사이즈, 수량 구분
				if (details.length == 3) {
			Map<String, String> product = new HashMap<>();
			product.put("id", details[0]);
			product.put("size", details[1]);
			product.put("quantity", details[2]);
			cartItems.add(product);
				}
			}
		}

		// SQL로 상품 정보 가져오기
		List<Map<String, Object>> productData = new ArrayList<>();

		if (!cartItems.isEmpty()) {
			// 상품 ID 목록 생성
			List<String> productIds = new ArrayList<>();
			for (Map<String, String> item : cartItems) {
				productIds.add(item.get("id"));
			}

			// SQL 조건문 생성
			String idList = String.join(",", productIds);
			// out.println("idList: " + idList); // SQL 조건 확인

			// 데이터베이스 연결
			String jdbcUrl = "jdbc:mysql://" + System.getenv("DB_ADDR") + ":3306/webpro";
			String dbUser = "hkcom";
			String dbPassword = "2189";

			String sql = "SELECT id, name, price, image FROM ("
			+ "    SELECT topID AS id, topName AS name, topPrice AS price, topImage AS image FROM Top WHERE topID BETWEEN 100 AND 199 "
			+ "    UNION ALL "
			+ "    SELECT bottomID AS id, bottomName AS name, bottomPrice AS price, bottomImage AS image FROM Bottom WHERE bottomID BETWEEN 200 AND 299 "
			+ "    UNION ALL "
			+ "    SELECT shoesID AS id, shoesName AS name, shoesPrice AS price, shoesImage AS image FROM Shoes WHERE shoesID BETWEEN 300 AND 399 "
			+ ") combined WHERE id IN (" + idList + ")";

			try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql)) {

				// 결과 처리
				while (rs.next()) {
			Map<String, Object> product = new HashMap<>();
			product.put("id", rs.getInt("id"));
			product.put("name", rs.getString("name"));
			product.put("price", rs.getInt("price"));
			product.put("image", rs.getString("image"));
			productData.add(product);
				}

			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("DB 작업 중 오류 발생: " + e.getMessage());
			}

			// cartItems와 productData 병합
			for (Map<String, String> cartItem : cartItems) {
				String cartId = cartItem.get("id");
				for (Map<String, Object> product : productData) {
			if (cartId.equals(String.valueOf(product.get("id")))) {
				product.put("size", cartItem.get("size")); // 사이즈 추가
				product.put("quantity", cartItem.get("quantity")); // 수량 추가
			}
				}
			}
		}

		// 장바구니가 비었는지 여부
		boolean isEmptyCart = productData.isEmpty();

		request.setCharacterEncoding("UTF-8");
		// 기본 주소 초기값
		String postalCode = "01234";
		String address = "서울 강남구 오렌지로 30길 30";

		// 새 우편번호와 주소 확인
		String newPostalCode = request.getParameter("newPostalCode");
		String newAddress = request.getParameter("newAddress");

		if (newPostalCode != null && !newPostalCode.trim().isEmpty()) {
			postalCode = newPostalCode; // 새 우편번호로 업데이트
		}

		if (newAddress != null && !newAddress.trim().isEmpty()) {
			address = newAddress; // 새 주소로 업데이트
		}
		%>

		<!-- 장바구니 화면 -->
		<div class="main">
			<div class="cart-container">
				<%
			if (isEmptyCart) {
			%>
				<h1>이런... 장바구니가 비었네요.</h1>
				<%
			} else {
			%>
				<%
			DecimalFormat df = new DecimalFormat("#,###");
			%>
				<div class="cart-items">
					<%
				for (Map<String, Object> product : productData) {
					String productName = (String) product.get("name");
					String productImage = (String) product.get("image");
					int productPrice = (int) product.get("price");
					String productSize = (String) product.get("size");
					int quantity = Integer.parseInt((String) product.get("quantity"));
					int totalPrice = productPrice * quantity;
				%>
					<div class="cart-item">
						<div class="product-image">
							<img src="<%=productImage%>" alt="<%=productName%>">
						</div>
						<div class="item-details">
							<h3><%=productName%></h3>
							<p>
								가격:
								<%=df.format(productPrice)%>
								WON
							</p>
							<p>
								사이즈:
								<%=productSize%></p>
							<p>
								수량:
								<%=quantity%>개
							</p>
							<p>
								합계:
								<%=df.format(totalPrice)%>
								WON
							</p>
						</div>
					</div>
					<%
				}
				%>
				</div>


				<!-- 주문 요약 -->

				<div class="order-summary">
					<h3 style="margin: 0;">기본 배송지</h3>
					<p id="current-address" style="margin-top: 0;">
						[<%=postalCode%>]<br />
						<%=address%></p>

					<!-- 주소 변경 폼 -->
					<h3 style="margin: 0;">배송주소 및 우편번호 변경</h3>
					<form action="cart" method="post" accept-charset="UTF-8">
						<label for="new-postal-code">우편번호:</label> <input type="text"
							id="new-postal-code" name="newPostalCode"
							placeholder="우편번호를 입력하세요" required> <label
							for="new-address"><br/>배달주소:</label> <input type="text"
							id="new-address" name="newAddress" placeholder="배달주소를 입력하세요"
							required>
<br/>
						<button type="submit" class="change-address-button">변경</button>
					</form>



					<div class="price-details">
						<p>
							전체 상품:
							<%=productData.size()%>개
						</p>
						<p>
							주문 금액:
							<%=df.format(
		productData.stream().mapToInt(p -> (int) p.get("price") * Integer.parseInt((String) p.get("quantity"))).sum())%>
							원	
						</p>
						<p>배송비: 3,000원</p>
						<hr>
						<h4>
							결제 예정 금액:
							<%=df.format(
		productData.stream().mapToInt(p -> (int) p.get("price") * Integer.parseInt((String) p.get("quantity"))).sum()
				+ 3000)%>
							원
						</h4>
					</div>


					<form action="order.jsp" method="post">
						<button type="submit" class="order-button">주문하기</button>
					</form>
				</div>
				<%
			}
			%>
			</div>
		</div>

		<!-- footer -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
	<script>
		document
				.querySelector('.change-address-button')
				.addEventListener(
						'click',
						function(event) {
							const postalCodeInput = document
									.getElementById('new-postal-code').value
									.trim();
							const addressInput = document
									.getElementById('new-address').value.trim();

							if (postalCodeInput === "" || addressInput === "") {
								alert("우편번호와 주소를 모두 입력하세요!");
								event.preventDefault();
							}
						});
	</script>

</body>
</html>
