<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	function goPage(page) {
		location.href = "dogProductSelect.do?page=" + page
				+ "&itemCode=${catProd.itemCode}";
	}
</script>
>
<div align="center" style="width: 80%">
	<table border="1">
		<tr>
			<td style="width: 20%">
				<button type="button" onclick="location.href='dogProductList.do'">돌아가기</button>
			</td>
			<td style="width: 80%" align="center">제품 상세 정보</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><img
				src="upload/${dogProd.itemImage }" alt="상품대표이미지"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">${dogProd.itemName }</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${dogProd.sale eq 'N' }">
					<td colspan="2" align="right"><fmt:formatNumber
							type="currency" value="${dogProd.price }"></fmt:formatNumber></td>
				</c:when>
				<c:otherwise>
					<td colspan="2" align="right"><span
						class="text-muted text-decoration-line-through"> <fmt:formatNumber
								type="currency" value="${dogProd.price }"></fmt:formatNumber>
					</span>&nbsp; <fmt:formatNumber type="currency"
							value="${dogProd.salePrice }"></fmt:formatNumber></td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2" align="center">${dogProd.itemDesc }</td>
		</tr>
		<tr>
				<td colspan="2" align="center"><c:forEach items="${list }" var="vo">
							<div>
								<div
									class="d-flex justify-content-center small text-warning mb-2"
									style="margin-right: 100px; float: left">
									<!-- 좋아요 갯수만큼 별찍어줌 -->
									<c:forEach begin="1" end="${vo.appraisal }">
										<div class="bi-star-fill"></div>
									</c:forEach>

								</div>
							</div>
							<div>${vo.date }</div>
							<br>


							<div style="float: none">${vo.userName }</div>
							<br>
							<div>
								<h3>${vo.title }</h3>
								<br>
							</div>
							<div>
								<p>${vo.content }</p>
								<br>
							</div>
							<hr>
						</c:forEach></td>
				</tr>
	</table>

	<div style="text-align: center">
		<jsp:include page="../common/paging.jsp" flush="true">
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="pageNo" value="${paging.pageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</div>
</div>