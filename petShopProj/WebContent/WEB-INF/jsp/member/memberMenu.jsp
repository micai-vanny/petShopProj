<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${id != 'admin' }">
	<button type="button"
		onclick="sconfirm('${id}')"> 회원탈퇴 </button>
</c:if>
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
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
<H1>구현안됌</H1>
