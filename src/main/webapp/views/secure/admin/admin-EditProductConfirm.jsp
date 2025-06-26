<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product" %>
<%
	Product product = (Product) session.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品情報修正確認</title>
    <link rel="stylesheet" href="../../../css/admin-product-confirm.css">
</head>
<body>
    <div class="confirm-container">
        <h1>商品更新内容の確認</h1>

        <p>商品名: <%= product.getName() %></p>
        <p>アーティスト名: <%= product.getArtistName() %></p>
        <p>ジャンル: <%= product.getGenre() %></p>
        <p>価格: <%= product.getPrice() %> 円</p>
        <p>在庫数: <%= product.getStock() %> 個</p>
        <p>発売日: <%= product.getReleaseDate() %></p>
        <p>視聴リンク: <%= product.getSampleUrl() %></p>
        <p>画像ファイル名: <%= product.getImagePath() %></p>
        <img src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" width="100" alt="商品画像">

        <form action="update-product-final" method="post">
            <input type="submit" value="登録">
        </form>

        <a href="admin-ProductEdit.jsp" class="button-link">戻る</a>
    </div>
</body>
</html>
