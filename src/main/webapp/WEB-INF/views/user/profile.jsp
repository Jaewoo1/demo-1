<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<h1 align="center">내 프로필</h1>
	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<td align="center">${user.uiNum}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td align="center">${user.uiId}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td align="center">${user.uiPwd}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td align="center">${user.uiBirth}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td align="center">${user.uiPhone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td align="center">${user.uiEmail}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td align="center">${user.uiCredat}</td>
		</tr>
	</table><br>
	<div align="center">
		<button onclick="location.href='/profile-update'">정보수정</button>
		<button onclick="location.href='/user/delete'">정보삭제</button>
	</div>
</body>
</html>