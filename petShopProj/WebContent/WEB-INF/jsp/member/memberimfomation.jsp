<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
<form action="">
<table border="1">
	<tr>
	<th>아이디  </th>
	<td>${vo.id }</td>
	</tr>
	<tr>
	<th>이름  </th>
	<td>${vo.name }</td>
	</tr>
	<tr>
	<th>주소  </th>
	<td>${vo.address }</td>
	</tr>
	<tr>
	<th>이메일  </th>
	<td>${vo.email }</td>
	</tr>
	<tr>
	<th>비밀번호  </th>
	<td>${vo.password }</td>
	</tr>
</table>

<input type="button" onclick="" value="수정">
<input type="button" onclick="" value="돌아가기">
</form>

</div>