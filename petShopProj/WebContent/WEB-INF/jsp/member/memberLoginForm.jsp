<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function LoginCheck() {
		if (frm.userid.value == "") {
			alert("아이디를 입력하세요");
			frm.userid.focus();
			return false;
		}
		if (frm.memberPwd.value == "") {
			alert("비밀번호를 입력하세요");
			frm.memberPwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
<style>
.login {
	display: block;
	width: 100%;
	height: 56px;
	line-height: 55px;
	margin: 12px 0 14px;
	border-radius: 0;
	border: solid 1px rgba(0, 0, 0, .1);
	box-shadow: 0 2px 6px 0 rgb(61 80 81/ 8%);
	background-color: black;
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	letter-spacing: -.5px;
	cursor: pointer;
	text-align: center;
	-webkit-appearance: none;
}
.input_box {
    display: block;
    overflow: hidden;
}

.loginForm {
	width: 540px;
	margin: 0 auto;
	margin-top: 25px;
}

.login_form {
	clear: both;

}
.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}
.id_area, .pw_area {
    position: relative;
    height: 70px;
}

input {
  width:200px;
  height:40px;
  font-size:20px;
}
.input_row {
        position: relative;
    margin-bottom: 8px;
    padding: 7px 35px 10px 11px;
    border: solid 1px #dadada;
    background: #fff;
    height: 70px;
}
.btn_global, .btn_login input, .btn_qronce_cancel {
    display: block;
    width: 100%;
    height: 56px;
    line-height: 55px;
    margin: 12px 0 14px;
    border-radius: 0;
    border: solid 1px rgba(0,0,0,.1);
    box-shadow: 0 2px 6px 0 rgb(61 80 81 / 8%);
    background-color: #03c75a;
    color: #fff;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.5px;
    cursor: pointer;
    text-align: center;
    -webkit-appearance: none;
}
</style>
<div class="loginForm">
<form id="frm" action="memberLogin.do" method="post">
	<fieldset class="login_form">
		<legend class="blind">로그인</legend>
		<div class="id_area">
			<div class="input_row" id="id_area">
				<span class="input_box"> <label for="id" id="label_id_area"
					class="lbl" style="display: block;"></label> <input style="border:0px;width:100%;" type="text"
					id="userid" name="userid" accesskey="L" placeholder="아이디" class="int"
					maxlength="41">
				</span>
				
			</div>
		</div>
		<div class="pw_area">
			<div class="input_row" id="pw_area">
				<span class="input_box"> <label for="pw" id="label_pw_area"
					class="lbl"></label> <input style="border:0px;width:100%;"type="password" id="memberPwd" name="memberPwd"
					placeholder="비밀번호" class="int" maxlength="16">
				</span>
			</div>
		</div>
	</fieldset>
	<div>
		<button type="button" class="login" onclick="LoginCheck()">로그인</button>
	</div>
</form>
</div>
