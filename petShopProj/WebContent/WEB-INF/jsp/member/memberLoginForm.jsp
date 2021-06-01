<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script>
	function LoginCheck() {
		if(frm.userid.value=="") {
			alert("아이디를 입력하세요");
			frm.userid.focus();
			return false;
		}
		if(frm.memberPwd.value=="") {
			alert("비밀번호를 입력하세요");
			frm.memberPwd.focus();
			return false;
		}
		frm.submit();
	}
	</script>
	
<div align="center">
	<form id="frm" action="memberLogin.do" method="post">
		<div>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userid" id="userid"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memberPwd" id="memberPwd"></td>
				</tr>
			</table>
		</div>
		<div>
			<br>
			<button type="button" onclick="LoginCheck()">로그인</button>
			<button type="reset">초기화</button>
			<button type="button" onclick="location.href='index.do'">메인페이지로</button>
		</div>
	</form>
</div>
