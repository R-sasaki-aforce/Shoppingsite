<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.Product"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録確認</title>
</head>
<body>
	<h1>商品登録確認</h1>
	<%
	// セッションからProductオブジェクトを取得
	Product product = (Product) session.getAttribute("AddproductConf");
	
	  // 日付フォーマットの作成
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = null;
    if (product != null && product.getReleaseDate() != null) {
        formattedDate = sdf.format(product.getReleaseDate());  // Date型をフォーマット
    }
	%>
	
	 <p>商品名: <%= product != null ? product.getName() : "情報なし" %></p>
    <p>アーティスト名: <%= product != null ? product.getArtistName() : "情報なし" %></p>
    <p>ジャンル: <%= product != null ? product.getGenre() : "情報なし" %></p>
    <p>価格: <%= product != null ? product.getPrice() : 0 %> 円</p>
    <p>在庫数: <%= product != null ? product.getStock() : 0 %></p>
    <p>発売日: <%= product != null ? formattedDate : "情報なし" %></p>
    <p>商品説明: <%= product != null ? product.getDescription() : "情報なし" %></p>
    <p>視聴URL: <%= product != null ? product.getSampleUrl() : "情報なし" %></p>
    <p>画像パス: <%= product != null ? product.getImagePath() : "情報なし" %></p>
     <p>画像:</p>
    <img src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" alt="商品画像" />
	<form action="productadd" method="post">
        <input type="submit" value="登録完了">
    </form>
    <a href="admin-ProductAdd.jsp">戻る</a>
</body>
</html>