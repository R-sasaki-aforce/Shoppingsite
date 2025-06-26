<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新規商品登録</title>
    <link rel="stylesheet" href="../../../css/admin-product-add.css">
</head>
<body>
    <div class="form-container">
        <h1 class="form-title">新規商品登録</h1>
        <form action="product-register" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">商品名:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="artist_name">アーティスト名:</label>
                <input type="text" id="artist_name" name="artist_name" required>
            </div>

            <div class="form-group">
                <label>ジャンル:</label>
                <div class="genre-options">
                    <label><input type="radio" name="genre" value="J-POP"> J-POP</label>
                    <label><input type="radio" name="genre" value="ロック"> ロック</label>
                    <label><input type="radio" name="genre" value="ジャズ"> ジャズ</label>
                    <label><input type="radio" name="genre" value="クラシック"> クラシック</label>
                </div>
            </div>

            <div class="form-group">
                <label for="price">価格:</label>
                <input type="number" id="price" name="price" required>
            </div>

            <div class="form-group">
                <label for="stock">在庫数:</label>
                <input type="number" id="stock" name="stock" required>
            </div>

            <div class="form-group">
                <label for="release_date">発売日:</label>
                <input type="date" id="release_date" name="release_date">
            </div>

            <div class="form-group">
                <label for="description">商品説明:</label>
                <textarea id="description" name="description" rows="4" cols="50"></textarea>
            </div>

            <div class="form-group">
                <label for="sample_url">視聴URL:</label>
                <input type="url" id="sample_url" name="sample_url">
            </div>

            <div class="form-group">
                <label for="image_path">画像を選択:</label>
                <input type="file" id="image_path" name="image_path">
            </div>

            <div class="form-buttons">
                <input type="submit" value="確認">
                <a href="admin-ProductsList.jsp" class="back-button">戻る</a>
            </div>
        </form>
    </div>
</body>
</html>
