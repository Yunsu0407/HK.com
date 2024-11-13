<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HK.com</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<link rel="stylesheet" type="text/css" href="pages/productInfo/productInfo.css?ver241113_1">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class=main>
			<div class="product-container">
				<!-- 상품 이미지 영역 -->
				<div class="product-image">
					<img src="assets/layered.png" alt="상품 이미지">
				</div>

				<!-- 상품 상세 정보 영역 -->
				<div class="product-details">
					<h1 class="product-title">Layered Top</h1>
					<p class="product-price">10,900 WON</p>

					<!-- 옵션 선택 -->
					<label for="product-option">Layered Top</label> <select
						id="product-option" class="product-option">
						<option disabled selected>- [필수] 옵션을 선택해 주세요 -</option>
						<option value="L">L</option>
						<option value="M">M</option>
						<option value="S">S</option>
					</select>

					<!-- 수량 선택 -->
					<div class="quantity-container">
						<button type="button" class="quantity-btn"
							onclick="decreaseQuantity()">-</button>
						<span id="quantity" class="quantity-display">1</span>
						<button type="button" class="quantity-btn"
							onclick="increaseQuantity()">+</button>
					</div>

					<p class="total-price">
						<strong>10,900 WON</strong> (<span id="total-quantity">1</span>개)
					</p>

					<div class="purchase-buttons">
						<!-- 바로구매 버튼 -->
						<form action="buy.jsp" method="get" style="display: inline;">
							<button type="submit" class="buy-now">바로구매</button>
						</form>

						<!-- 장바구니 버튼 -->
						<form action="cart.jsp" method="get" style="display: inline;">
							<button type="submit" class="add-to-cart">장바구니</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 탭 메뉴와 상세 설명 -->
			<div class="tab-container">
				<div class="tabs">
					<button class="tab-link active" onclick="openTab(event, 'details')">상품상세정보</button>
					<button class="tab-link" onclick="openTab(event, 'purchase-info')">상품구매안내</button>
				</div>

				<div id="details" class="tab-content active">
					<h2>Layered Top</h2>
					<img src="assets/layered.png" alt="상품 이미지"> <img
						src="assets/layered.png" alt="상품 이미지">

					<p>
						긴 길이와 옆트임으로 활용도 높은 레이어드 탑 티셔츠입니다. 베이직한 디자인과 긴 길이로 다양한 스타일에 레이어드하여
						활용하기에 좋습니다. <strong>코튼 100% 코마사 30수 싱글 저지원단</strong>을 사용하여 편안한
						착용감을 제공합니다.
					</p>
					<p>일반 스탠다드 티셔츠보다 밀단이 길며, 레이어드용으로 적합한 티셔츠입니다. 일반 티셔츠, 교복, 셔츠 등에
						자유롭게 레이어드 가능합니다.</p>
				</div>

				<div id="purchase-info" class="tab-content">
					<h2>상품 구매 안내</h2>
					<p>상품 구매 관련 안내 사항이 여기에 표시됩니다.</p>
					<img src="assets/layered.png" alt="상품 이미지">
				</div>
			</div>

			<!-- JavaScript 코드 -->
			<script>
				// 수량 증가 함수
				function increaseQuantity() {
					var quantityElement = document.getElementById("quantity");
					var totalQuantityElement = document
							.getElementById("total-quantity");
					var quantity = parseInt(quantityElement.innerText);
					quantity++;
					quantityElement.innerText = quantity;
					totalQuantityElement.innerText = quantity;
				}

				// 수량 감소 함수
				function decreaseQuantity() {
					var quantityElement = document.getElementById("quantity");
					var totalQuantityElement = document
							.getElementById("total-quantity");
					var quantity = parseInt(quantityElement.innerText);
					if (quantity > 1) { // 최소 수량을 1로 설정
						quantity--;
						quantityElement.innerText = quantity;
						totalQuantityElement.innerText = quantity;
					}
				}

				function openTab(evt, tabName) {
					// 모든 탭 콘텐츠를 숨김
					var i, tabContent, tabLinks;
					tabContent = document.getElementsByClassName("tab-content");
					for (i = 0; i < tabContent.length; i++) {
						tabContent[i].style.display = "none";
					}

					// 모든 탭 링크의 활성화 클래스 제거
					tabLinks = document.getElementsByClassName("tab-link");
					for (i = 0; i < tabLinks.length; i++) {
						tabLinks[i].className = tabLinks[i].className.replace(
								" active", "");
					}

					// 현재 탭을 표시하고 활성화
					document.getElementById(tabName).style.display = "block";
					evt.currentTarget.className += " active";
				}

				// 기본적으로 첫 번째 탭을 표시
				document.getElementById("details").style.display = "block";
			</script>
		</div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>
