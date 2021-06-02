<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				
				<div class="so_group2">
					<p>상품장바구니sadsadfㅣㅏㄴㅇ러ㅟㅏ런ㅁㅇ리ㅏㅓㄴ어리ㅏ넘ㅇ리ㅏㄴ머리;ㅁ넝리;ㅇ너린ㅁㅇ러ㅣㄴ리나얼ㅇ니ㅏ런미아ㅓㄴㅁ리;ㅏ엄ㄴ;ㅣㅏ너ㅣㅏ널;ㅣㄹ너니;ㅏ런;ㅣㅏㅓㅣ;ㅏㅓㅁ니;너ㅣㅏㅓ미;니ㅏㅓ

						ㅣㅏ;ㅓ리나ㅓsdfasdfㄹ</p>
				</div>
				</c:if>
			</div>
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
