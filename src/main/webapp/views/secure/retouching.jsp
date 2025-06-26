<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User" %>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<%@ page import="java.io.*" %>
<%
    User user = (User) session.getAttribute("loginUser");
    UserBean user2 = (UserBean) session.getAttribute("editinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報修正</title>
<link rel="stylesheet" href="../../css/registration.css">
</head>
<body>

<h1 class="page-title">会員情報修正画面</h1>

<% if (user2 == null) { %>
    <% if (user != null) { %>
    <div class="registration-container">
        <form action="usereditconfirm" method="post">
            <label for="lastname">名前（姓）:</label>
            <input type="text" id="lastname" name="last_name" value="<%= user.getLast_name() %>" required>

            <label for="firstname">名前（名）:</label>
            <input type="text" id="firstname" name="first_name" value="<%= user.getFirst_name() %>" required>

            <label for="address">住所:</label>
            <input type="text" id="address" name="address" value="<%= user.getAddress() %>" required>

            <label for="email">メールアドレス:</label>
            <input type="email" id="email" name="mail_address" value="<%= user.getMail_address() %>" required>

            <input type="submit" value="確認">
        </form>
    </div>
    <% } else {
        response.sendRedirect("login-in.jsp");
    } %>
<% } else { %>
    <div class="registration-container">
        <form action="usereditconfirm" method="post">
            <label for="lastname">名前（姓）:</label>
            <input type="text" id="lastname" name="last_name" value="<%= user2.getLast_name2() %>" required>

            <label for="firstname">名前（名）:</label>
            <input type="text" id="firstname" name="first_name" value="<%= user2.getFirst_name2() %>" required>

            <label for="address">住所:</label>
            <input type="text" id="address" name="address" value="<%= user2.getAddress2() %>" required>

            <label for="email">メールアドレス:</label>
            <input type="email" id="email" name="mail_address" value="<%= user2.getMail_address2() %>" required>

            <input type="submit" value="確認">
        </form>
    
<% } %>

<a href="mypage.jsp">会員メニューに戻る</a>
</div>
</body>
</html>
