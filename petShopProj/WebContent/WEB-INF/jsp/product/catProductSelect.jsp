<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="width:80%">
	<table border="1">
		<tr>
			<td style="width:20%">
				<button>돌아가기</button>
			</td>
			<td style="width:80%">
				제품 상세 정보
			</td>
		</tr>
		<tr>
			<td colspan="2">
				${vo.itemImage }
			</td>
		</tr>
		<tr>
			<td colspan="2">
				${vo.itemName }
			</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${vo.sale eq 'N' }">
					<td colspan="2">
						<fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber>
					</td>
				</c:when>
				<c:otherwise>
					<td colspan="2">
						<span class="text-muted text-decoration-line-through">
							<fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber>
						</span>&nbsp;
		                <fmt:formatNumber type="currency"
							value="${vo.salePrice }"></fmt:formatNumber>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2">
				${vo.itemDesc }
			</td>
		</tr>
		<tr>
			<td colspan="2">
				여기엔 리뷰가 들어갈 예정
			</td>
		</tr>
	</table>
</div>