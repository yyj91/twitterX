<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/scripts.js"></script>
<link rel="stylesheet" href="./resources/css/detail.css">
</head>
<body>

	<header class="masthead">
		<form action="./edit" method="post">
			<div class="container">
				<div id="detail">
					<div id="detailN_no" style="height: 0px; visibility: hidden;">${detail.tno }</div>
					<div id="detailIdDate">
						<div id="detailID">${detail.tnick }</div>
						<div id="detailDate">${detail.tdate }</div>
					</div>
					<textarea id="detailContent" name="twrite">${detail.twrite }</textarea>
					<input type="hidden" name="tno" value="${detail.tno }">
					<div>
						<button class="btn2" type="submit">글수정</button>
						<button class="btn" onclick="location.href='./main'">mainpage</button>
					</div>
				</div>
			</div>
		</form>
	</header>



</body>
</html>