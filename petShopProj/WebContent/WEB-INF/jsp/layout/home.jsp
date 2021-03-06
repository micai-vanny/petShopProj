<%@page import="com.pet.petTip.vo.PetTipVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pet.petTip.serviceImpl.PetTipServiceImpl"%>
<%@page import="com.pet.petTip.service.PetTipService"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.tbl {
	border-bottom: 3px solid #D3D3D2;
	width: 90%
}

tr {
	border-top: 1px solid lightgray;
	text-align: center;
	padding: 8px;
}

td {
	padding: 5px;
}

th {
	border-top: 3px solid #D3D3D2;
	border-bottom: 3px solid #D3D3D2;
	text-align: center;
	padding: 10px;
}
</style>
<script>
	function formSubmit(id) {
		frm.id.value = id;
		frm.submit();
	}
</script>
<!-- gray bg -->
<section class="container tm-home-section-1" id="more">
	<div class="section-margin-top">
		<div class="row">
			<div class="tm-section-header">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<hr>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<h2 class="tm-section-title">Best Product</h2>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<hr>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
				<div class="tm-home-box-2">
					<img style="width: 254px; height: 254px" src="upload/호랑이_두부모래_오리지날.PNG"
						alt="image" class="img-responsive">
					<h3>호랑이 두부모래 오리지널</h3>
					<p class="tm-date">자연친화적인 두부모래!</p>
					<div class="tm-home-box-2-container">
						<a href="#" class="tm-home-box-2-link"><i
							class="fa fa-heart tm-home-box-2-icon border-right"></i></a> <a
							href="#" class="tm-home-box-2-link"><span
							class="tm-home-box-2-description">Add to Cart</span></a> <a href="#"
							class="tm-home-box-2-link"><i
							class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
				<div class="tm-home-box-2">
					<img style="width: 254px; height: 254px" src="upload/마이베프_별자리스틱_주황.PNG"
						alt="image" class="img-responsive">
					<h3>마이베프 별자리 스틱 주황</h3>
					<p class="tm-date">종합 비타민이 가득한 영양간식!</p>
					<div class="tm-home-box-2-container">
						<a href="#" class="tm-home-box-2-link"><i
							class="fa fa-heart tm-home-box-2-icon border-right"></i></a> <a
							href="#" class="tm-home-box-2-link"><span
							class="tm-home-box-2-description">Add to Cart</span></a> <a href="#"
							class="tm-home-box-2-link"><i
							class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
				<div class="tm-home-box-2">
					<img style="width: 254px; height: 254px" src="upload/아스쿠_모정_사슴고기져키.PNG"
						alt="image" class="img-responsive">
					<h3>아스쿠 모정 사슴고기 져키</h3>
					<p class="tm-date">식감과 맛 모두를 만족하는 져키!</p>
					<div class="tm-home-box-2-container">
						<a href="#" class="tm-home-box-2-link"><i
							class="fa fa-heart tm-home-box-2-icon border-right"></i></a> <a
							href="#" class="tm-home-box-2-link"><span
							class="tm-home-box-2-description">Add to Cart</span></a> <a href="#"
							class="tm-home-box-2-link"><i
							class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
				<div class="tm-home-box-2 tm-home-box-2-right">
					<img style="width: 254px; height: 254px" src="upload/헬로도기_닭갈비.PNG"
						alt="image" class="img-responsive">
					<h3>헬로 도기 닭갈비맛 져키</h3>
					<p class="tm-date">모두가 좋아하는 닭갈비맛 져키!</p>
					<div class="tm-home-box-2-container">
						<a href="#" class="tm-home-box-2-link"><i
							class="fa fa-heart tm-home-box-2-icon border-right"></i></a> <a
							href="#" class="tm-home-box-2-link"><span
							class="tm-home-box-2-description">Add to Cart</span></a> <a href="#"
							class="tm-home-box-2-link"><i
							class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<p style="text-align: center; font-size: 15pt; margin-top: 40px;">Tomcat
					Market's Best Sellers</p>
			</div>
		</div>
	</div>
</section>

<!-- white bg -->
<section class="tm-white-bg section-padding-bottom">
	<div class="container">
		<div class="row">
			<div class="tm-section-header section-margin-top">
				<div class="col-lg-4 col-md-3 col-sm-3">
					<hr>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<h2 class="tm-section-title">Pet Tips!</h2>
				</div>
				<div class="col-lg-4 col-md-3 col-sm-3">
					<hr>
				</div>
			</div>
			<%
			PetTipService service = new PetTipServiceImpl();
			List<PetTipVO> list = service.petTipSelectList();

			request.setAttribute("list", list);
			%>
			<form id="frm" action="petTipSelect.do" method="post">
				<input type="hidden" id="id" name="id">
			</form>
			<div align="center">
				<div style="width: 100%">
					<div style="width: 90%; text-align: right; padding-bottom: 10px;">
						<a href="petTipListPaging.do">more Tips></a>
					</div>
					<table class="tbl">
						<tr>
							<th style="width: 30px; text-align: center">no.</th>
							<th style="text-align: center"><font size="3pt">제목</font></th>
							<th style="width: 120px; text-align: center">작성일자</th>
							<th style="width: 100px; text-align: center">조회수</th>
						</tr>
						<c:choose>
							<c:when test="${!empty list }">
								<c:choose>
									<c:when test="${fn:length(list) > 4 }">
										<c:forEach items="${list }" var="vo" end="4">
											<tr onclick="formSubmit(${vo.id })">
												<td style="text-align: center">${vo.id }</td>
												<td style="text-align: center">${vo.title }</td>
												<td style="text-align: center">${vo.regDate }</td>
												<td style="text-align: center">${vo.hit }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="vo">
											<tr onclick="formSubmit(${vo.id })">
												<td style="text-align: center">${vo.id }</td>
												<td style="text-align: center">${vo.title }</td>
												<td style="text-align: center">${vo.regDate }</td>
												<td style="text-align: center">${vo.hit }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" align="center">아직 게시글이 등록되지않았습니다. 게시글을
										등록해주세요.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>