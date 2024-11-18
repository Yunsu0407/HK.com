<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HK.com - 상품 정보</title>
    <link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
    <link rel="stylesheet" type="text/css" href="pages/productInfo/productInfo.css?ver241113_1">
</head>
<body>
    <div class="container">
        <!-- header 가져오기 -->
        <%@ include file="/frame/header/header.jsp"%>

        <!-- 메인 콘텐츠 -->
        <div class="main">
            <div class="product-container">
                <!-- 상품 이미지 -->
                <div class="product-image">
                    <img src="assets/layered.png" alt="상품 이미지">
                </div>

                <!-- 상품 상세 정보 -->
                <div class="product-details">
                    <h1 class="product-title">Layered Top</h1>
                    <p class="product-price">10,900 WON</p>

                    <!-- 장바구니 및 구매 폼 -->
                    <form id="cartForm" action="cart" method="post" onsubmit="return validateForm()">
                        <!-- 상품명 -->
                        <input type="hidden" name="productName" value="Layered Top">
                        <!-- 상품 가격 -->
                        <input type="hidden" name="productPrice" value="10900">
                        <!-- 상품 이미지 -->
                        <input type="hidden" name="productImage" value="assets/layered.png">

                        <!-- 옵션 선택 -->
                        <label for="product-option">사이즈:</label>
                        <select id="product-option" name="productSize" class="product-option" required>
                            <option disabled selected value="">- [필수] 옵션을 선택해 주세요 -</option>
                            <option value="L">L</option>
                            <option value="M">M</option>
                            <option value="S">S</option>
                        </select>
                        <br>

                        <!-- 수량 선택 -->
                        <div class="quantity-container">
                            <button type="button" class="quantity-btn" onclick="decreaseQuantity()">-</button>
                            <input type="number" id="quantity" name="quantity" class="quantity-input" value="1" min="1" readonly>
                            <button type="button" class="quantity-btn" onclick="increaseQuantity()">+</button>
                        </div>

                        <!-- 총 가격 표시 -->
                        <p class="total-price">
                            총 금액: <strong id="total-price">10,900</strong> WON
                        </p>

                        <!-- 장바구니 및 바로구매 버튼 -->
                        <div class="purchase-buttons">
                            <button type="submit" class="add-to-cart">장바구니</button>
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
                    <p>긴 길이와 옆트임으로 활용도 높은 레이어드 탑 티셔츠입니다.</p>
                    <p><strong>코튼 100% 코마사 30수 싱글 저지원단</strong>을 사용하여 편안한 착용감을 제공합니다.</p>
                </div>

                <div id="purchase-info" class="tab-content">
                    <h2>상품 구매 안내</h2>
                    <p>상품 구매 관련 안내 사항이 여기에 표시됩니다.</p>
                </div>
            </div>

            <!-- JavaScript -->
            <script>
                // 수량 증가 함수
                function increaseQuantity() {
                    var quantityElement = document.getElementById("quantity");
                    var totalPriceElement = document.getElementById("total-price");
                    var productPrice = 10900;
                    var quantity = parseInt(quantityElement.value);
                    quantity++;
                    quantityElement.value = quantity;
                    totalPriceElement.innerText = (productPrice * quantity).toLocaleString();
                }

                // 수량 감소 함수
                function decreaseQuantity() {
                    var quantityElement = document.getElementById("quantity");
                    var totalPriceElement = document.getElementById("total-price");
                    var productPrice = 10900;
                    var quantity = parseInt(quantityElement.value);
                    if (quantity > 1) {
                        quantity--;
                        quantityElement.value = quantity;
                        totalPriceElement.innerText = (productPrice * quantity).toLocaleString();
                    }
                }

                // 폼 유효성 검증
                function validateForm() {
                    var productOption = document.getElementById("product-option").value;
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
                        tabLinks[i].className = tabLinks[i].className.replace(" active", "");
                    }
                    document.getElementById(tabName).style.display = "block";
                    evt.currentTarget.className += " active";
                }
                document.getElementById("details").style.display = "block";
            </script>
        </div>

        <!-- footer 가져오기 -->
        <%@ include file="/frame/footer/footer.jsp"%>
    </div>
</body>
</html>
