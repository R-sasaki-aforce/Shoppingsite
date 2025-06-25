<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.User"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.beans.Product"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/menu.css" />
<link rel="stylesheet" type="text/css" href="../../css/slick.css"/>
<link rel="stylesheet" type="text/css" href="../../css/slick-theme.css"/>
<title>メニュー画面</title>
</head>
<body>

	<nav class="navbar">
		<ul class="menu-nav">
			<!-- 左側（ロゴなど） -->
			<li><a href="user-menu.jsp">Musicstore</a></li>
			<!-- 中央：検索欄 -->
			<li class="search-box">
				<form action="product-search" method="get">
					<input type="text" name="keyword" placeholder="商品を検索">
					<input type="submit" value="検索">
				</form>
			</li>
			<!-- 右側のナビゲーションをラップ -->
			<div class="menu-right">
				<%
				User user = (User) session.getAttribute("loginUser");
				%>
				<%
				if (user != null) {
				%>
				<li><a href="mypage.jsp"><%=user.getLast_name()%><%=user.getFirst_name()%> 様</a></li>
				<%
				}
				%>

				<li><a href="cart.jsp">カート</a></li>
				<li><a href="contact.jsp">お問い合わせ</a></li>
			</div>
		</ul>
	</nav>
	<ul class="mainvisual">
		<li><img src="../../img/2025-04-09 173944.png" alt="メインビジュアル"></li>
		<li><img src="../../img/1500x500.jfif" alt="メインビジュアル"></li>
		<li><img src="../../img/creamy.jfif" alt="メインビジュアル"></li>
		<li><img src="../../img/1500x500 (1).jfif" alt="メインビジュアル"></li>
		<li><img src="../../img/1500x500 (2).jfif" alt="メインビジュアル"></li>
	</ul>
	
	
<div class="sort-buttons" style="text-align:right; margin: 10px;">
<button class="sort-button"id="sort-price-desc">価格が高い順</button>
  <button class="sort-button"id="sort-price-asc">価格が安い順</button>
</div>
	<div class="items">
		<%
		List<Product> productList = (List<Product>) session.getAttribute("productList");
		if (productList != null && !productList.isEmpty()) {
			for (Product product : productList) {
		%>

		<div class="item"data-price="<%=product.getPrice()%>">
		 <div class="image-wrapper">
		<% if (product.getStock() <= 0) { %>
	
	<img class="soldout-overlay"src="../../img/ソールドアウト.jpg" alt="ソールドアウト"title="ソールドアウト">
	
<% } %>
			<img class="product-image" src="<%=request.getContextPath() +"/img/" + product.getImagePath()%>" alt="<%=product.getName()%>"
				title="<%=product.getName()%>">
				</div>
			<div class="product-details">
    <p class="product-genre"><%=product.getGenre()%></p> <!-- ジャンル -->
   <p class="product-name"><%=product.getName()%></p>
<p class="artist-name"><%=product.getArtistName()%></p>
<p>
  <span class="product-price-label">通常価格</span>
  <span class="product-price">¥<%=product.getPrice()%></span>
</p>
<div class="product-actions">
    <select name="quantity" class="quantity">
        <%
        int maxQuantity = 10;
        for (int i = 0; i <= maxQuantity; i++) {
        %>
        <option value="<%=i%>"><%=i%></option>
        <%
        }
        %>
    </select>

    <button class="cartButton" data-id="<%=product.getProductId()%>"
        data-name="<%=product.getName()%>"
        data-price="<%=product.getPrice()%>"
        data-picture="<%=product.getImagePath()%>"
        data-stock="<%=product.getStock()%>"
        >カートに追加</button>
</div>
</div>
		</div>
		<%
			}
		} else {
		%>
		<p>現在、商品が登録されていません。</p>
		<%
		}
		%>
	</div>





<%@ page import="com.google.gson.Gson" %>
<script>
  const contextPath = '<%= request.getContextPath() %>';
  window.productData = <%= new Gson().toJson(productList != null ? productList : new java.util.ArrayList()) %>;
</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript" src="../../js/slick.min.js"></script>
	
	<script src="../../js/menu.js"></script>
	
	<!-- モーダルの背景 -->
<div id="productModal" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 id="modal-name"></h2>
    <p><strong>アーティスト:</strong> <span id="modal-artist"></span></p>
    <p><strong>ジャンル:</strong> <span id="modal-genre"></span></p>
    <p><strong>価格:</strong> <span id="modal-price"></span></p>
    <p><strong>発売日:</strong> <span id="modal-release-date"></span></p>
    <p><strong></strong> <span id="modal-description"></span></p>
    <iframe id="modal-video"
  width="100%" height="315"
  style="margin-top: 10px;"
  src="" 
  title="動画プレイヤー"
  frameborder="0"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
    
    <img id="modal-image" style="width:100%; max-height:300px; object-fit:contain; margin-top:10px;" />
  </div>
</div>
</body>
</html>
