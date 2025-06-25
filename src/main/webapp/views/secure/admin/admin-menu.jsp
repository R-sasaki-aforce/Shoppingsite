<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者メニュー画面</title>
</head>
<body>
	<%@ page import="jp.co.aforce.beans.User"%>
	<h1>管理者メニュー画面</h1>


	
	<a href="admin-product-list">商品管理</a>
	<a href="admin-users-list">会員情報管理</a>
	<a href="admin-order-history">注文履歴</a>
	<a href="admin-contacts-lists">お問い合わせ閲覧</a>

	<form action="logout" method="post">
		<input type="submit" value="ログアウト">
	</form>
</body>
</html>