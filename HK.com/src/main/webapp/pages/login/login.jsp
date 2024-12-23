<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_1">
<link rel="stylesheet" type="text/css"
	href="pages/login/login.css?ver241113_17">
</head>
<body>
	<div class="container">
		<%@ include file="/frame/header/header.jsp"%>

		<div class="main">
			<div class="login-container">
				<h2>로그인</h2>

				<%
				// Get user inputs
				String userId = request.getParameter("userid");
				String password = request.getParameter("password");
				String message = "";

				// Database connection details
				String dbURL = "jdbc:mysql://" + System.getenv("DB_ADDR") + ":3306/webpro";
				String dbID = "hkcom"; // Replace with your DB username
				String dbPassword = "2189"; // Replace with your DB password

				// SQL query to check user credentials
				String SQL = "SELECT userID FROM User WHERE userID = ? AND userPassword = ?";

				// Handle form submission (POST request)
				if ("POST".equalsIgnoreCase(request.getMethod())) {
					try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
					PreparedStatement pstmt = conn.prepareStatement(SQL)) {

						pstmt.setString(1, userId);
						pstmt.setString(2, password);

						ResultSet rs = pstmt.executeQuery();

						// Check if user exists
						if (rs.next()) {
					String userID = rs.getString("userID");
					System.out.println(userID);
					// Create or get existing session
					if (hkcomSession == null) {
						hkcomSession = request.getSession();
					}
					hkcomSession.setAttribute("userID", userID); // Save PK to session

					// User found: Redirect to main.jsp
					response.sendRedirect("main");
					return;
						} else {
					// Invalid credentials: Display message
					// 여기 alert 추가
					message = "아이디 또는 비밀번호가 잘못되었습니다.";
						}

					} catch (SQLException e) {
						// 여기 alert 추가
						message = "데이터베이스 연결에 실패했습니다. " + e.getMessage();
					}
				}
				%>

				<%-- Login Form --%>
				<form action="" method="post">
					<div class="input-group">
						<input type="text" name="userid" placeholder="아이디" required>
					</div>
					<div class="input-group">
						<input type="password" name="password" placeholder="비밀번호" required>
					</div>
					<button type="submit" class="login-button">로그인</button>
				</form>
				<div class="login-links">
					<form action="signup" method="get">
						<button type="submit" class="signup-button">회원가입</button>
					</form>
				</div>
			</div>
		</div>

		<%@ include file="/frame/footer/footer.jsp"%>
	</div>

</body>
</html>
