<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product" %>
<%
    Product product = (Product) session.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品編集</title>
    <link rel="stylesheet" href="../../../css/admin-productedit.css">
</head>
<body>
    <div class="admin-container">
        <% if (product == null) { %>
            <h2 class="admin-title">商品情報が見つかりません。</h2>
            <a href="admin-product-list" class="admin-button return-button">一覧に戻る</a>
        <% } else { %>

            <h2 class="admin-title">商品編集</h2>

            <form action="update-product-confirm" method="post" enctype="multipart/form-data" class="admin-form">
                <input type="hidden" name="product_id" value="<%= product.getProductId() %>">

                <label>商品名</label>
                <input type="text" name="name" value="<%= product.getName() %>" required>

                <label>アーティスト名</label>
                <input type="text" name="artist_name" value="<%= product.getArtistName() %>" required>

                <label>ジャンル</label>
                <div class="radio-group">
                    <label><input type="radio" name="genre" value="J-POP" <%= "J-POP".equals(product.getGenre()) ? "checked" : "" %>> J-POP</label>
                    <label><input type="radio" name="genre" value="ロック" <%= "ロック".equals(product.getGenre()) ? "checked" : "" %>> ロック</label>
                    <label><input type="radio" name="genre" value="ジャズ" <%= "ジャズ".equals(product.getGenre()) ? "checked" : "" %>> ジャズ</label>
                    <label><input type="radio" name="genre" value="クラシック" <%= "クラシック".equals(product.getGenre()) ? "checked" : "" %>> クラシック</label>
                </div>

                <label>価格（円）</label>
                <input type="number" name="price" value="<%= product.getPrice() %>" required>

                <label>在庫数（個）</label>
                <input type="number" name="stock" value="<%= product.getStock() %>" required>

                <label>発売日</label>
                <input type="date" name="release_date" value="<%= product.getReleaseDate() %>">

                <label>視聴リンク</label>
                <input type="text" name="sample_url" value="<%= product.getSampleUrl() != null ? product.getSampleUrl() : "" %>">

                <label>現在の画像</label><br>
                <img src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" width="100"><br>
                <input type="hidden" name="current_image_path" value="<%= product.getImagePath() %>">

                <label>画像変更</label>
                <input type="file" name="image_path">

                <div class="form-buttons">
                    <input type="submit" value="確認" class="admin-button">
                    <a href="admin-product-list" class="admin-button return-button">一覧に戻る</a>
                </div>
            </form>

        <% } %>
    </div>
</body>
</html>
