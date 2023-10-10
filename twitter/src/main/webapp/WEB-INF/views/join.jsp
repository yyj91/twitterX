<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/join.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

// jQuery 코드 작성
$(function(){
	$("#resultForm").hide();
	$("#idCheck").click(function(){
		$("#resultForm").show();
		let mid = $("#mid").val(); 
		if(mid == "" || mid.length < 5){ 
			$("#mid").focus();
			$("#resultMSG").text("아이디는 다섯글자 이상이어야합니다.");
			$("#resultMSG").css("color", "red").css("font-weight", "bold").css("font-size", "10pt");
		} else {
			$.ajax({
				url : "./checkID",
				type : "post",
				data : {"mid" : mid},
				dataType : "json", 
				success: function(data){
					if (data.result == 1) {
						$("#mid").focus();
						$("#resultMSG").css("color", "red").text("등록된 아이디입니다.");
					} else {
						$("#resultMSG").css("color", "blue")
						$("#resultMSG").text("가입할 수 있습니다.");
					}			
				},
			});	
		}
		return false;
		
	});
});

$(function(){
	$("#joinjoin").click(function(){
		let mid = $("#mid").val();
		let mpw = $("#mpw").val();
		let mpn = $("#mpn").val();
		let mname = $("#mname").val();
		let tnick = $("#tnick").val();
		if (mid == "" || mid.length < 5) {
			alert("아이디 중복 검사를 실행하세요.");
			return false;
		}
		if (mpw == "" || mpw.length < 4) {
			alert("비밀번호를 4자이상 입력하세요.");
			return false;
		}
		if (mname.length > 4 || mname.length == "" || mname.length <= 1) {
			alert("이름을 정확히 입력해주세요.");
			return false;
		}
		if (mpn.length != 11) {
			alert("핸드폰 번호 11자리를 정확히 입력해주세요.");
			return false;
		}
		if (tnick.length < 3) {
			alert("닉네임은 3자 이상입니다.");
			return false;
		}
	
	});
	
});



</script>

</head>
<style>
.left-box {
  float: left;
  width: 60%;
}
.right-box {
  float: right;
  width: 40%;
}
</style>
<body>
	<div class='left-box'>
		<img alt="" src="./img/x.png">	
	</div>
<div class='right-box'>
<div class="join-div">
		<form action="./join" method="post">
		<br><br><br><br><br><br><br>
		<h1>계정을 생성해주세요.</h1>
		<br>
		<div class="label-row">
			<div class="label-name">아이디</div>
			
			<div class="label-in">
				<input type="text" name="mid" id="mid" placeholder="아이디를 입력하세요.">
				<br>
				<button class="btn btn-secondary" id="idCheck">중복검사</button>
				<span id="resultMSG"></span>			
			</div>
		</div>
			<div class="label-row" id="resultForm">
			<div class="label-name"></div>
			<div class="label-in"></div>
		</div>

		<div class="label-row">
			<div class="label-name">비밀번호</div>
			<div class="label-in">
				<input type="password" name="mpw" id="mpw" placeholder="비밀번호를 입력하세요.">
			</div>
		</div>
	
		<div class="label-row">
			<div class="label-name">이 름</div>
			<div class="label-in">
				<input type="text" name="mname" id="mname" placeholder="이름을 입력하세요.">
			</div>
		</div>
			<div class="label-row">
			<div class="label-name">핸드폰 번호</div>
			<div class="label-in">
			<input type="text" name="mpn" id="mpn" placeholder="핸드폰 번호를 입력하세요.">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">닉네임</div>
			<div class="label-in">
			<input type="text" name="tnick" id="tnick" placeholder="닉네임을 입력하세요.">
			</div>
		</div>
		<br>
		<div class="label-row lrbtn">
			<button type="reset" class="btn btn-secondary">취소</button>
			<button type="submit" class="btn btn-primary" id="joinjoin">가입하기</button>
		</div>
		</form>

		</div>
	</div>
		<br>
		<br><br>
</body>
</html>