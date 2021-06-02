<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header ==-->
<div class="tm-header">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-3 tm-site-name-container">
				<a href="index.do" class="tm-site-name">TOMCAT Market</a>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="mobile-menu-icon">
					<i class="fa fa-bars"></i>
				</div>
				<nav class="tm-nav">
					<ul>
						<li><a href="index.do" class="active">HOME</a></li>
						<li><a href="dogProductList.do">DOG</a></li>
						<li><a href="catProductList.do">CAT</a></li>
						<li><a href="petTipListPaging.do">PET Tips</a></li>
						<c:choose>
							<c:when test="${!empty id }">
								<li><a href="memberLogOut.do">LOGOUT</a></li>
								<li><a href="memberMenu.do">My Menu</a></li>
								<form action="cartList.do" class="d-flex">
									<!-- id로 장바구니 조회=> cartList.jsp -->
									<input type="hidden" name="uid" value="${id }">
									<div style="vertical-align: bottom">
										<a href=""><button class="btn btn-outline-light"
												type="submit">
												<i class="bi-cart-fill me-1"></i> ${id }님의 Cart <span
													class="badge bg-dark text-white ms-1 rounded-pill">${cartCnt }</span>
												</button></a>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<li><a href="memberJoinForm.do">JOIN</a></li>
								<li><a href="memberLoginForm.do">LOGIN</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
