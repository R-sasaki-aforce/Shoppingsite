<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Product product = (Product) session.getAttribute("AddproductConf");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = null;
    if (product != null && product.getReleaseDate() != null) {
        formattedDate = sdf.format(product.getReleaseDate());
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録確認</title>
<link rel="stylesheet" href="../../../css/adminproductadd-confirm.css">
</head>
<body>
<div class="confirm-container">
    <h2 class="page-title">商品登録内容の確認</h2>

    <div class="product-info">
        <p><strong>商品名：</strong><%= product != null ? product.getName() : "情報なし" %></p>
        <p><strong>アーティスト名：</strong><%= product != null ? product.getArtistName() : "情報なし" %></p>
        <p><strong>ジャンル：</strong><%= product != null ? product.getGenre() : "情報なし" %></p>
        <p><strong>価格：</strong>¥<%= product != null ? product.getPrice() : 0 %></p>
        <p><strong>在庫数：</strong><%= product != null ? product.getStock() : 0 %> 個</p>
        <p><strong>発売日：</strong><%= product != null ? formattedDate : "情報なし" %></p>
        <p><strong>商品説明：</strong><%= product != null ? product.getDescription() : "情報なし" %></p>
        <p><strong>視聴URL：</strong><%= product != null ? product.getSampleUrl() : "情報なし" %></p>
        <p><strong>画像ファイル名：</strong><%= product != null ? product.getImagePath() : "情報なし" %></p>
        <div class="image-preview">
            <img src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" alt="商品画像">
        </div>
    </div>

    <form action="productadd" method="post" class="form-actions">
        <input type="submit" value="登録完了" class="button confirm">
    </form>
    <a href="admin-ProductAdd.jsp" class="button back">戻る</a>
</div>
</body>
</html>
