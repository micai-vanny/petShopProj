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
	CKEDITOR.replace('itemDesc',
	{
		filebrowserUploadUrl : '${pageContext.request.contextPath }/fileUpload',
		height : '600px',
		width : '900px'
	});
})

function formCheck() {
	if (frm.title.value == "") {
		alert("상품명을 입력하세요.");
		frm.title.focus();
		return false; // submit을 하지 않도록
	}
	frm.submit();
}

function addCart(itemCode){
	//e.preventDefault();
	$.ajax({
		url:'${pageContext.request.contextPath }/addCart.do',
		data: {
			id: '${id }', itemCode: itemCode
		},
		success: function(result) {
			console.log(result);
			location.href= 'dogProductList.do';
		},
		error: function (reject) {
			console.log(reject);
		}
	});
}

<!--버튼 숨김/나타남 스크립트-->
$(function() {
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('#topBtn').fadeIn(); } 
		else { $('#topBtn').fadeOut(); }
	}); 
	$("#topBtn").click(function() { 
   	$('html, body').animate({ scrollTop : 0  }, 300); 
    return false; });
});

	function goPage(page) {
		location.href = "dogProductSelect.do?page=" + page
				+ "&itemCode=${catProd.itemCode}";
	}
</script>
<style>
.wrap {
	background: white;
	border-radius: 0.5em;
	width: 80%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;	
}

.top_line {
	width: 75%;
	padding-top: 30px;
	margin-left: 15%;
	text-align: left;
}

.prodContent {
	width: 100%;
	padding: 20px;
}

table {
	border-bottom: 3px solid black;
	width: 75%;
}

tr {
	padding: 20px;
	border-top: 1px solid lightgray;
}

td {
	padding: 15px;
}

.go-home {
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

.del-btn {
	border: none;
	border-radius: 0.3em;
	background: #FA5858;
	color: white;
	font-size: 10pt;
	padding: 5px;
}

.add-cart{
	border: none;
	border-radius: 0.3em;
	background: #FE2E2E;
	color: white;
	font-size: 10pt;
	padding: 5px;
}

#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
<!--탑 버튼(텍스트)&스크립트 html 부분-->
<!--탑 버튼(텍스트)-->
<a id="topBtn" href="#">▲Top</a> 

<div class="wrap">
	<form id="frm" action="prodUpdate.do" method="post"
		enctype='multipart/form-data'>
		<input type="hidden" id="itemCode" name="itemCode"
			value="${dogProd.itemCode }">
		<div class="top_line">
			<button type="button" class="go-home" onclick="location.href='dogProductList.do'">돌아가기</button>
			<c:if test="${id eq 'admin' }">
				&nbsp;<button type="button" class="edit-btn" onclick="formCheck()">상품수정</button>&nbsp;
				<button type="button" class="del-btn" onclick="location.href='prodDelete.do?itemCode=${dogProd.itemCode}'">상품삭제</button>
			</c:if>
		</div>
		<div class="prodContent">
			<div class="top_line">
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
							<td align="center"><img src="upload/${dogProd.itemImage }"
								alt="상품대표이미지" width="500px"></td>
						</c:when>
						<c:otherwise>
							<td align="center"><input type="file" id="itemImage"
								name="itemImage">&nbsp; 현재 이미지 : ${dogProd.itemImage }</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								${dogProd.itemName }</td>
						</c:when>
						<c:otherwise>
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								상품명 : <input type="text" id="itemName" name="itemName"
								value="${dogProd.itemName }">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr style="border-top: none;">
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<c:choose>
								<c:when test="${dogProd.sale eq 'N' }">
									<td align="right" style="font-size: 15pt; color: #015EBA; font-weight: bold;">
										<fmt:formatNumber type="currency" value="${dogProd.price }"></fmt:formatNumber>&nbsp;&nbsp;&nbsp;
										<c:if test="${!empty id }">
											<button type="button" class="add-cart" onclick="addCart('${dogProd.itemCode}')">Add to Cart</button>
										</c:if>
									</td>
								</c:when>
								<c:otherwise>
									<td align="right"><span
										class="text-muted text-decoration-line-through">
										<font size="5pt"><fmt:formatNumber
												type="currency" value="${dogProd.price }"></fmt:formatNumber></font></span>
										<font size="5pt" color="#015EBA"><b>&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="currency"
											value="${dogProd.salePrice }"></fmt:formatNumber></b></font>&nbsp;&nbsp;&nbsp;
											<c:if test="${!empty id }">
												<button type="button" class="add-cart" onclick="addCart('${dogProd.itemCode}')">Add to Cart</button>
											</c:if>
											</td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td>세일가격 : <input type="text" id="salePrice"
								name="salePrice" value="${dogProd.salePrice }">
							</td>
							<tr style="border-top: none;">
								<td>정상가격 : <input type="text" id="price" name="price"
									value="${dogProd.price }">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center">${dogProd.itemDesc }</td>
						</c:when>
						<c:otherwise>
							<td align="center"><textarea id="itemDesc" name="itemDesc">${dogProd.itemDesc }</textarea>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
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
							<hr>
						</c:forEach></td>
				</tr>
				<!-- 장바구니 등록한사람만 리뷰 등록가능하게 만들기 -->
				<tr>
				


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
	</form>
</div>