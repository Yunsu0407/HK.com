<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css" href="pages/main/main.css?ver241113_32">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp"%>

<% 
    String[] newArrivalName = {"신상1", "신상2", "신상3"}; 
    String[] newArrivalPrice = {"신상 가격1", "신상 가격2", "신상 가격3"}; 
    String[] onSaleName = {"할인 상품1", "할인 상품2", "할인 상품3"}; 
    String[] originPrice = {"정상 가격1", "정상 가격2", "정상 가격3"}; 
    String[] discountRate = {"할인율1 %", "할인율2 %", "할인율3 %"}; 
    String[] discountPrice = {"할인 가격1", "할인가격2", "할인 	가격3"}; 

    // 배열들을 request scope에 추가
    pageContext.setAttribute("newArrivalName", newArrivalName);
    pageContext.setAttribute("newArrivalPrice", newArrivalPrice);
    pageContext.setAttribute("onSaleName", onSaleName);
    pageContext.setAttribute("originPrice", originPrice);
    pageContext.setAttribute("discountRate", discountRate);
    pageContext.setAttribute("discountPrice", discountPrice);
%>

		<!-- 페이지에 들어갈 내용을 main에 작성 -->
		<div class="main">
			<div class="main-entrance-picture">
				<img class="entrance-picture">
			</div>
			
			<div>
				<h1>New Arrival</h1>
			</div>
			<div class="main-new-arrivals">
                <div class="main-new-arrival">
                    <img class="new-arrival">
                    <p>${newArrivalName[0]}</p>
                    <p>${newArrivalPrice[0]}</p>
                </div>
                <div class="main-new-arrival">
                    <img class="new-arrival">
                    <p>${newArrivalName[1]}</p>
                    <p>${newArrivalPrice[1]}</p>
                </div>
                <div class="main-new-arrival">
                    <img class="new-arrival">
                    <p>${newArrivalName[2]}</p>
                    <p>${newArrivalPrice[2]}</p>
                </div>
            </div>
			
            <div>
                <h1>On Sale</h1>
            </div>
            <div class="main-on-sales">
                <div class="main-on-sale">
                    <img class="on-sale">
                    <p>${onSaleName[0]}</p>
                    <p><s>${originPrice[0]}</s></p>
                    <p>${discountPrice[0]} (${discountRate[0]})</p>
                </div>
                <div class="main-on-sale">
                    <img class="on-sale">
                    <p>${onSaleName[1]}</p>
                    <p><s>${originPrice[1]}</s></p>
                    <p>${discountPrice[1]} (${discountRate[1]})</p>
                </div>
                <div class="main-on-sale">
                    <img class="on-sale">
                    <p>${onSaleName[2]}</p>
                    <p><s>${originPrice[2]}</s></p>
                    <p>${discountPrice[2]} (${discountRate[2]})</p>
                </div>           
            </div>
        </div>

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp"%>
	</div>
</body>
</html>