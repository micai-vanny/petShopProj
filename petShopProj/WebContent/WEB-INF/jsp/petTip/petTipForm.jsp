<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'${pageContext.request.contextPath }/fileUpload',
			height: '600px',
			width: '900px'
		});
	})
	
	function formCheck() {
		if (frm.title.value == "") {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;	// submit을 하지 않도록
		}
		frm.submit();
	}
</script>
<body>
	<div align="center">
		<div>
			<h1>Pet Tips! 글쓰기</h1>
		</div>
		<div>
			<form id="frm" action="petTipInsert.do" method="post">
				<div>
					<table border="1" style="border-collapse: collapse;">
						<tr>
							<th width="150">제목</th>
							<td width="300"><input type="text" id="title" name="title">
							</td>
						</tr>
						<tr>
							<th width="150">내용</th>
							<td width="300"><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
				</div>
				<div>
					<button type="button" onclick="location.href='petTip.do'">돌아가기</button>
					<button type="button" onclick="formCheck()">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>