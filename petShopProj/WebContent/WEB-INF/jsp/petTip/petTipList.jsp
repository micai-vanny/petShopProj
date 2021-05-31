<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function formSubmit(id) {
		frm.id.value = id;
		frm.submit();
	}
</script>
</head>
<body>
	<form id="frm" action="petTipSelect.do" method="post">
		<input type="hidden" id="id" name="id">
	</form>
	<div align = "center">
		<h3>Pet Tips!</h3>
		<div style="width:80%">
		<table class="table" border="1">
			<tr>
				<th width="20">no.</th>
				<th width="200">제목</th>
				<th width="30">작성일자</th>
				<th width="20">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${!empty list }">
					<c:forEach items="${list }" var="vo">
						<tr onclick="formSubmit(${vo.id })">
							<td>${vo.id }</td>
							<td>${vo.title }</td>
							<td>${vo.regDate }</td>
							<td>${vo.hit }</td>
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
		<div>
			<button type="button" onclick="location.href='main.do'">홈으로</button>
			<c:if test="${id eq 'admin' }">
				<button type="button" onclick="location.href='petTipInsert.do'">글쓰기</button>
			</c:if>
		</div>
	</div>
</body>