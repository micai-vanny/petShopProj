<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function formSubmit(itemCode) {
		frm.itemCode.value = itemCode;
		frm.submit();
	}
</script>
<form id="frm" action="dogProductSelect.do" method="post">
	<input type="hidden" id="itemCode" name="itemCode">
</form>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 첫번째 데이터 -->
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">굉장히 Hot한 템</h5>
							<!-- Product price-->
							$40.00 - $80.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 반복 시작 -->
			<c:forEach items="${list }" var="vo">
				<!-- 두번째 데이터 -->
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<!-- sale 컬럼에 Y면 세일 뱃지 띄우셈 -->
						<c:if test="${vo.sale eq 'Y' }">
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem">Sale</div>
						</c:if>
						<!-- Product image-->
						<img class="card-img-top" src="upload/${vo.itemImage }" 
							alt="상품이미지" onclick="formSubmit('${vo.itemCode}')" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${vo.itemName }</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<!-- 좋아요 갯수만큼 별찍어줌 -->
									<c:forEach begin="1" end="${vo.likeIt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<!-- Product price-->
								<!-- sale 컬럼에 값이 Y면 가격 할인한 거 보여주셈 -->
								<c:choose>
									<c:when test="${vo.sale eq 'Y' }">
										<span class="text-muted text-decoration-line-through">
											<fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber>
										</span>&nbsp;
	                                    <fmt:formatNumber type="currency"
											value="${vo.salePrice }"></fmt:formatNumber>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									id="addCart" onclick="addCart('${vo.itemCode }')">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container px-4 px-lg-5 mt-5">
		<c:if test="${id eq 'admin' }">
			<button type="button" onclick="location.href='dogProdForm.do'">상품업로드</button>
		</c:if>
	</div>
</section>
<script>
	function addCart(itemCode){
		//e.preventDefault();
		$.ajax({
			url:'${pageContext.request.contextPath }/addCart.do',
			data: {
				id: '${id }', itemCode: itemCode
			},
			success: function(result) {
				console.log(result);
				location.href= 'productList.do';
			},
			error: function (reject) {
				console.log(reject);
			}
		});
	};
</script>