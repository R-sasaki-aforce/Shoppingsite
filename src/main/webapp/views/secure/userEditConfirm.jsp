<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<%
    UserBean user = (UserBean) session.getAttribute("editinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報確認</title>
<link rel="stylesheet" href="../../css/confirm.css">
</head>
<body>

<h1 class="page-title">登録する内容はよろしいですか？</h1>

<% if (user != null) { %>
<div class="confirmation-container">
    <p>名前（姓）：<%= user.getLast_name2() %></p>
    <hr>
    <p>名前（名）：<%= user.getFirst_name2() %></p>
    <hr>
    <p>住所：<%= user.getAddress2() %></p>
    <hr>
    <p>メールアドレス：<%= user.getMail_address2() %></p>

    <div class="button-area">
        <form action="usereditadd" method="post">
            <input type="hidden" name="last_name" value="<%= user.getLast_name2() %>">
            <input type="hidden" name="first_name" value="<%= user.getFirst_name2() %>">
            <input type="hidden" name="address" value="<%= user.getAddress2() %>">
            <input type="hidden" name="mail_address" value="<%= user.getMail_address2() %>">
            <input type="submit" value="登録">
        </form>

        <form action="retouching.jsp" method="post">
            <input type="submit" value="戻る">
        </form>
    </div>
</div>
<% } %>

</body>
</html>
