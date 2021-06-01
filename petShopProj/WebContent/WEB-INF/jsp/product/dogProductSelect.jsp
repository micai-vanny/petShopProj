<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="width:80%">
	<table border="1">
		<tr>
			<td style="width:20%">
				<button onclick="location.href='dogProductList.do'">돌아가기</button>
			</td>
			<td style="width:80%" align="center">
				제품 상세 정보
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<img src ="upload/${dogProd.itemImage }" alt="상품대표이미지">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${dogProd.itemName }
			</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${dogProd.sale eq 'N' }">
					<td colspan="2" align="right">
						<fmt:formatNumber type="currency" value="${dogProd.price }"></fmt:formatNumber>
					</td>
				</c:when>
				<c:otherwise>
					<td colspan="2" align="right">
						<span class="text-muted text-decoration-line-through">
							<fmt:formatNumber type="currency" value="${dogProd.price }"></fmt:formatNumber>
						</span>&nbsp;
		                <fmt:formatNumber type="currency"
							value="${dogProd.salePrice }"></fmt:formatNumber>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${dogProd.itemDesc }
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				여기엔 리뷰가 들어갈 예정
			</td>
		</tr>
	</table>
</div>