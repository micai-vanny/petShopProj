<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.wrap{
	background: white;
	border-radius: 0.5em;
	width: 80%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}

tr {
	border-top: 1px solid lightgray;
	text-align: center;
}

td {
	padding: 5px;
	border-left: 1px solid lightgray;
}

th {
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	text-align: center;
	padding: 10px;
}

caption {
	caption-side: top;
}

.order-cal {
	display: table;
	padding: 32px 0;
	width: 80%;
	text-align: center;
}

.product-sum {
	display: table-cell;
	width: 50%;
}

.price-total {
	display: table-cell;
	width: 50%;
	border-left: 1px solid gray;
	font-size: 19px;
	font-weight: bold;
}

.paybtn {
	border: 1px solid black;
	border-radius: 0.5em;
	background: white;
	color: black;
	font-size: 10pt;
	padding: 5px;
}

.cart-title{
	font-family: 나눔고딕, "Nanum Gothic", 맑은고딕, "Malgun Gothic", 돋움, dotum, helvetica, "Apple SD Gothic Neo", sans-serif;
	font-size: 30px;
	font-weight: bold;
	color: black;
	width: 80%;
	text-align: left;
	padding: 20px; 
}
</style>
<div class= "wrap" align="center">
	<div class="cart-title">
		${name }님의 소중한 가족을 위한 아이템들이에요.
	</div>
	<table style="border-bottom: 3px solid black; width: 80%">
		<tr>
			<th width="10%">상품코드</th>
			<th width="20%">상품이미지</th>
			<th width="40%">상품명</th>
			<th width="10%">상품가격</th>
			<th width="10%">수량</th>
		</tr>
		<c:set var="sum" value="0" />
		<c:forEach items="${cartList }" var="vo">
			<c:choose>
				<c:when test="${vo.sale eq 'N' }">
					<tr>
						<td style="border-left:none">${vo.itemCode }</td>
						<td><img src="upload/${vo.itemImage }" width="100px"
							height="100px"></td>
						<td>${vo.itemName }</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.price * vo.itemQty }"></fmt:formatNumber></td>
						<td>${vo.itemQty }</td>
						<c:set var="sum" value="${sum + vo.itemQty * vo.price }" />
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="border-left:none">${vo.itemCode }</td>
						<td><img src="upload/${vo.itemImage }" width="100px"
							height="100px"></td>
						<td>${vo.itemName }</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.salePrice * vo.itemQty }"></fmt:formatNumber></td>
						<td>${vo.itemQty }</td>
						<c:set var="sum" value="${sum + vo.itemQty * vo.salePrice }" />
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
	<div class="order-cal">
		<div class="product-sum">
			<c:choose>
				<c:when test="${sum < 50000 }">
					<span>배송비 : </span><fmt:formatNumber type="currency">2500</fmt:formatNumber> + 총 상품합계 : ${sum }
				</c:when>
				<c:otherwise>
					배송비 : 무료배송 + 총 상품합계 : ${sum }
				</c:otherwise>
			</c:choose>
		</div>
		<div class="price-total">	
			주문 합계 : <fmt:formatNumber type="currency" value="${sum + 2500 }"></fmt:formatNumber>&nbsp;
			<button type="button" class="paybtn">결제하기</button>
		</div>		
	</div>
</div>