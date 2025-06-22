<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jp.co.aforce.beans.UserBean" %>
    <%@ page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>登録する内容はよろしいですか?</h1>
<%UserBean user=(UserBean)session.getAttribute("editinfo"); 
  User user2 = (User) session.getAttribute("userinfo");
  String memberId = user2.getMember_id();
  int role = user2.getRole();
%>
<% if (user != null) {  %>
        会員ID: <%= memberId %><br>
        役割: <%= (role == 1 ? "管理者" : "一般ユーザ") %><br>
<p>名前（姓）: <%= user.getLast_name2() %></p>
 <br><p>名前（名）: <%= user.getFirst_name2() %></p>
 <br><p> 住所　: <%= user.getAddress2() %></p>
 <br><p>メールアドレス: <%=user.getMail_address2() %></p>

<form action="usereditadd" method="post">
	<input type="hidden" name="last_name" value="<%= user.getLast_name2()%>">
	<input type="hidden" name="first_name" value="<%= user.getFirst_name2() %>">
	<input type="hidden" name="address" value="<%= user.getAddress2() %>">
	<input type="hidden" name="mail_address" value="<%= user.getMail_address2() %>">
	<input type="submit" value="登録">
</form>
<%} %>
<form action="admin-EditUser.jsp" method="post">
		<input type="submit" value="戻る">
	</form>
</body>
</html>