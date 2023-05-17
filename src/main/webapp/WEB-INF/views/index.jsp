<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/bs.jsp"%>
</head>
<body>
<c:if test="${user == null}">
	<li><a href="/login">로그인</a></li>
	<li><a href="/join">회원가입</a></li>
</c:if>
<c:if test="${user.uiId != null}">
			${user.uiName}님 안녕하세요! <br>
	<ul>
		<li><a href="/logout">로그아웃</a></li>
		<li><a href="/profile">프로필</a></li>	
		<li><a href="/boards">게시판</a></li>
	</ul>
</c:if>
</body>
</html>