<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認画面</title>
    <link rel="stylesheet" href="../css/confirm.css" />
</head>
<body>
    <h1 class="page-title">登録する内容はよろしいですか</h1>
    <%@ page import="jp.co.aforce.beans.User" %>
    <%
        User user = (User) session.getAttribute("confirminfo");
        if (user != null) {
    %>
    <div class="confirmation-container">
        <p>ユーザーID: <%= user.getMember_id() %></p>
        <hr>
        <p>パスワード: <%= user.getPassword() %></p>
        <hr>
        <p>名前（姓）: <%= user.getLast_name() %></p>
        <hr>
        <p>名前（名）: <%= user.getFirst_name() %></p>
        <hr>
        <p>住所: <%= user.getAddress() %></p>
        <hr>
        <p>メールアドレス: <%= user.getMail_address() %></p>

        <div class="button-area">
            <form action="userinfoadd" method="post">
                <input type="submit" value="登録">
            </form>
            <form action="registration.jsp" method="post">
                <input type="submit" value="戻る">
            </form>
        </div>
    </div>
    <% } %>
</body>
</html>
