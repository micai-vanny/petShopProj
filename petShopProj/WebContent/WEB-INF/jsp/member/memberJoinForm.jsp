<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

 $(function(){
	$('#idCheck').click(function(){
		if($('#memberId').val()==""){
			alert('아이디를 입력하세요.');
			$('#memberId').focus();
			return ;
		}
		$.ajax({
			url: 'MemberIdCheck',
			data: {id: $('#memberId').val()},
			type: 'post',
			success: function(data){
				console.log(data);
				if(data >0){
					alert('아이디가 존재합니다. 다른 아이디를 입력하세요.');
					$('#memberId').val("");
					$('#memberId').focus();
				}else{
					alert('사용가능한 아이디입니다!');
					$('#idCheck').val('checked');
					$('#memberPwd').focus();
				}
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
}); 
	function formCheck() {
		if (frm.memberId.value == "") {
			alert("아이디를 입력하세요.")
			frm.memberId.focus();
			return false;
		}
		if (frm.idCheck.value == 'unChecked') {
			alert("중복체크를 하세요.");
			frm.memberId.focus();
			return false;
		}
		if (frm.password.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.password.focus();
			return false;	
		}
		if(frm.passwordCheck.value == 'unChecked'){
			alert("비밀번호 확인을 해주세요.");
			return false;
		}
		frm.submit();
	}
</script>

<title>회원가입폼</title>
<div>
	<form id="frm" action="memberJoin.do" method="post">
		<div>
			<table border="1">
				<tr>
					<th width="150">아이디</th>
					<td width="300"><input type="text" id="memberId"
						name="memberId">
						<button type="button" id="idCheck" value="unChecked">중복체크</button>
					</td>
				</tr>
				<tr>
					<th width="150">비밀번호</th>
					<td width="300"><input type="password" id="password"
						name="password"></td>
				</tr>
				<tr>
					<th width="150">비밀번호 확인</th>
					<td width="300"><input type="password" id="password2"
						name="password2">
						<button type="button" onclick="passwordCheck()">비밀번호 확인</button></td>
				</tr>
				<tr>
					<th width="150">이름</th>
					<td width="300"><input type="text" id="name" name="name">
					</td>
				</tr>
				<tr>
					<th width="150">E-Mail</th>
					<td width="300"><input type="text" id="email" name="email">
					</td>
				</tr>
				<tr>
					<th width="150">주소</th>
					<td width="300"><input type="text" id="adr" name="adr">
					</td>
				</tr>
			</table>
		</div>
		<div>
			<button type="button" onclick="formCheck()">회원가입</button>
			<button type="reset">리셋</button>
			<button type="button" onclick="location.href = 'index.do'">
				홈으로</button>
		</div>
	</form>
</div>