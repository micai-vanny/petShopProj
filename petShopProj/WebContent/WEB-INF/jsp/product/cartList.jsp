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
	font-size: 15px;
	font-weight: bold;
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

.qtybtn {
	border: none;
	border-radius: 0.3em;
	background: #FFBF00;
	color: white;
	font-size: 8pt;
	padding: 3px;
}

.delbtn {
	border: none;
	border-radius: 0.3em;
	background: #FE2E64;
	color: white;
	font-size: 9pt;
	padding: 5px;
}

.all-delbtn {
	border: none;
	border-radius: 0.5em;
	background: #BDBDBD;
	color: white;
	font-size: 9pt;
	padding: 5px;
}

.cart-title{
	font-family: 나눔고딕, "Nanum Gothic", 맑은고딕, "Malgun Gothic", 돋움, dotum, helvetica, "Apple SD Gothic Neo", sans-serif;
	font-size: 30px;
	font-weight: bold;
	color: black;
	width: 80%;
	text-align: left;
	padding-top: 30px; 
	padding-bottom: 25px;
	line-height: 90%
}

.shippin-info{
	font-size: 10pt;
	color: lightgray;
	
}

caption {
	text-align: right;
}

</style>
<div class= "wrap" align="center">
	<div class="cart-title">
		"${name }"님의 소중한 가족을 위한 아이템들이에요.<br>
		<font color="#A4A4A4" size="3pt">&nbsp;* 50000원 이상 주문 시 무료배송!</font>
	</div>
	<table style="border-bottom: 3px solid black; width: 80%">
		<caption>
			<button class="all-delbtn">전체 삭제</button>	
		</caption>
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
						<td style="line-height: 70%">${vo.itemName }
							<center><hr style="width: 70%; border: 0.1px solid lightgray; margin: 10px"></center>
							<div style="text-align:center;"><button class="delbtn" onclick="delProdCart.do?itemCode=${vo.itemCode}&userId=${id }">삭제</button></div>
						</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.price * vo.itemQty }"></fmt:formatNumber></td>
						<td><input type="text" id="itemQty" name="itemQty" size=1 value="${vo.itemQty }"><br>
							<div style="margin-top: 5px"><button class="qtybtn">수량수정</button></div>
						</td>
						<c:set var="sum" value="${sum + vo.itemQty * vo.price }" />
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="border-left:none">${vo.itemCode }</td>
						<td><img src="upload/${vo.itemImage }" width="100px"
							height="100px"></td>
						<td style="line-height: 70%">
							${vo.itemName }<br>
							<center><hr style="width: 70%; border: 0.1px solid lightgray; margin: 10px"></center>
							<div style="text-align:center;"><button class="delbtn">삭제</button></div>
						</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.salePrice * vo.itemQty }"></fmt:formatNumber></td>
						<td><input type="text" id="itemQty" name="itemQty" size=1 value="${vo.itemQty }"><br>
							<div style="margin-top: 5px"><button type="button" class="qtybtn" onclick="">수량수정</button></div></td>
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
					배송비 : <font color="#DF0101"><fmt:formatNumber type="currency">2500</fmt:formatNumber></font> + 총 상품합계 : <fmt:formatNumber type="currency">${sum }</fmt:formatNumber><br>
				</c:when>
				<c:otherwise>
					배송비 : <font color="#DF0101">무료배송</font> + 총 상품합계 : <fmt:formatNumber type="currency">${sum }</fmt:formatNumber>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="price-total">	
			주문 합계 : <font color="#0174DF"><fmt:formatNumber type="currency" value="${sum + 2500 }"></fmt:formatNumber></font>&nbsp;
			<button type="button" class="paybtn">결제하기</button>
		</div>		
	</div>
</div>