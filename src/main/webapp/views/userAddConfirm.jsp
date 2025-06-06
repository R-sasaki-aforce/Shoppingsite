<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>登録する内容はよろしいですか</h1>
<%@page import="jp.co.aforce.beans.User" %>
<%User user=(User)session.getAttribute("confirminfo"); %>
<% if (user != null) {  %>
<form action="userinfoadd" method="post">
ユーザーID: <%=user.getMember_id() %>
		<br>パスワード: <%=user.getPassword() %>
		<br>名前（姓）: <%=user.getLast_name() %>
		<br>名前（名）: <%=user.getFirst_name() %>
		<br>　住所　　: <%=user.getAddress() %>
		<br>メールアドレス: <%=user.getMail_address() %>
		<br><br><input type="submit" value="登録">
		</form>
		
	<%} %>
	<form action="registration.jsp" method="post">
		<input type="submit" value="戻る">
		</form>
</body>
</html>