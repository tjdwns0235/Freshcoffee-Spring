<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이메일 보내기</h2>
	<form action="${path}/email/send" method="POST" >
		발신자 이름 : <input name="senderName"><br>
		발신자 이메일 주소: <input name="senderMail" value="sungjoon9791@gmail.com"><br>
		수신자 이메일 주소: <input name="receiveMail">
		제목: <input name="subject"><br>
		내용: <textarea rows="5" cols="80" name="message"></textarea>
		<input type="submit" value="전송 ">
	</form>
	<span style="color: red">${message}</span>
</body>
</html>