<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function petTipUpdate() {
		let id = document.getElementById("pid").innerHTML;
		let title = document.getElementById("ptitle").value;
		let content= document.getElementById("pcontent").value;
		
		frm.id.value = id;
		frm.title.value = title;
		frm.content.value = content;
		frm.submit();
	}
</script>
<div align="center">
	<h3>Pet Tips!</h3>
	<form id="frm" action="petTipUpdate.do" method="post">
		<input type="hidden" name="id">
		<input type="hidden" name="title">
		<input type="hidden" name="content">
	</form>
	<table border="1">
		<tr>
			<th>no.</th><td id="pid">${petTip.id }</td>
			<th>작성일자</th><td>${petTip.regDate }</td>
			<th>조회수</th><td>${petTip.hit }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5"><input id="ptitle" type="text" value="${petTip.title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5"><textarea id="pcontent" rows="6" cols="90">${petTip.content }</textarea></td>
		</tr>
	</table>
	<div>
		<button type="button" onclick="location.href='petTip.do'">돌아가기</button>
		<c:if test="${id eq 'admin' }">
			<button type="button" onclick="petTipUpdate()">수정하기</button>
			<button type="button" onclick="location.href='petTipDelete.do?id=${petTip.id}'">삭제하기</button>
		</c:if>
	</div>
</div>