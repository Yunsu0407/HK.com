<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트 페이지
	<%
if ("GET".equalsIgnoreCase(request.getMethod())) {
	// GET 요청 처리
	String jsonData = request.getParameter("data"); // 쿼리 파라미터로 데이터 가져오기
	if (jsonData != null) {
		out.println("수신된 데이터: " + jsonData); // 디버깅 출력
	} else {
		out.println("데이터가 전송되지 않았습니다.");
	}
} else {
	out.println("GET 요청이 아닙니다.");
}
%>

	<script>
	const cartData = localStorage.getItem('cart');
	if (!cartData) {
	    console.error("로컬 스토리지에 'cart' 데이터가 없습니다.");
	} else {
	    const cartItems = JSON.parse(cartData);
	    console.log("전송할 데이터:", cartItems);

	    const dataArray = cartItems.map(item => ({
	        id: item.id,
	        size: item.size,
	        quantity: item.quantity
	    }));

	    // 데이터 배열을 URL 쿼리 파라미터로 변환
	    const queryString = encodeURIComponent(JSON.stringify(dataArray));

	    // GET 요청으로 데이터 전송
	    fetch(`/HK.com/test?data=${queryString}`, { // GET 요청으로 변경
	        method: 'GET',
	    })
	    .then(response => response.text())
	    .then(data => {
	        console.log("서버 응답:", data);
	    })
	    .catch(error => {
	        console.error("오류 발생:", error);
	    });
	}

     </script>
</body>
</html>