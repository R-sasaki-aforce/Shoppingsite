<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/registration.css" />
<html>
<head>
<meta charset="UTF-8">
<title>会員情報登録ページ</title>
</head>
<body>
<div class="page-title">新規会員登録</div>

<div class="registration-container">
    <% User user = (User)session.getAttribute("confirminfo");
       if (user == null) {
           user = new User("", "", "", "", "", "");
       }
    %>

    <form action="useraddconfirm" method="post">
        ユーザーID:
        <input type="text" name="member_id" pattern="[A-Za-z0-9]{1,255}"
               value="<%= user.getMember_id() %>" required>

        パスワード:
        <input type="text" name="password" pattern="[A-Za-z0-9]{1,}"
               value="<%= user.getPassword() %>" required>

        名前（姓）:
        <input type="text" name="last_name" value="<%= user.getLast_name() %>" required>

        名前（名）:
        <input type="text" name="first_name" value="<%= user.getFirst_name() %>" required>

        住所:
        <input type="text" name="address" value="<%= user.getAddress() %>" required>

        メールアドレス:
        <input type="email" name="mail_address" value="<%= user.getMail_address() %>" required>

        <input type="submit" value="確認">
        <input type="reset" value="リセット">
    </form>

    <a href="login-in.jsp">ログイン画面に戻る</a>
</div>
</body>
</html>