<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User" %>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<%
    User user = (User) session.getAttribute("userinfo");
    UserBean user2 = (UserBean) session.getAttribute("editinfo");

    String memberId = "";
    String lastName = "";
    String firstName = "";
    String address = "";
    String mailAddress = "";
    int role = 0;

    if (user2 != null) {
        memberId = user.getMember_id();
        lastName = user2.getLast_name2();
        firstName = user2.getFirst_name2();
        address = user2.getAddress2();
        mailAddress = user2.getMail_address2();
        role = user.getRole();
    } else if (user != null) {
        memberId = user.getMember_id();
        lastName = user.getLast_name();
        firstName = user.getFirst_name();
        address = user.getAddress();
        mailAddress = user.getMail_address();
        role = user.getRole();
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報編集</title>
  <link rel="stylesheet" href="../../../css/admin-edituser.css">
</head>
<body>
  <div class="admin-container">
    <h2 class="admin-title">会員情報編集画面</h2>

    <% if (memberId != null && !memberId.isEmpty()) { %>

    <div class="info-box">
      <p><strong>会員ID：</strong><%= memberId %></p>
      <p><strong>役割：</strong><%= (role == 1 ? "管理者" : "一般ユーザ") %></p>
    </div>

    <form action="usereditconfirm" method="post" class="admin-form">
      <input type="hidden" name="member_id" value="<%= memberId %>">
      <input type="hidden" name="role" value="<%= role %>">

      <label>名前（姓）：<input type="text" name="last_name" value="<%= lastName %>" required></label>
      <label>名前（名）：<input type="text" name="first_name" value="<%= firstName %>" required></label>
      <label>住所：<input type="text" name="address" value="<%= address %>" required></label>
      <label>メールアドレス：<input type="email" name="mail_address" value="<%= mailAddress %>" required></label>

      <div class="form-buttons">
        <input type="submit" value="確認" class="admin-button">
        <a href="admin-usersList.jsp" class="admin-button return-button">戻る</a>
      </div>
    </form>

    <% } else { %>
      <p class="error-message">ユーザー情報が見つかりません。</p>
      <a href="admin-usersList.jsp" class="admin-button return-button">戻る</a>
    <% } %>
  </div>
</body>
</html>
