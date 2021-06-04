<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.wrap {
	background: white;
	border-radius: 0.5em;
	width: 80%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>

<script>
	function formSubmit(id) {
		frm.id.value = id;
		frm.submit();
	}
</script>
</head>
<body>
	<div class="wrap" align = "center">
	<form id="frm" action="petTipSelect.do" method="post">
		<input type="hidden" id="id" name="id">
	</form>
		<div style="padding: 20px">
			<h2>Pet Tips!</h2>
		</div>
		<div style="width:80%">
		<table class="table" border="1">
			<tr>
				<th style="width: 30px; text-align: center">no.</th>
				<th style="text-align: center">제목</th>
				<th style="width: 120px; text-align: center">작성일자</th>
				<th style="width: 100px; text-align: center">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${!empty list }">
					<c:forEach items="${list }" var="vo">
						<tr onclick="formSubmit(${vo.id })">
							<td style="text-align: center">${vo.id }</td>
							<td style="text-align: center">${vo.title }</td>
							<td style="text-align: center">${vo.regDate }</td>
							<td style="text-align: center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" align="center">
							아직 게시글이 등록되지않았습니다. 게시글을 등록해주세요.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		</div>
		<div style="width: 80%; text-align: right; padding: 20px">
			<button type="button" onclick="location.href='index.do'">홈으로</button>
			<c:if test="${id eq 'admin' }">
				<button type="button" onclick="location.href='petTipForm.do'">글쓰기</button>
			</c:if>
		</div>
	</div>
</body>