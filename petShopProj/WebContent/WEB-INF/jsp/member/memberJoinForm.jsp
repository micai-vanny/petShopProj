<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$(function() {
		$('#idCheck').click(function() {
			if ($('#memberId').val() == "") {
				alert('아이디를 입력하세요.');
				$('#memberId').focus();
				return;
			}
			$.ajax({
				url : 'MemberIdCheck',
				data : {
					id : $('#memberId').val()
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data > 0) {
						alert('아이디가 존재합니다. 다른 아이디를 입력하세요.');
						$('#memberId').val("");
						$('#memberId').focus();
					} else {
						alert('사용가능한 아이디입니다!');
						$('#idCheck').val('checked');
						$('#memberPwd').focus();
					}

				},
				error : function(err) {
					console.log(err);
				}
			});
		});
	});
	$(function() {
		$('#passwordCheck').click(function() {
			if ($('#password').val() == "" || $('#password2').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#password').focus();
				return;
			}
			console.log($('#password2').val());
			console.log($('#password').val());
			if ($('#password').val() != $('#password2').val()) {
				alert('입력한 비밀번호가 다릅니다. 다시 확인해주세요.');
				$('#password2').val("");
				$('#password2').focus();
			} else {
				alert('비밀번호가 일치합니다!');
				$('#passwordCheck').val('checked');
			}
		});

		// 속성 탐색 선택자
		// 입력이 변경되었을때 체크값을 unChecked로 변경

		$('#memberId').change(function() {
			$('#idCheck').val('unChecked');
		});

		//'input[type=password]' 를 입력한이유는
		// password 입력을 받는곳이 2개가 있기때문에 2개 중에 체인지가 발생하면 이벤트를 실행시키기 위해서이다.//

		$('input[type=password]').change(function() {
			$('#passwordCheck').val('unChecked');
		});
	});
	function formCheck() {
		if (frm.memberId.value == "") {
			alert("아이디를 입력하세요.");
			frm.memberId.focus();
			return false;
		}
		if (frm.password.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.password.focus();
			return false;
		}
		if (frm.password2.value == "") {
			alert("비밀번호를 재입력하세요.");
			frm.password.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름를 입력하세요.");
			frm.name.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일를 입력하세요.");
			frm.email.focus();
			return false;
		}
		if (frm.detailAddress.value == "") {
			alert("상세주소를 입력하세요.");
			frm.detailAddress.focus();
			return false;
		}
		if (frm.idCheck.value == 'unChecked') {
			alert("중복체크를 하세요.");
			frm.memberId.focus();
			return false;
		}

		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호 확인을 해주세요.");
			frm.password2.focus();
			return false;
		}
		frm.submit();
	}
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<style>
.wrap {
	background: white;
	border-radius: 0.5em;
	width: 80%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;	
}

.go-home {
	border: none;
	border-radius: 0.3em;
	background: #FFBF00;
	color: white;
	font-size: 10pt;
	padding: 5px;
}

.re-btn {
	border: none;
	border-radius: 0.3em;
	background: #FF8000;
	color: white;
	font-size: 10pt;
	padding: 5px;
}

.check-btn {
	border: none;
	border-radius: 0.3em;
	background: #FA5858;
	color: white;
	font-size: 10pt;
	padding: 5px;
}
</style>
<title>회원가입폼</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="wrap">
	<div align="center" style="padding-top: 20px">
		<H2>회원 가입</H2>
	</div>
	<div style="padding: 30px">
		<form id="frm" action="memberJoin.do" method="post">
			<div align="center" style="margin-top:30px">
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
							<button type="button" id="passwordCheck" value="unChecked">비밀번호
								확인</button></td>
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
						<td width="300">
							<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly> 
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly>
							<span id="guide" style="color: #999; display: none"></span> 
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"> 
							<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly>
						</td>
					</tr>
				</table>
			</div>
			
			<div align="center" style="padding-top: 20px">
				<button type="button" class= "check-btn" onclick="formCheck()">회원가입</button>
				<button type="reset" class="re-btn">리셋</button>
				<button type="button" class= "go-home" onclick="location.href = 'index.do'">
					홈으로</button>
			</div>
		</form>
	</div>
</div>