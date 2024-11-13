<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<!-- 기본 CSS를 가져온다 -->
<link rel="stylesheet" type="text/css" href="frame/base.css?ver241113_2">
<!-- >> !TODO << -->
<!-- 현재 페이지에 해당하는 CSS 가져오기 -->
<link rel="stylesheet" type="text/css" href="pages/signup/signup.css?ver241113_2">
</head>
<body>
	<!-- 가장 바깥 div 이름은 container로 설정 -->
	<div class="container">
		<!-- header 가져오기 -->
		<%@ include file="/frame/header/header.jsp" %>

		<!-- >> !TODO -->
		<!-- 페이지에 들어갈 내용을 main에 작성 -->
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
				<form action="/signup" method="post" class="signup-form">
					<div class="form-group">
						<label for="userId">아이디 <span class="required">*</span></label> <input
							type="text" id="userId" name="userId"
							placeholder="영문소문자/숫자, 4~16자" required>
					</div>

					<div class="form-group">
						<label for="password">비밀번호 <span class="required">*</span></label>
						<input type="password" id="password" name="password"
							placeholder="영문 대소문자/숫자/특수문자 2가지 이상 조합, 10자~16자" required>
					</div>

					<div class="form-group">
						<label for="passwordConfirm">비밀번호 확인 <span
							class="required">*</span></label> <input type="password"
							id="passwordConfirm" name="passwordConfirm" required>
					</div>

					<div class="form-group">
						<label for="name">이름 <span class="required">*</span></label> <input
							type="text" id="name" name="name" required>
					</div>

					<div class="form-group">
						<label for="phone">휴대전화 </label>
						<div class="phone-group">
							<select id="phonePrefix" name="phonePrefix">
								<option value="010">010</option>
								<option value="011">011</option>
								<!-- Other options can be added here -->
							</select> <input type="text" id="phoneMiddle" name="phoneMiddle"
								maxlength="4" required> <input type="text"
								id="phoneLast" name="phoneLast" maxlength="4" required>
						</div>
					</div>

					<div class="form-group">
						<label for="email">이메일 <span class="required">*</span></label> <input
							type="email" id="email" name="email">
					</div>

					<button type="submit" class="submit-btn">회원가입</button>
				</form>
			</div>
		</div>
		<!-- !TODO << -->

		<!-- footer 가져오기 -->
		<%@ include file="/frame/footer/footer.jsp" %>
	</div>
</body>
</html>