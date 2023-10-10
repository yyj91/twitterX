<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트위터. 핵심은 '실시간'입니다. /X</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
</head>
<body>

	<h1>지금 일어나고 있는 일</h1>
	<h1>지금 가입하세요.</h1>
	
	<div class="main">
		<div class="login-box">
			<div class="login-image">
				<img alt="logo" src="./img/logo.png">
			</div>
			<div class="login-form">
				<form action="./login" method="post" onsubmit="return check()">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required="required" maxlength="10" onchange="checkID()"> 
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" required="required" maxlength="15">
					<button type="submit" class="login">로그인</button>
					
					아이디 찾기 | 비밀번호 찾기 
				</form>

			</div>

		</div>

	</div>


</body>
</html>