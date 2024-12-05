<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HK.com - 상품 정보</title>
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<link rel="stylesheet" type="text/css"
	href="pages/productInfo/productInfo.css?ver241113_7">
</head>
<body>
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

		String sProduct_id = (String) request.getAttribute("productId");
		if (sProduct_id == null || sProduct_id.isEmpty()) {
			out.println("상품 ID가 제공되지 않았습니다. product");
			return; // 페이지 실행 중단
		}
		int product_id = Integer.parseInt(sProduct_id);
		String category;
		String table;
		if (product_id >= 100 && product_id < 200) {
			table = "Top";
			category = "top";
		} else if (product_id >= 200 && product_id < 300) {
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
			sql = "SELECT * FROM " + table + " WHERE " + category + "ID = " + product_id; // 데이터 가져오는 SQL
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("DB 연동 오류: " + e.getMessage());
			e.printStackTrace();
			return; // 흐름 중단
		}

		Product product = null;
		int sizeL = 0, sizeM = 0, sizeS = 0, price = 0, totalPrice;
		while (rs.next()) {
			int id = rs.getInt(category + "ID");
			String name = rs.getString(category + "Name");
			price = rs.getInt(category + "Price");
			String image = rs.getString(category + "Image");
			String description = rs.getString(category + "Description");
			sizeL = rs.getInt(category + "SizeL");
			sizeM = rs.getInt(category + "SizeM");
			sizeS = rs.getInt(category + "SizeS");
			product = new Product(id, name, price, image, description, sizeL, sizeM, sizeS);
		}
		totalPrice = price;
		request.setAttribute("product", product);
		%>
		<!-- 메인 콘텐츠 -->
		<div class="main">
			<div class="product-container">
				<!-- 상품 이미지 -->
				<div class="product-image">
					<img src="${product.product_imgUrl}" alt="상품 이미지">
				</div>

				<!-- 상품 상세 정보 -->
				<div class="product-details">
					<h1 class="product-title">${product.product_name}</h1>
					<%
					DecimalFormat df = new DecimalFormat("#,###,###");
					String expPrice = df.format(totalPrice);
					%>
					<p class="product-price">
						금액:
						<%=expPrice%>
						WON
					</p>

					<!-- 장바구니 및 구매 폼 -->
					<form id="cartForm" action="cart" method="post"
						onsubmit="return validateForm()">
						<!-- 상품명 -->
						<input type="hidden" name="id" value="${product.product_id}">

						<!-- 옵션 선택 -->
						<label for="product-option">사이즈:</label> <select
							id="product-option" name="size" class="product-option" required>
							<option disabled selected value="">- [필수] 옵션을 선택해 주세요 -</option>
							<option value="L" <%=sizeL > 0 ? "" : "disabled"%>>L [
								남은 수량:
								<%=sizeL%> ]
							</option>
							<option value="M" <%=sizeM > 0 ? "" : "disabled"%>>M [
								남은 수량:
								<%=sizeM%> ]
							</option>
							<option value="S" <%=sizeS > 0 ? "" : "disabled"%>>S [
								남은 수량:
								<%=sizeS%> ]
							</option>
						</select> <br>

						<!-- 수량 선택 -->
						<div class="quantity-container">
							<button type="button" class="quantity-btn"
								onclick="decreaseQuantity()">-</button>
							<input type="number" id="quantity" name="quantity"
								class="quantity-input" value="1" min="1" readonly>
							<button type="button" class="quantity-btn"
								onclick="increaseQuantity()">+</button>
						</div>

						<!-- 총 가격 표시 -->
						<p class="total-price">
							총 금액: <strong id="total-price"><%=expPrice%></strong> WON
						</p>

						<!-- 장바구니 및 바로구매 버튼 -->
						<div class="purchase-buttons">
							<button type="button" class="add-to-cart" onclick="addToCart()">장바구니</button>
							<button type="submit" formaction="buy.jsp" class="buy-now">바로구매</button>
						</div>
					</form>
				</div>
			</div>

			<!-- 탭 메뉴와 상세 설명 -->
			<div class="tab-container">
				<div class="tabs">
					<button class="tab-link active" onclick="openTab(event, 'details')">상품상세정보</button>
					<button class="tab-link" onclick="openTab(event, 'purchase-info')">상품구매안내</button>
				</div>

				<div id="details" class="tab-content active">
					<h2>상품 상세 정보</h2>
					<p>${product.product_description }</p>
				</div>

				<div id="purchase-info" class="tab-content">
					<h2>상품 구매 안내</h2>
					<h4>배송 안내</h4>
					<p>
						고객님께서 주문하신 상품은 일반적으로 결제 완료 후 2~3일 이내에 배송됩니다.<br />도서산간 지역은 추가
						배송비가 발생할 수 있습니다.
					</p>
					<br />
					<h4>환불 안내</h4>
					<p>
						상품 수령 후 7일 이내에 교환 또는 환불이 가능하며, 제품 불량 또는 오배송의 경우 배송비는 쇼핑몰이 부담합니다.<br />단순
						변심에 의한 환불은 왕복 배송비를 고객님께서 부담하셔야 하며, 상품 및 포장 상태가 훼손되지 않은 경우에 한해
						처리됩니다.
					</p>
				</div>
			</div>

			<!-- JavaScript -->
			<script>
				var totalPrice =
			<%=totalPrice%>
				;
				var productPrice =
			<%=price%>
				;
				// 수량 증가 함수
				// 수량 증가 함수
				function increaseQuantity() {
					var quantityElement = document.getElementById("quantity");
					var totalPriceElement = document
							.getElementById("total-price");
					var quantity = parseInt(quantityElement.value);

					quantity++;
					quantityElement.value = quantity;
					totalPriceElement.innerText = (productPrice * quantity)
							.toLocaleString(); // 금액 포맷 적용
				}

				// 수량 감소 함수
				function decreaseQuantity() {
					var quantityElement = document.getElementById("quantity");
					var totalPriceElement = document
							.getElementById("total-price");
					var quantity = parseInt(quantityElement.value);

					if (quantity > 1) {
						quantity--;
						quantityElement.value = quantity;
						totalPriceElement.innerText = (productPrice * quantity)
								.toLocaleString(); // 금액 포맷 적용
					}
				}

				// 폼 유효성 검증
				function validateForm() {
					var productOption = document
							.getElementById("product-option").value;
					var quantity = document.getElementById("quantity").value;

					if (!productOption || productOption === "") {
						alert("사이즈를 선택해주세요.");
						return false;
					}

					if (quantity <= 0) {
						alert("수량을 1개 이상으로 설정해주세요.");
						return false;
					}

					return true; // 모든 데이터가 유효하면 제출
				}

				// 탭 메뉴 관리
				function openTab(evt, tabName) {
					var i, tabContent, tabLinks;
					tabContent = document.getElementsByClassName("tab-content");
					for (i = 0; i < tabContent.length; i++) {
						tabContent[i].style.display = "none";
					}
					tabLinks = document.getElementsByClassName("tab-link");
					for (i = 0; i < tabLinks.length; i++) {
						tabLinks[i].className = tabLinks[i].className.replace(
								" active", "");
					}
					document.getElementById(tabName).style.display = "block";
					evt.currentTarget.className += " active";
				}
				document.getElementById("details").style.display = "block";
			</script>
			<script>
				function addToCart() {
					var productId = document.querySelector("input[name='id']").value;
					var size = document.querySelector("select[name='size']").value;
					var quantity = document
							.querySelector("input[name='quantity']").value;

					if (!size || quantity <= 0) {
						alert("사이즈와 수량을 확인해주세요.");
						return;
					}

					var randomId = generateRandomId();
					var cookieValue = productId + "-" + size + "-" + quantity;

					setCookie(randomId, cookieValue);

					console.log("새 쿠키 생성: " + randomId + "=" + cookieValue);
					alert("상품이 장바구니에 추가되었습니다!");
				}

				function generateRandomId() {
					return 'cart_' + Math.random().toString(36).substring(2, 12);
				}

				function setCookie(name, value) {
					document.cookie = name + "=" + value;
				}
			</script>

		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
