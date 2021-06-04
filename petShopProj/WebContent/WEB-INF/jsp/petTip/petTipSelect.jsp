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
<style>
.wrap{
	background: white;
	border-radius: 0.5em;
	width: 80%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}

.return-btn {
	border: none;
	border-radius: 0.3em;
	background: #FFBF00;
	color: white;
	font-size: 10pt;
	padding: 5px;
}

.edit-btn {
	border: none;
	border-radius: 0.3em;
	background: #FF8000;
	color: white;
	font-size: 10pt;
	padding: 5px;
}
</style>
<div class= "wrap" align="center">
	<div style="padding: 20px">
		<h2>Pet Tips!</h2>
	</div>
	<form id="frm" action="petTipUpdate.do" method="post">
		<input type="hidden" name="id" value="${petTip.id }">
		<table style="width:80%; border-bottom: 3px solid black">
			<tr style="border-top: 3px solid black">
				<th style="text-align: center; width: 30px; padding-top: 10px; padding-bottom: 10px">no.</th>
				<td id="id" style="text-align: center; width: 30px; border-right: 1px solid lightgray; padding-top: 10px; padding-bottom: 10px">${petTip.id }</td>
				<th style="text-align: center; width: 80px; padding: 10px">작성일자</th><td align="left">${petTip.regDate }</td>
				<th style="text-align: right">조회수</th><td align="center">${petTip.hit }</td>
			</tr>
			<tr style="border-top: 1px solid black">
				<th colspan="2" style="text-align: center; padding-top: 10px; padding-bottom: 10px; border-right: 1px solid lightgray">제목</th>
				<td colspan="4" align="center">
					<c:choose>
					<c:when test="${id eq 'admin' }">
						<input id="title" name="title" type="text" value="${petTip.title }">
					</c:when>
					<c:otherwise>
						<font size="3pt"><b>${petTip.title }</b></font>
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="border-top: 1px solid black">
				<th colspan="2" style="text-align: center; border-right: 1px solid lightgray">내용</th>
				<c:choose>
					<c:when test="${id eq 'admin' }">
						<td colspan="4" align="center"><textarea id="content" name="content" rows="6" cols="90">${petTip.content }</textarea></td>
					</c:when>
					<c:otherwise>
						<td colspan="4" style="text-align: center; padding: 10px">
						${petTip.content }
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<br>
		<div style="width: 80%; text-align: right">
			<button type="button" class="return-btn" onclick="location.href='petTipListPaging.do'">돌아가기</button>
			<c:if test="${id eq 'admin' }">
				<button type="submit">수정하기</button>
				<button type="button" onclick="location.href='petTipDelete.do?id=${petTip.id}'">삭제하기</button>
			</c:if>
		</div>
		<br>
	</form>
</div>