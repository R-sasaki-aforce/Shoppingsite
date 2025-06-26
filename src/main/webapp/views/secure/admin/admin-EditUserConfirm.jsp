<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<%@ page import="jp.co.aforce.beans.User" %>
<%
    UserBean user = (UserBean) session.getAttribute("editinfo"); 
    User user2 = (User) session.getAttribute("userinfo");
    String memberId = user2.getMember_id();
    int role = user2.getRole();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報確認</title>
    <link rel="stylesheet" href="../../../css/admin-edituserconf.css">
</head>
<body>
    <div class="admin-container">
        <h2 class="admin-title">登録内容の確認</h2>

        <% if (user != null) { %>
        <div class="info-box">
            <p><strong>会員ID：</strong><%= memberId %></p>
            <p><strong>役割：</strong><%= (role == 1 ? "管理者" : "一般ユーザ") %></p>
            <p><strong>名前（姓）：</strong><%= user.getLast_name2() %></p>
            <p><strong>名前（名）：</strong><%= user.getFirst_name2() %></p>
            <p><strong>住所：</strong><%= user.getAddress2() %></p>
            <p><strong>メールアドレス：</strong><%= user.getMail_address2() %></p>
        </div>

        <form action="usereditadd" method="post" class="form-buttons">
            <input type="hidden" name="last_name" value="<%= user.getLast_name2() %>">
            <input type="hidden" name="first_name" value="<%= user.getFirst_name2() %>">
            <input type="hidden" name="address" value="<%= user.getAddress2() %>">
            <input type="hidden" name="mail_address" value="<%= user.getMail_address2() %>">
            <input type="submit" value="登録する" class="admin-button">
        </form>

        <form action="admin-EditUser.jsp" method="post" class="form-buttons">
            <input type="submit" value="戻る" class="admin-button return-button">
        </form>
        <% } else { %>
            <p class="error-message">確認するユーザー情報が見つかりません。</p>
            <a href="admin-usersList.jsp" class="admin-button return-button">会員情報管理に戻る</a>
        <% } %>
    </div>
</body>
</html>
