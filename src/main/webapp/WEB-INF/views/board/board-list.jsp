<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<%@ include file="/WEB-INF/views/common/bs.jsp"%>
</head>
<body>
	<form action="/boards" method="GET">
		<input type="text" name="biTitle" placeholder="제목 검색" value="${param.biTitle}">
		<input type="text" name="uiName" placeholder="이름 검색" value="${param.uiName}">
		<button>검색</button>
	</form>
	<form action="/boards" method="GET" align="right" style="margin-right:20px;">
		<button onclick="loca">글쓰기</button>
	</form>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty page.list}">
				<tr>
					<th colspan="5">아직 게시물이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${page.list}" var="board">
				<tr>
					<th scope="row">${board.biNum}</th>
					<td><a href="/board?biNum=${board.biNum}">${board.biTitle}</a></td>
					<td>${board.uiName}</td>
					<td>${board.biCredat}</td>
					<td>${board.biCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="pageDiv" style=" text-align:center; font-size:12pt"></div>
	<c:if test="${!(empty page.list)}">
	<script>
		const pages = ${page.pages}; // 총 페이지
		const page = ${page.pageNum}; // 현재 페이지
		const start = Math.floor((page-1)/10)*10+1; //
		const end = (start + 9) > pages ? pages : (start + 9);
		
		//const isPre = ${page.hasPreviousPage};
        //const isNext = ${page.hasNextPage};
		let html = '';
		if(start!=1) {
			html += '<a href="/boards?page=' + (start-1) + '&biTitle=${param.biTitle}">&#x25c0</a>';
		}

		for(let i=start; i<=end; i++) {
			if( i==page ) {
				html += ' [' + i + '] ';
			}else {
				html += ' <a href="/boards?page=' + i + '&biTitle=${param.biTitle}">[' + i + ']</a> ';
			}
		}
		if(end!=pages) {
			html += '<a href="/boards?page='+ (end+1) + '&biTitle=${param.biTitle}">&#9654</a>';
		}		
		document.querySelector('#pageDiv').innerHTML = html;
		
		
	</script>
	</c:if>
</body>
</html>