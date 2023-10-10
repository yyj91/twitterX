<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/left-menu.css">
<link rel="stylesheet" href="./resources/css/left-menu.css">
<link rel="stylesheet" href="./resources/css/list.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <div class="left-menu">
            <%@ include file="left-menu.jsp"%>
        </div>
        <div class="content">
            <div class="list-div">
                <h1>회원리스트</h1>
                <table class="member-table">
                    <thead>
                        <tr class="member-titile">
                            <th>번호</th>
                            <th>아이디</th>
                            <th>비밀번호</th>
                            <th>이름</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="m">
                            <tr>
                                <td>${m.mno}</td>
                                <td>${m.mid}</td>
                                <td>${m.mpw}</td>
                                <td>${m.mname}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>