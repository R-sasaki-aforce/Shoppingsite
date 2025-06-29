<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jp.co.aforce.beans.Product" %>
<%
	Product product = (Product) session.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品情報修正確認画面</title>
</head>
<body>
<h1>商品更新内容の確認</h1>

	<p>商品名: <%= product.getName() %></p>
	<p>アーティスト名: <%= product.getArtistName() %></p>
	<p>ジャンル: <%= product.getGenre() %></p>
	<p>価格: <%= product.getPrice() %> 円</p>
	<p>在庫数: <%= product.getStock() %> 個</p>
	<p>発売日: <%= product.getReleaseDate() %></p>
	<p>画像ファイル名: <%= product.getImagePath() %></p>

	<form action="update-product-final" method="post">
		<input type="submit" value="登録">
	</form>
	<br>
	<a href="admin-ProductEdit.jsp">戻る</a>
</body>
</html>