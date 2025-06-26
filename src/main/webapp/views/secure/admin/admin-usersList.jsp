<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報管理</title>
<link rel="stylesheet" href="../../../css/admin-users.css">
</head>
<body>

<div class="admin-container">
  <h1 class="admin-title">会員情報管理</h1>
  <a class="back-link" href="admin-menu.jsp">← 管理者メニューに戻る</a>

  <%
  session.removeAttribute("editinfo");
  List<User> users = (List<User>) session.getAttribute("users");
  %>

  <table class="admin-table">
    <thead>
      <tr>
        <th>会員ID</th>
        <th>役割</th>
        <th>名前</th>
        <th>住所</th>
        <th>メールアドレス</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <%
      if (users != null && !users.isEmpty()) {
        for (User user : users) {
      %>
      <tr>
        <td><%= user.getMember_id() %></td>
        <td><%= user.getRole() == 1 ? "管理者" : "一般ユーザ" %></td>
        <td><%= user.getLast_name() + " " + user.getFirst_name() %></td>
        <td><%= user.getAddress() %></td>
        <td><%= user.getMail_address() %></td>
        <td class="actions-cell">
          <form action="admin-EditUser" method="post" style="display:inline;">
            <input type="hidden" name="member_id" value="<%= user.getMember_id() %>">
            <input type="hidden" name="last_name" value="<%= user.getLast_name() %>">
            <input type="hidden" name="first_name" value="<%= user.getFirst_name() %>">
            <input type="hidden" name="address" value="<%= user.getAddress() %>">
            <input type="hidden" name="mail_address" value="<%= user.getMail_address() %>">
            <input type="hidden" name="role" value="<%= user.getRole() %>">
            <input class="action-button" type="submit" value="編集">
          </form>
          <form action="admin-user-delete" method="post" style="display:inline;">
            <input type="hidden" name="member_id" value="<%= user.getMember_id() %>">
            <input class="delete-button" type="submit" value="削除" onclick="return confirm('本当に削除してもよろしいですか？');">
          </form>
        </td>
      </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="6" class="no-data">ユーザー情報がありません。</td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

</body>
</html>
