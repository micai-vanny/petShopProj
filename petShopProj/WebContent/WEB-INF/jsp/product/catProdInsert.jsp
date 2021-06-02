<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 게시판 오픈소스 : ckEditor4 -->
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('itemDesc', {
			filebrowserUploadUrl:'${pageContext.request.contextPath }/fileUpload',
			height: '600px',
			width: '900px'
		});
	})
	
	function formCheck() {
		if (frm.title.value == "") {
			alert("상품명을 입력하세요.");
			frm.title.focus();
			return false;	// submit을 하지 않도록
		}
		frm.submit();
	}
</script>
<body>
	<div align="center">
		<div>
			<h1>고양이 상품 등록</h1>
		</div>
		<div>				<!--   ┌>여기서 실행이 되는데 굉장히 재밌음 구선생님과 창호교수님 지식의 콜라보 -->
			<form id="frm" action="catProductInsert.do" method="post" enctype='multipart/form-data'>
				<div>													<!--    └>input type file 있으면 이거 써야 됨. 무족권 -->
					<table border="1" style="border-collapse: collapse;">
						<tr>
							<th width="150">구분코드</th><!-- radio 타입인 경우 체크된 value가 알아서 파라미터로 넘어감. -->
							<td width="500"><input type="radio" id="cat" name="divCode" value="C">고양이
											<input type="radio" id="dog" name="divCode" value="D">강아지
							</td>
						</tr>
						<tr>
							<th width="150">상품명</th>
							<td width="500"><input type="text" id="itemName" name="itemName">
							</td>
						</tr>
						<tr>
							<th width="150">상품코드</th>
							<td width="500"><input type="text" id="itemCode" name="itemCode">
							</td>
						</tr>
						<tr>
							<th width="150">상품 대표 이미지</th><!-- file 추가 업로드 하려고 만듦 -->
							<td width="500"><input type="file" id="itemImage" name="itemImage">
							</td>
						</tr>
						<tr>
							<th width="150">가격</th>
							<td width="500"><input type="text" id="price" name="price">
							</td>
						</tr>
						<tr>
							<th width="150">세일여부</th>
							<td width="500"><input type="radio" id="Y" name="sale" value="Y">Y
											<input type="radio" id="N" name="sale" value="N">N
							</td>
						</tr>
						<tr>
							<th width="150">재고수량</th>
							<td><input type="text" id="stock" name="stock">
							</td>
						</tr>
						<tr>
							<th width="150">상품설명</th>
							<td><textarea id="itemDesc" name="itemDesc"></textarea></td>
						</tr>
					</table>
				</div>
				<div>
					<button type="button" onclick="location.href='catProductList.do'">돌아가기</button>
					<button type="button" onclick="formCheck()">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>