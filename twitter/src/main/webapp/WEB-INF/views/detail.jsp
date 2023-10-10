<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

<link rel="stylesheet" href="./resources/css/detail.css?ver=0.2">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function edit(){
	if(confirm("수정하시겠습니까?")){
		location.href="./edit?tno=${detail.tno}";
	}
	
}
function del(){
	if(confirm("삭제하시겠습니까?")){
	location.href="./delete?tno=${detail.tno}";
		
	}
}
function cdel(cno){
	if(confirm("댓글을 삭제하시겠습니까?")){
		location.href="./cdel?tno=${detail.tno}&cno="+cno;
	}
}
	
	
	$(function(){  //JQuery 이용
		$(".commentBox").hide(); // class는 앞에 .이 붙는다. id는 #
		
		$("#openComment").click(function(){
			$(".commentBox").show('slow'); // 클릭을 하면 화면이 살아나요
			$("#openComment").remove();
		});
	
	
	
	$(".cdel").click(function(){ 
		if(confirm("댓글을 삭제하시겠습니까?")){
			
			
			let cno = $(this).parent().siblings(".cid").text();
			
			let cno_comment = $(this).parents(".comments"); 
			
			
			$.ajax({ 
				url: "./cdelR",
				type: "post",
				data : {tno:${detail.tno }, cno : cno},
				dataType: "json",			
				success: function(data){
					
					if(data.result == 1) {
						cno_comment.remove(); 
						
					} else {
						alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");	
					}
				},
				error: function(error){
					alert("에러가 발생했습니다 " + error);
				}
				
			});
														
		}
	}); 
	
	
		
	$(".cedit").click(function() {
		
		const tno = "${detail.tno}";
		const cno = $(this).parent().siblings(".cid").text();
				
		let content = $(this).parents(".commentHead").siblings(".commentBody").text();
				
		let recommentBox = '<div class="recommentBox">';
		recommentBox += '<form action="./cedit" method="post">';
		recommentBox += '<textarea id="rcta" name="recomment" placeholder="댓글을 입력하세요">'+content+'</textarea>';
		recommentBox += '<input type="hidden" id="tno" name="tno" value="${detail.tno }">';
		recommentBox += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
		recommentBox += '<button type="submit" id="recomment">댓글수정하기</button>';
		recommentBox += '</form>';
		recommentBox += '</div>';
		
		let commentDIV = $(this).parents(".comment");
		
		commentDIV.after(recommentBox);
		
		commentDIV.remove();
		



});
});




</script>





</head>
<body>
   <%-- <%@ include file="menu.jsp"%> --%>
   <!-- Masthead-->
   <header class="masthead">
      <div class="container">
      <div id="detail">
         <div id="detailN_no" style="height: 0px; visibility: hidden;">${detail.tno }</div>
         <div id="detailIdDate">
            <div id="detailID">${detail.tnick }</div>
            <div id="detailDate">
        
        <c:if test="${sessionScope.tnick eq detail.tnick}">    
            <button class="btn" type="submit"
					onclick="return edit()">수정하기</button>
            
            <button class="btn" type="submit"
					onclick="return del()">삭제하기</button>
					
					
           </c:if> 
            
            ${detail.tdate }</div>
         </div>
         <div id="detailContent">${detail.twrite }</div>
         <div class="commentList">
         	<c:choose>
         		<c:when test="${fn:length(commentList) gt 0 }">
         		<div class="comment">
         			<c:forEach items="${commentList }" var="c">
         				<div class="comments">
         					<div class="commentHead">
         						<div class="cname">${c.mname }(${c.mid })
									<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.mid }">
									<img alt="" src="./img/update.png" class="cedit" onclick="cedit()">&nbsp; 
			 						<img alt="" src="./img/trash.png" class="cdel" onclick="cdel1(${c.cno })">
									</c:if>
         						</div>
         							<div class="cdate">${c.cdate }</div>
         							<div class="cid">${c.cno }</div>
         					</div>
         					<div class="commentBody">${c.c_comment } </div>
         				</div>
         			
         			</c:forEach>
         		</div>
         		
         		</c:when>
         		
         		<c:otherwise>
				<div><h2>댓글이 없습니다.</h2></div>
			</c:otherwise> 
         		
         	</c:choose>
         	
         </div>
         
      <button class="btn" onclick="location.href='./main'">mainpage</button>
      <c:if test="${sessionScope.mid ne null }"> 
		<button type="button" id="openComment">댓글창 열기</button>
		
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment" placeholder="댓글을 입력하세요"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="tno" value="${detail.tno }"> 
				
			</form>
		</div>
		</c:if>
      </div>
      </div>
     

   
   
   </header>

</body>
</html>