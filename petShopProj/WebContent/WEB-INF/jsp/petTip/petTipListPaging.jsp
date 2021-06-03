<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function formSubmit(id) {
		frm.id.value = id;
		frm.submit();
	}
	
	function goPage(page) {
		location.href = "petTipListPaging.do?page=" + page;
	}
</script>

<form id="frm" action="petTipSelect.do" method="post">
	<input type="hidden" id="id" name="id">
</form>
<div align="center">
	<div style="padding: 20px">
		<h2>Pet Tips!</h2>
	</div>
	<div style="width: 100%">
		<table style="width:70% ;border-bottom: 3px solid black">
			<tr style="border-top: 3px solid black">
				<th style="width: 30px; text-align: center; padding-top: 10px; padding-bottom: 10px">no.</th>
				<th style="text-align: center">제목</th>
				<th style="width: 120px; text-align: center">작성일자</th>
				<th style="width: 100px; text-align: center">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${!empty list }">
					<c:forEach items="${list }" var="vo">
						<tr style="border-top: 1px solid black" onclick="formSubmit(${vo.id })">
							<td style="text-align: center; padding-top: 7px; padding-bottom: 7px">${vo.id }</td>
							<td style="text-align: center">${vo.title }</td>
							<td style="text-align: center">${vo.regDate }</td>
							<td style="text-align: center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr style="border-top: 1px solid black">
						<td colspan="4" align="center">아직 게시글이 등록되지않았습니다. 게시글을
							등록해주세요.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div style="width: 70%; text-align: right; padding: 20px">
		<button type="button" onclick="location.href='index.do'">홈으로</button>
		<c:if test="${id eq 'admin' }">
			<button type="button" onclick="location.href='petTipForm.do'">글쓰기</button>
		</c:if>
	</div>
<p />
<!-- 페이징 호출 -->
<jsp:include page="../common/paging.jsp" flush="true">
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>
<!-- 페이징 호출 종료 -->
</div>