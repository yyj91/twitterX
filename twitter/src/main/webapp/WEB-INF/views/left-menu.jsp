<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/img.css">
<link rel="stylesheet" href="./resources/css/write.css">
<title>Insert title here</title>

<script type="text/javascript">
	
function link(url){
	location.href="./"+url
}	
	
</script>
</head>
<body>

			<div class="left-menu">
			<table>
				<tr>
					<td><img class="logo" alt="" src="./img/logo.png"
						onclick="link(main)"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/home.png"
						 onclick="link('main')"> Home</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/explore.png"
						onclick="link('search')"> Explore</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/alarm.png"
						onclick="link('alarm')"> Notifications</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/message.png"
						onclick="link('message')"> Messages</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/list.png"
						 onclick="link('list')"> Lists</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/verified.png"
						onclick="link('verification')"> Verified</td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/profile.png"
						onclick="link('profile')">Profile</td>
				</tr>

				<c:choose>
					<c:when test="${sessionScope.mname eq null }">

						<tr class="lir" onclick="link('logout')">

						</tr>
					</c:when>
					<c:otherwise>
                   <form action="./main" method="post">

						<tr>
							<td><button type="submit" class= "post">
							<img src="./img/posting.png">
							</button></td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				<tr onclick="link('login')">
					<td><img class="login" alt="" src="./img/login.png"
						onclick="check()"></td>
				</tr>

			</table>
		</div>
</body>
</html>