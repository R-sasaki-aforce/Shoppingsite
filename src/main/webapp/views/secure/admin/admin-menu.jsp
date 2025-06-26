<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者メニュー</title>
<link rel="stylesheet" href="../../../css/admin.css">
</head>
<body>
  <div class="admin-container">
    <h1 class="page-title">管理者メニュー</h1>

    <div class="admin-links">
      <a href="admin-product-list" class="admin-button">商品管理</a>
      <a href="admin-users-list" class="admin-button">会員情報管理</a>
      <a href="admin-order-history" class="admin-button">注文履歴</a>
      <a href="admin-contacts-lists" class="admin-button">お問い合わせ閲覧</a>
    </div>

    <form action="logout" method="post">
      <input type="submit" value="ログアウト" class="logout-button">
    </form>
  </div>
</body>
</html>
