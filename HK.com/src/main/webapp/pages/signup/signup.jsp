<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입 페이지</title>
    <link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_2">
    <link rel="stylesheet" type="text/css" href="pages/signup/signup.css?ver241113_2">
</head>
<body>
    <div class="container">
        <div class="main">
            <h1>회원 가입</h1>
            <div class="progress">
                <span>1. 정보입력</span>
                &nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;&nbsp;
                <span>2. 가입완료</span>
            </div>

            <div class="signup-container">
                <%-- Variables to store form inputs --%>
                <%
                    String userId = request.getParameter("userId");
                    String password = request.getParameter("password");
                    String passwordConfirm = request.getParameter("passwordConfirm");
                    String userName = request.getParameter("userName");
                    String phonePrefix = request.getParameter("phonePrefix");
                    String phoneMiddle = request.getParameter("phoneMiddle");
                    String phoneLast = request.getParameter("phoneLast");
                    String userPhone = phonePrefix + "-" + phoneMiddle + "-" + phoneLast;  // Combine the phone number                    String userEmail = request.getParameter("userEmail");
                    String message = "";
                    String userEmail = request.getParameter("userEmail");

                    // Handle form submission (POST request)
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        if (password.equals(passwordConfirm)) {
                            // Database connection details
                            String dbURL = "jdbc:mysql://" + System.getenv("DB_ADDR") + ":3306/webpro";
                            String dbID = "hkcom";  // Replace with your DB username
                            String dbPassword = "2189";  // Replace with your DB password
                            
                            // SQL query to insert user data
                            String SQL = "INSERT INTO User (userID, userPassword, userName, userPhone, userEmail) VALUES (?, ?, ?, ?, ?)";
                            
                            try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
                                 PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                                 
                                pstmt.setString(1, userId);
                                pstmt.setString(2, password);
                                pstmt.setString(3, userName);
                                pstmt.setString(4, userPhone);
                                pstmt.setString(5, userEmail);
                                 
                                // Execute update and check for success
                                int result = pstmt.executeUpdate();
                                if (result == 1) {
                                    // Success: set cookies for user ID and password
                                    response.addCookie(new javax.servlet.http.Cookie("id", userId));
                                    response.addCookie(new javax.servlet.http.Cookie("pw", password));
                                    message = "회원 가입이 완료되었습니다!";
                                    
                                    // Redirect to main.jsp after successful signup
                                    response.sendRedirect("main");  // Add this line to redirect to main.jsp
                                } else {
                                    // Failure
                                    message = "회원 가입에 실패하였습니다. 다시 시도해 주세요.";
                                }
                            } catch (SQLException e) {
                                message = "데이터베이스 연결에 실패했습니다. " + e.getMessage();
                            }
                        } else {
                            message = "비밀번호가 일치하지 않습니다.";
                        }
                    }
                %>

                <!-- 회원가입 폼 -->
                <form action="" method="post" class="signup-form">
                    <div class="form-group">
                        <label for="userId">아이디 <span class="required">*</span></label>
                        <input type="text" id="userId" name="userId" placeholder="영문소문자/숫자, 4~16자" required>
                    </div>

                    <div class="form-group">
                        <label for="password">비밀번호 <span class="required">*</span></label>
                        <input type="password" id="password" name="password"
                            placeholder="영문 대소문자/숫자/특수문자 2가지 이상 조합, 10자~16자" required>
                    </div>

                    <div class="form-group">
                        <label for="passwordConfirm">비밀번호 확인 <span class="required">*</span></label>
                        <input type="password" id="passwordConfirm" name="passwordConfirm" required>
                    </div>

                    <div class="form-group">
                        <label for="userName">이름 <span class="required">*</span></label>
                        <input type="text" id="userName" name="userName" required>
                    </div>

                    <div class="form-group">
                        <label for="userPhone">휴대전화</label>
                        <div class="phone-group">
                            <select id="phonePrefix" name="phonePrefix">
                                <option value="010">010</option>
                                <option value="011">011</option>
                            </select>
                            <input type="text" id="phoneMiddle" name="phoneMiddle" maxlength="4" required>
                            <input type="text" id="phoneLast" name="phoneLast" maxlength="4" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userEmail">이메일 <span class="required">*</span></label>
                        <input type="email" id="userEmail" name="userEmail" required>
                    </div>

                    <button type="submit" class="submit-btn">회원가입</button>
                </form>

                <%-- Display the success/failure message after form submission --%>
                <p><%= message %></p>
            </div>
        </div>
    </div>
</body>
</html>
