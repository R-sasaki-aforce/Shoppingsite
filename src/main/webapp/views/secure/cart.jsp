<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="jp.co.aforce.beans.User, jp.co.aforce.beans.Product, jp.co.aforce.dao.ProductDAO"%>
<%@ page import="java.util.List"%>

<%
User user = (User) session.getAttribute("loginUser");
ProductDAO dao = new ProductDAO();
List<Product> cartList = dao.getCartProducts(user.getMember_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/menu.css" />
<title>カート</title>
</head>
<body>

	<nav class="navbar">
		<ul class="menu-nav">
			<!-- 左側（ロゴなど） -->
			<li><a href="user-menu.jsp">Musicstore</a></li>
			<!-- 中央：検索欄 -->
			<li class="search-box">
				<form action="product-search" method="get">
					<input type="text" name="keyword" placeholder="商品を検索"> <input
						type="submit" value="検索">
				</form>
			</li>
			<!-- 右側のナビゲーションをラップ -->
			<div class="menu-right">

				<%
				if (user != null) {
				%>
				<li><a href="mypage.jsp"><%=user.getLast_name()%><%=user.getFirst_name()%>
						様</a></li>
				<%
				}
				%>

				<li><a href="cart.jsp">カート</a></li>
				<li><a href="#">お気に入り</a></li>
				<li><a href="#">お問い合わせ</a></li>
			</div>
		</ul>
	</nav>
	<%
	int total = 0; // 合計金額の初期化
	%>
	<p>カートに追加された商品</p>
	<%
	if (cartList.isEmpty()) {
	%>
	<p>カートは空です。</p>
	<%
	} else {
	for (Product p : cartList) {
		int subtotal = p.getPrice() * p.getQuantity(); // 小計計算
		total += subtotal; // 合計に加算
	%>
	<div>
		<img
			src="<%=request.getContextPath() + "/uploads/" + p.getImagePath()%>"
			width="100">
		<p>
			商品名:
			<%=p.getName()%></p>
		<p>
			価格: ¥<%=p.getPrice()%></p>

		<!-- 数量変更フォーム -->

		<form action="CartUpdate" method="post" class="quantity-form">
			<input type="hidden" name="product_id" value="<%=p.getProductId()%>">

			<div class="quantity-controls">
				<button type="button" class="quantity-decrease">−</button>
				<input type="text" name="quantity" value="<%=p.getQuantity()%>"
					class="quantity-input" readonly>
				<button type="button" class="quantity-increase">＋</button>
			</div>

			<input type="submit" name="action" value="数量変更">
		</form>

		<form action="CartUpdate" method="post" class="delete-form">
			<input type="hidden" name="product_id" value="<%=p.getProductId()%>">
			<input type="submit" name="action" value="削除">
		</form>
		<p>
			<strong>小計: ¥<%=subtotal%></strong>
		</p>
		<hr>
	</div>
	<%
	}
	}
	%>
	<!--合計金額の表示 -->
	<div class="cart-total">
		<h3>
			合計: ¥<%=total%></h3>
	</div>
	<form action="order-form.jsp" method="post">
	<input type="hidden" name="total_price" value="<%= total %>">
	<input type="submit" value="お会計に進む">
</form>
	<script src="../../js/cart.js"></script>
	
</body>
</html>