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
				<li><a href="#">お気に入り</a></li>
				<li><a href="#">お問い合わせ</a></li>
			</div>
		</ul>
	</nav>

	<div class="items">
		<%
		List<Product> productList = (List<Product>) session.getAttribute("productList");
		if (productList != null && !productList.isEmpty()) {
			for (Product product : productList) {
		%>

		<div class="item">
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
<script>
	const contextPath = '<%= request.getContextPath() %>';
</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../js/menu.js"></script>
</body>
</html>
