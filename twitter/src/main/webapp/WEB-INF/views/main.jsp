<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/img.css">
<link rel="stylesheet" href="./resources/css/write.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function link(url) {
		location.href = "./" + url
	}

	function check() {

		let content = document.getElementById("content");

		if (content.value.length < 10) {

			alert("10글자이상쓰세요")
			content.focus();
			return false;
		}

	}
</script>

</head>





<body>
	<%@ include file="menu.jsp"%>



	<div class="wrapper">
		<div class="left-menu">
			<table>
				<tr>
					<td><img class="logo" alt="" src="./img/logo.png"
						onclick="link(main)"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/home.png"
						onclick="link('main')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/search.png"
						onclick="link('search')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/alarm.png"
						onclick="link('alarm')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/message.png"
						onclick="link('message')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/list.png"
						onclick="link('list')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/verification.png"
						onclick="link('verification')"></td>
				</tr>
				<tr>
					<td><img class="img" alt="" src="./img/profile.png"
						onclick="link('profile')"></td>
				</tr>

				<c:choose>
					<c:when test="${sessionScope.mname eq null }">

						<tr class="lir" onclick="link('login')">

						</tr>
					</c:when>
					<c:otherwise>
					<tr class="liw" onclick="link('logout')">
						<form action="./main" method="post">

							<tr>
								<c:if test="${sessionScope.mid ne null }">
									<td><button onclick="return check()" type="submit"
											class="post">
											<img src="./img/posting.png">

										</button></td>
								</c:if>
							</tr>
					</c:otherwise>
				</c:choose>

				<tr onclick="link('login')">
					<td><img class="login" alt="" src="./img/login.png"></td>
				</tr>

			</table>
		</div>


		<div class="write-div">
			<div class="home" style="line-height: 300%">홈</div>
			<div class="recommend">&emsp;추천&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				팔로우중</div>


			<textarea name="content" id=content></textarea>

			<c:if test="${sessionScope.mid ne null }">
				<button class="btn100 btn btn-primary" type="submit"
					onclick="return check()">게시하기</button>
			</c:if>

			</form>
			<br> <br> <br>


			<div>
				<c:forEach items="${list }" var="row">

					<div class="box" onclick="location.href='./detail?tno=${row.tno}'">
						<div>
							${row.tnick}&emsp;&emsp; @${row.mid} ${detail.tdate } <span
								class="date">${row.tdate } </span>




						</div>
						<div class="content">${row.twrite}</div>
					</div>
					<div>
						<c:if test="${sessionScope.tnick ne null}">
							<button class="btn3" type="button"
								onclick="location.href='./likeup?tno=${row.tno}'">좋아요</button>
							${row.tlike}
							<button class="btn3" type="button"
								onclick="location.href='./hateup?tno=${row.tno}'">싫어요</button>
                             ${row.thate}    

						</c:if>
					</div>
				</c:forEach>

			</div>



		</div>



	</div>






</body>








</html>

