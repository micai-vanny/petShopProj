<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('itemDesc', {
			filebrowserUploadUrl:'${pageContext.request.contextPath }/fileUpload',
			height: '600px',
			width: '900px'
		});
	})
	
	function formCheck() {
		if (frm.title.value == "") {
			alert("상품명을 입력하세요.");
			frm.title.focus();
			return false;	// submit을 하지 않도록
		}
		frm.submit();
	}
</script>
<style>
	.wrap{
		margin: auto 0;
		
	}
	
	.top_btn{
		width: 100%;
		padding: 10px;
		margin-left:10%;
		text-align: left;
	}
	
	.prodContent{
		width: 100%;
		padding: 20px;
	}
	
	table{
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
	<form id="frm" action="" method="post" enctype='multipart/form-data'>
		<input type="hidden" id="itemCode" name="itemCode" value="${catProd.itemCode }">
		<div class="top_btn">
			<button type="button" onclick="location.href='catProductList.do'">돌아가기</button>
			<c:if test="${id eq 'admin' }">
				&nbsp;<button type="button" onclick="formCheck()">상품수정</button>&nbsp;
				<button type="button" onclick="location.href=''">상품삭제</button>
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
					<td style="width:80%; font-size:15pt; font-weight: bold" align="center">
						제품 상세 정보
					</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center">
								<img src ="upload/${catProd.itemImage }" alt="상품대표이미지" width="500px">
							</td>
						</c:when>
						<c:otherwise>
							<td align="center">
								<input type="file" id="itemImage" name="itemImage">&nbsp;
								현재 이미지 : ${catProd.itemImage }
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								${catProd.itemName }
							</td>
						</c:when>
						<c:otherwise>
							<td align="center" style="font-size: 18pt; font-weight: bold;">
								상품명 : <input type="text" id="itemName" name="itemName" value="${catProd.itemName }">
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
									<td align="right">
										<span class="text-muted text-decoration-line-through">
											<fmt:formatNumber type="currency" value="${catProd.price }"></fmt:formatNumber>
										</span>&nbsp;
						                <fmt:formatNumber type="currency"
											value="${catProd.salePrice }"></fmt:formatNumber>
									</td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td>
								세일가격 : <input type="text" id="salePrice" name="salePrice" value="${catProd.salePrice }">
							</td>
							<tr style="border-top: none;">
								<td>	
									정상가격 : <input type="text" id="price" name="price" value="${catProd.price }">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${id ne 'admin' }">
							<td align="center">
								${catProd.itemDesc }
							</td>
						</c:when>
						<c:otherwise>
							<td align="center">
								<textarea id="itemDesc" name="itemDesc">${catProd.itemDesc }</textarea>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td align="center">
						<c:forEach items="${list }" var="vo">
							${vo.userName }
							${vo.title }
							${vo.content }
							${vo.date }
							${vo.appraisal }
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
