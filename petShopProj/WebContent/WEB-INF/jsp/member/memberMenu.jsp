<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.bigdiv {
	position: relative;
	z-index: 20;
	max-width: 1280px;
	height: auto;
	margin: 0 auto;
}

.middlediv {
	line-height: 14px;
	zoom: 1;
	padding: 16px 12px 94px;
}

.column {
	float: left;
	width: 20%;
}

.so_group {
	margin: 16px 8px 0;
	padding: 32px 29px 30px;
	text-align: left;
	border: 1px solid #dadada;
	border-radius: 2px;
	background: #fff;
}

.so_group2 {
	float: right;
	width: 78%;
	margin: 16px 8px 0;
	padding: 32px 29px 30px;
	text-align: left;
	border: 1px solid #dadada;
	border-radius: 2px;
	background: #fff;
}
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
	text-align:right;
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
</head>

<div class="bigdiv">
	<div class="middlediv">
		<div class="column">
			<div style="clear: both;">
				<c:if test="${id != 'admin' }">
					<div class="so_group">

						<p>${name }님</p>
						<br>
						<button type="button"
							onclick="location.href='memberimfomation.do?id=${id }'">회원정보</button>

					</div>
				</c:if>
				<c:if test="${id != 'admin' }">
					<div class="so_group">

						<button type="button" onclick="sconfirm('${id}')">회원탈퇴</button>

					</div>
				
				<div>
					
				</div>
				</c:if>
			</div>
		</div>
		<table style="border-bottom: 3px solid black; width: 80%">
		<caption>
			<button class="all-delbtn" onclick = "location.href='delCartAll.do?userId=${id}'">전체 삭제</button>	
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
							<div style="text-align:center;"><button type="button" class="delbtn" onclick="location.href='delCart.do?userId=${id }&itemCode=${vo.itemCode }'">삭제</button></div>
						</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.price * vo.itemQty }"></fmt:formatNumber></td>
							
						<td>
							<form id="frm" action="editCart.do" method="post">
								<input type="hidden" id="itemCode" name="itemCode" value="${vo.itemCode }">
								<input type="hidden" id= "userId" name= "userId" value="${id }">
								<input type="text" id="itemQty" name="itemQty" size=1 value="${vo.itemQty }"><br>
							<div style="margin-top: 5px"><button type="submit" id="editCart" class="qtybtn">수량수정</button></div>
							</form>
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
							<div style="text-align:center;"><button type="button" class="delbtn" onclick="location.href='delCart.do?userId=${id }&itemCode=${vo.itemCode }'">삭제</button></div>
						</td>
						<td><fmt:formatNumber type="currency"
								value="${vo.salePrice * vo.itemQty }"></fmt:formatNumber></td>
						<td>
							<form id="frm" action="editCart.do" method="post">
								<input type="hidden" id="itemCode" name="itemCode" value="${vo.itemCode }">
								<input type="hidden" id= "userId" name= "userId" value="${id }">
							<input type="text" id="itemQty" name="itemQty" size=1 value="${vo.itemQty }"><br>
							<div style="margin-top: 5px"><button  type="submit" id="editCart" class="qtybtn">수량수정</button></div>
							</form>
						</td>
						<c:set var="sum" value="${sum + vo.itemQty * vo.salePrice }" />
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	</table>
	<div class="price-total">
			<c:choose>
				<c:when test="${sum < 50000 }">
					주문 합계 : <font color="#0174DF"><fmt:formatNumber type="currency" value="${sum + 2500 }"></fmt:formatNumber></font>&nbsp;
					<button type="button" class="paybtn">결제하기</button>
				</c:when>
				<c:otherwise>
					주문 합계 : <font color="#0174DF"><fmt:formatNumber type="currency" value="${sum }"></fmt:formatNumber></font>&nbsp;
					<button type="button" class="paybtn">결제하기</button>
				</c:otherwise>
			</c:choose>
		</div>		
	</div>
</div>




<script>
	function sconfirm(id) {
		console.log(id);
		console.log("안녕하세요");
		msg = "정말로 회원 탈퇴하시겠습니까? 삭제하시면 되돌릴 수 없습니다.";
		if (confirm(msg) != 0) {
			location.href = "memberWithdrawal.do?id=" + id;
			// Yes click
		} else {
			return;
			/* window.history.back(); */
			// no click
		}
	} // myconfirm
</script>
