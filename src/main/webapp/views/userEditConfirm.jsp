<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>登録する内容はよろしいですか?</h1>
	<%@page import="jp.co.aforce.beans.UserBean" %>
<%UserBean user=(UserBean)session.getAttribute("editinfo"); %>
<% if (user != null) {  %>
<p>名前（姓）: <%= user.getLast_name2() %></p>
<p>名前（名）: <%= user.getFirst_name2() %></p>
<p> 住所　: <%= user.getAddress2() %></p>
<p>メールアドレス: <%=user.getMail_address2() %></p>

<form action="usereditadd" method="post">
	<input type="hidden" name="last_name" value="<%= user.getLast_name2()%>">
	<input type="hidden" name="first_name" value="<%= user.getFirst_name2() %>">
	<input type="hidden" name="address" value="<%= user.getAddress2() %>">
	<input type="hidden" name="mail_address" value="<%= user.getMail_address2() %>">
	<input type="submit" value="登録">
</form>
<%} %>
<form action="retouching.jsp" method="post">
		<input type="submit" value="戻る">
	</form>
</body>
</html>