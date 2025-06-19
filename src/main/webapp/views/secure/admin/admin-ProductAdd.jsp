<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="jp.co.aforce.beans.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録画面</title>
</head>
<body>

<h1>新規商品登録</h1>
 <form action="product-register" method="post" enctype="multipart/form-data">
        <label for="name">商品名:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="artist_name">アーティスト名:</label><br>
        <input type="text" id="artist_name" name="artist_name" required><br><br>

       <label>ジャンル:</label><br>
       <input type="radio" name="genre" value="J-POP" >J-POP
       <input type="radio" name="genre" value="ロック" >ロック
       <input type="radio" name="genre" value="ジャズ" >ジャズ
       <input type="radio" name="genre" value="クラシック" >クラシック
       <br><br>

        <label for="price">価格:</label><br>
        <input type="number" id="price" name="price" required><br><br>

        <label for="stock">在庫数:</label><br>
        <input type="number" id="stock" name="stock" required><br><br>

        <label for="release_date">発売日:</label><br>
        <input type="date" id="release_date" name="release_date"><br><br>

        <label for="description">商品説明:</label><br>
        <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>

        <label for="sample_url">視聴URL:</label><br>
        <input type="url" id="sample_url" name="sample_url"><br><br>

        <label for="image_path">画像を選択:</label><br>
        <input type="file" id="image_path" name="image_path"><br><br>

        <input type="submit" value="確認">
    </form>
    <a href="admin-ProductsList.jsp">戻る</a>
</body>
</html>