<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_2">
<link rel="stylesheet" type="text/css" href="pages/signup/signup.css?ver241113_2">
</head>
<body>
	<div class="container">
		<%@ include file="/frame/header/header.jsp" %>

		<div class="main">
			<div>
				<h1>회원 가입</h1>
				<div class="progress">
					<span>1. 정보입력</span>
					&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;&nbsp; 
					<span>2. 가입완료</span>
				</div>
			</div>
			<div class="signup-container">
				<%
					// POST 요청일 경우 데이터 처리
					if ("POST".equalsIgnoreCase(request.getMethod())) {
						String userId = request.getParameter("userId");
						String password = request.getParameter("password");
						String passwordConfirm = request.getParameter("passwordConfirm");
						String name = request.getParameter("name");
						String phonePrefix = request.getParameter("phonePrefix");
						String phoneMiddle = request.getParameter("phoneMiddle");
						String phoneLast = request.getParameter("phoneLast");
						String email = request.getParameter("email");
						String phone = phonePrefix + "-" + phoneMiddle + "-" + phoneLast;

						// 비밀번호 확인 로직
						if (!password.equals(passwordConfirm)) {
							out.println("<p class='error'>비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p>");
						} else {
							// 데이터베이스에 저장
							UserDAO userDAO = new UserDAO();
							int result = userDAO.join(userId, password, name, phone, email);

							if (result == 1) {
								// 회원가입 성공 시 main.jsp로 이동
								response.sendRedirect("./main");
								return;
							} else {
								out.println("<p class='error'>회원가입에 실패했습니다. 다시 시도해주세요.</p>");
							}
						}
					}
				%>

				<!-- 회원가입 폼 -->
				<form action="" method="post" class="signup-form">
					<div class="form-group">
						<label for="userId">아이디 <span class="required">*</span></label>
						<input type="text" id="userId" name="userId"
							placeholder="영문소문자/숫자, 4~16자" required>
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
						<label for="name">이름 <span class="required">*</span></label>
						<input type="text" id="name" name="name" required>
					</div>

					<div class="form-group">
						<label for="phone">휴대전화</label>
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
						<label for="email">이메일 <span class="required">*</span></label>
						<input type="email" id="email" name="email">
					</div>

					<button type="submit" class="submit-btn">회원가입</button>
				</form>
			</div>
		</div>

		<%@ include file="/frame/footer/footer.jsp" %>
	</div>
</body>
</html>
