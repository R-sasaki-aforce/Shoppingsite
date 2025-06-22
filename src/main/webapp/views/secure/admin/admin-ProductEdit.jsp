<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<%
	Product product2 = (Product) session.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品編集</title>
</head>
<body>
<% if (product == null) { %>
    <h2>商品情報が見つかりません。</h2>
    <a href="admin-product-list">一覧に戻る</a>
<% } else { %>

    <h1>商品編集</h1>

    <form action="update-product-confirm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="product_id" value="<%= product.getProductId() %>">

        商品名: <input type="text" name="name" value="<%= product.getName() %>"><br>
        アーティスト名: <input type="text" name="artist_name" value="<%= product.getArtistName() %>"><br>

        <label>ジャンル:</label><br>
        <input type="radio" name="genre" value="J-POP" <%= "J-POP".equals(product.getGenre()) ? "checked" : "" %>>J-POP
        <input type="radio" name="genre" value="ロック" <%= "ロック".equals(product.getGenre()) ? "checked" : "" %>>ロック
        <input type="radio" name="genre" value="ジャズ" <%= "ジャズ".equals(product.getGenre()) ? "checked" : "" %>>ジャズ
        <input type="radio" name="genre" value="クラシック" <%= "クラシック".equals(product.getGenre()) ? "checked" : "" %>>クラシック
        <br><br>

        価格: <input type="number" name="price" value="<%= product.getPrice() %>"> 円<br>
        在庫数: <input type="number" name="stock" value="<%= product.getStock() %>"> 個<br>
        発売日: <input type="date" name="release_date" value="<%= product.getReleaseDate() %>"><br>

        現在の画像: <img src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" width="100"><br>
        画像変更: <input type="file" name="image_path"><br>

        <input type="submit" value="確認">
    </form>

    <br>
    <a href="admin-product-list">一覧に戻る</a>
<% }%>

</body>
</html>
