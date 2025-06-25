<meta http-equiv="Pragma" content="no-cache">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>会員情報修正画面</h1>
<%@page import="jp.co.aforce.beans.User" %>
<%User user=(User)session.getAttribute("loginUser"); %>
<%@page import="jp.co.aforce.beans.UserBean" %>
<%UserBean user2=(UserBean)session.getAttribute("editinfo"); %>
<%if(user2==null){ %>
<% if (user != null) {  %>

<!--修正フォーム-->

<form action="usereditconfirm" method="post">
        <br>名前（姓）: <input type="text" id="lastname" name="last_name"  value="<%=user.getLast_name() %>" required> 
		<br>名前（名）: <input type="text"id="firstname" name="first_name"  value="<%=user.getFirst_name() %>" required> 
		<br>　住所　　: <input type="text"id="mail_address" name="address"  value="<%=user.getAddress() %>" required> 
		<br>メールアドレス: <input type="email" id="email" name="mail_address"  value="<%=user.getMail_address() %>" required>
		<br><br><input type="submit" value="確認">
</form>

<%}else{
	
	response.sendRedirect("login-in.jsp");
	
	}%>
	<%}else{ %>
	<form action="usereditconfirm" method="post">
        <br>名前（姓）: <input type="text" id="lastname" name="last_name"  value="<%=user2.getLast_name2() %>" required> 
		<br>名前（名）: <input type="text"id="firstname" name="first_name"  value="<%=user2.getFirst_name2() %>" required> 
		<br>　住所　　: <input type="text"id="address" name="address"  value="<%=user2.getAddress2() %>" required> 
		<br>メールアドレス: <input type="email" id="email" name="mail_address"  value="<%=user2.getMail_address2() %>" required>
		<br><br><input type="submit" value="確認">
</form>
	<%} %>

<a href="mypage.jsp">会員メニューに戻る</a>
</body>
</html>