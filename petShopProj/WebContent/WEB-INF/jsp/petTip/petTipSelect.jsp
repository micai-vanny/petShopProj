<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'${pageContext.request.contextPath }/fileUpload',
			height: '600px',
			width: '900px'
		});
	})
</script>
<div align="center">
	<h3>Pet Tips!</h3>
	<form id="frm" action="petTipUpdate.do" method="post">
		<input type="hidden" name="id" value="${petTip.id }">
		<table border="1">
			<tr>
				<th>no.</th><td id="id">${petTip.id }</td>
				<th>작성일자</th><td>${petTip.regDate }</td>
				<th>조회수</th><td>${petTip.hit }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5">
					<c:choose>
					<c:when test="${id eq 'admin' }">
						<input id="title" name="title" type="text" value="${petTip.title }">
					</c:when>
					<c:otherwise>
						${petTip.title }
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<c:choose>
					<c:when test="${id eq 'admin' }">
						<td colspan="5"><textarea id="content" name="content" rows="6" cols="90">${petTip.content }</textarea></td>
					</c:when>
					<c:otherwise>
						${petTip.content }
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div>
			<button type="button" onclick="location.href='petTip.do'">돌아가기</button>
			<c:if test="${id eq 'admin' }">
				<button type="submit">수정하기</button>
				<button type="button" onclick="location.href='petTipDelete.do?id=${petTip.id}'">삭제하기</button>
			</c:if>
		</div>
	</form>
</div>