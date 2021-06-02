<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="width:80%">
	<table border="1">
		<tr>
			<td style="width:20%">
				<button type="button" onclick="location.href='catProductList.do'">돌아가기</button>
			</td>
			<td style="width:80%" align="center">
				제품 상세 정보
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<img src ="upload/${catProd.itemImage }" alt="상품대표이미지">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${catProd.itemName }
			</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${catProd.sale eq 'N' }">
					<td colspan="2" align="right">
						<fmt:formatNumber type="currency" value="${catProd.price }"></fmt:formatNumber>
					</td>
				</c:when>
				<c:otherwise>
					<td colspan="2" align="right">
						<span class="text-muted text-decoration-line-through">
							<fmt:formatNumber type="currency" value="${catProd.price }"></fmt:formatNumber>
						</span>&nbsp;
		                <fmt:formatNumber type="currency"
							value="${catProd.salePrice }"></fmt:formatNumber>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${catProd.itemDesc }
			</td>
		</tr>
		<tr>
		<c:choose>
		</c:choose>
			<td colspan="2" align="center">
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
