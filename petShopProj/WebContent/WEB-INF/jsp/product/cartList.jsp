<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
tr {
	border-top: 1px solid black;
	text-align: center;
}

td {
	padding: 5px;
}

th {
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	text-align: center;
	padding: 10px;
}

caption{
	caption-side: top;
}

</style>
	<div align="center">
		<table style="border-bottom: 3px solid black; width:70%">
		<caption><h2>${id }님의 소중한 가족을 위한 아이템들이에요</h2></caption>
			<tr>
				<th width="10%">상품코드</th>
				<th width="20%">상품이미지</th>
				<th width="45%">상품명</th>
				<th width="10%">상품가격</th>
				<th width="15%">수량</th>
			</tr>
			<c:set var="sum" value="0" />
			<c:forEach items="${cartList }" var="vo">
				<c:choose>
					<c:when test="${vo.sale eq 'N' }">
						<tr>							
							<td>${vo.itemCode }</td>
							<td><img src="upload/${vo.itemImage }" width="100px" height="100px"></td>
							<td>${vo.itemName }</td>
							<td><fmt:formatNumber type="currency" value="${vo.price * vo.qty }"></fmt:formatNumber></td>
							<td>${vo.qty }</td>
							<c:set var="sum" value="${sum + vo.qty * vo.price }" />
						</tr>
					</c:when>
					<c:otherwise>
						<tr>							
							<td>${vo.itemCode }</td>
							<td><img src="upload/${vo.itemImage }"width="100px" height="100px"></td>
							<td>${vo.itemName }</td>
							<td><fmt:formatNumber type="currency" value="${vo.salePrice * vo.qty }"></fmt:formatNumber></td>
							<td>${vo.qty }</td>
							<c:set var="sum" value="${sum + vo.qty * vo.salePrice }" />
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<tr>
				<td colspan="4" style="text-align:right; font-size:15pt;">상품 합계 : <fmt:formatNumber type="currency" value="${sum }"></fmt:formatNumber></td>
				<td><button type="button">결제하기</button></td>
			</tr>
		</table>
</div>