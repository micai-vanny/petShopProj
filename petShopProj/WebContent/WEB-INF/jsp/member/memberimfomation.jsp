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
	<td><input type="text" id ="email" name = "email" value="${vo.address }" ></td>
	</tr>
	<tr>
	<th>이메일  </th>
	<td><input type="text" id="email" name="email" value="${vo.email }"></td>
	</tr>
	<tr>
	<th>비밀번호 변경 </th>
	<td><button type="button" onclick="location.href=''">변경하러가기</button></td>
	</tr>
</table>

<input type="submit" onclick="location.href=''" value="수정">
<input type="button" onclick="location.href='index.do'" value="돌아가기">
</form>

</div>