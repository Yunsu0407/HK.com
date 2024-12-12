<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
		<link rel="stylesheet" type="text/css" href="frame/base.css?ver241117_1">
        <link rel="stylesheet" type="text/css" href="pages/cart/cart.css?ver241117_1">

</head>
<body>
    <div class="container">
        <!-- header -->
        <%@ include file="/frame/header/header.jsp"%>
        
        <%

        	// 상품 데이터 처리
        	String productID = request.getParameter("id");    
        	String productQuantity = request.getParameter("quantity");
            String productSize = request.getParameter("size");

            // 상품 데이터 처리
            String productName = "바지";
            String productImage = "assets/products/top/top01.png";
            String productPriceParam = "99,999";
           
            // 기본 값 초기화
            int productPrice = 0;
            int quantity = 0;

            // 데이터 처리
            boolean isEmptyCart = (productName == null || productName.isEmpty());
            if (!isEmptyCart) {
                try {
                    if (productPriceParam != null && !productPriceParam.isEmpty()) {
                        productPrice = Integer.parseInt(productPriceParam);
                    }
                    if (productQuantity != null && !productQuantity.isEmpty()) {
                        quantity = Integer.parseInt(productQuantity);
                    }
                } catch (NumberFormatException e) {
                    productPrice = 0;
                    quantity = 0;
                }
            }

            // 주문 금액 계산
            int totalPrice = productPrice * quantity;
            int shippingCost = 3000;
            int totalPayable = totalPrice + shippingCost;
        %>

        <div class="cart-container">
            <% if (isEmptyCart) { %>
                <!-- 장바구니 비었을 경우 -->
                <h1>
                <p class="empty-cart-message">이런... 장바구니가 비었네요.</p>
                </h1>
            <% } else { %>
                <!-- 왼쪽: 상품 리스트 -->
                <div class="cart-items">
                    <div class="cart-item">
                        <div class="product-image">
                            <img src="<%= productImage != null ? productImage : "" %>" alt="<%= productName %>">
                        </div>
                        <div class="item-details">
                            <h3><%= productName %></h3>
                            <p><%= productPrice %> WON</p>
                            <p>사이즈: <%= productSize != null ? productSize : "N/A" %></p>
                            <p>수량: <%= quantity > 0 ? quantity : "0" %>개</p>
                        </div>
                    </div>
                </div>

                <!-- 오른쪽: 주문 요약 -->
                <div class="order-summary">
                    <h3>기본 배송지: 집</h3>
                    <p>[01234] 서울 강남구 오렌지로 30길 30</p>

                    <div class="price-details">
                        <p>전체 상품: <%= quantity > 0 ? quantity : "0" %>개</p>
                        <p>주문 금액: <%= totalPrice > 0 ? totalPrice : "0" %> 원</p>
                        <p>상품 할인: 0원</p>
                        <p>배송비: <%= shippingCost %>원</p>
                        <hr>
                        <h4>결제 예정 금액: <%= totalPayable %> 원</h4>
                    </div>

                    <form action="order" method="get">
       					<button type="submit" class="buy-now">바로구매</button>
    				</form>
                </div>
            <% } %>
        </div>

        <!-- footer -->
        <%@ include file="/frame/footer/footer.jsp"%>
    </div>
</body>
</html>
