<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR
				.replace(
						'itemDesc',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath }/fileUpload',
							height : '600px',
							width : '900px'
						});
	})
	// 게시글 삭제 확인

	function boardDelete(boardid) {
		msg = "정말로 리뷰를 삭제하시겠습니까? 삭제하시면 되돌릴 수 없습니다.";
		if (confirm(msg) != 0) {
			location.href = "boardDelete.do?boardid=" + boardid;
			// Yes click
		} else {
			return;
			/* window.history.back(); */
			// no click
		}
	} // myconfirm

	function formCheck() {
		if (frm.title.value == "") {
			alert("상품명을 입력하세요.");
			frm.title.focus();
			return false; // submit을 하지 않도록
		}
		frm.submit();
	}
	function goPage(page) {
		location.href = "catProductSelect.do?page=" + page
				+ "&itemCode=${catProd.itemCode}";
	}
	$(function() {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'${pageContext.request.contextPath }/fileUpload',
			height: '300px',
			width: '100%'
		});

	})
</script>
<style>
.wrap {
	margin: auto 0;
}

.top_btn {
	width: 100%;
	padding: 10px;
	margin-left: 10%;
	text-align: left;
}

.prodContent {
	width: 100%;
	padding: 20px;
}

table {
	border-bottom: 3px solid black;
	width: 80%;
}

tr {
	padding: 20px;
	border-top: 1px solid black;
}

td {
	padding: 15px;
}
</style>
<div class="wrap">
	<form id="frm" action="prodUpdate.do" method="post"
		enctype='multipart/form-data'>
		<div>
		<input type="hidden" id="itemCode" name="itemCode"
			value="${catProd.itemCode }">
		<div class="top_btn">
			<button type="button" onclick="location.href='catProductList.do'">돌아가기</button>
			<c:if test="${id eq 'admin' }">
				&nbsp;<button type="button" onclick="formCheck()">상품수정</button>&nbsp;
				<button type="button"
					onclick="location.href='prodDelete.do?itemCode=${catProd.itemCode}'">상품삭제</button>
			</c:if>
		</div>
		<div class="prodContent">
			<div class="top_btn">
				<c:if test="${id eq 'admin' }">
					<input type="radio" id="Y" name="sale" value="Y">세일함
					<input type="radio" id="N" name="sale" value="N">세일안함
				</c:if>
			</div>
			<table align="center">
				<tr style="border-top: 3px solid black">
					<td style="width: 80%; font-size: 15pt; font-weight: bold"
						align="center">제품 상세 정보</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center"><img src="upload/${catProd.itemImage }"
								alt="상품대표이미지" width="500px"></td>
						</c:when>
						<c:otherwise>
							<td align="center"><input type="file" id="itemImage"
								name="itemImage">&nbsp; 현재 이미지 : ${catProd.itemImage }</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								${catProd.itemName }</td>
						</c:when>
						<c:otherwise>
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								상품명 : <input type="text" id="itemName" name="itemName"
								value="${catProd.itemName }">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr style="border-top: none;">
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<c:choose>
								<c:when test="${catProd.sale eq 'N' }">
									<td align="right" style="font-size: 13pt; color: #015EBA">
										<fmt:formatNumber type="currency" value="${catProd.price }"></fmt:formatNumber>
									</td>
								</c:when>
								<c:otherwise>
									<td align="right"><span
										class="text-muted text-decoration-line-through"> <fmt:formatNumber
												type="currency" value="${catProd.price }"></fmt:formatNumber>
									</span>&nbsp; <fmt:formatNumber type="currency"
											value="${catProd.salePrice }"></fmt:formatNumber></td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td>세일가격 : <input type="text" id="salePrice"
								name="salePrice" value="${catProd.salePrice }">
							</td>
							<tr style="border-top: none;">
								<td>정상가격 : <input type="text" id="price" name="price"
									value="${catProd.price }">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center">${catProd.itemDesc }</td>
						</c:when>
						<c:otherwise>
							<td align="center"><textarea id="itemDesc" name="itemDesc">${catProd.itemDesc }</textarea>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				</table>
				</div>
				</div>
				</form>
				
				<table>
				<tr>
					<td><c:forEach items="${list }" var="vo">
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
							<div>
							<c:if test="${vo.userId eq id }">
							<input type="button" id="id" name="id" value="삭제" onclick="boardDelete('${vo.boardid}')">
							</c:if>
							</div>
							<hr>
						</c:forEach></td>
				</tr>
				<!-- 장바구니 등록한사람만 리뷰 등록가능하게 만들기 -->
			
			
				<tr>

					<td><c:if test="${cart.userId != null }">
							<div style="height: 100%">
							<form id="ffm" action ="boardInsert.do" method="post">
								제목 : <input type="text" id="title" name="title">
								이름 : <input type="text" id="username" name="username" value="${name }" readonly>
								<textarea id ="content" name="content" rows="90" cols="20"></textarea>
								<input type="hidden" id="id" name="id" value="${id }">
								<input type="hidden" id="itemcode" name="itemcode" value="${cart.itemCode }">
								<input type="radio" id="appraisal" name="appraisal" value="5">5점주기
								<input type="radio" id="appraisal" name="appraisal" value="4">4점주기
								<input type="radio" id="appraisal" name="appraisal" value="3">3점주기
								<input type="radio" id="appraisal" name="appraisal" value="2">2점주기
								<input type="radio" id="appraisal" name="appraisal" value="1" checked>1점주기
								<button type="submit"> 글등록 </button>
							</form>
								
							</div>
						</c:if></td>
				</tr>
			
			</table>
			<!-- 페이징 호출 -->
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
			<!-- 페이징 호출 종료 -->

		</div>

</div>
