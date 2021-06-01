<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<div class="tm-header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-3 tm-site-name-container">
				<a href="#" class="tm-site-name">상점</a>
			</div>
			<div class="col-md-8 col-sm-9">
				<div class="mobile-menu-icon">
					<i class="fa fa-bars"></i>
				</div>
				<nav class="tm-nav">
					<ul>
						<li><a href="index.do" class="active">HOME</a></li>
						<li><a href="dogProductList.do">DOG</a></li>
						<li><a href="catProductList.do">CAT</a></li>
						<li><a href="petTip.do">PET Tips</a></li>

						<c:choose>
							<c:when test="${!empty id }">
								<li><a href="memberLogOut.do">LOGOUT</a></li>
								<li><a href="memberMenu.do">My Menu</a></li>
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
