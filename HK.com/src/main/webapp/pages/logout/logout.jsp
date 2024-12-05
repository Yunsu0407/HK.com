<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession hkcomSession = request.getSession(false); // 세션 가져오기
	if (hkcomSession != null) {
		hkcomSession.invalidate(); // 세션 무효화
	}
	response.sendRedirect("main"); // 로그아웃 후 로그인 페이지로 리다이렉트
	%>

</body>
</html>