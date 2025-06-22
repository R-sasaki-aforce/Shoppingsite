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
			<img src="<%=request.getContextPath() +"/img/" + product.getImagePath()%>" alt="<%=product.getName()%>"
				title="<%=product.getName()%>">
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
        for (int i = 1; i <= maxQuantity; i++) {
        %>
        <option value="<%=i%>"><%=i%></option>
        <%
        }
        %>
    </select>

    <button class="cartButton" data-id="<%=product.getProductId()%>"
        data-name="<%=product.getName()%>"
        data-price="<%=product.getPrice()%>"
        data-picture="<%=product.getImagePath()%>">カートに追加</button>
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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function () {
		// カートに追加ボタンがクリックされた時の処理
		$('.cartButton').click(function () {
			const button = $(this);

			const productId = button.data('id');
			const quantity = button.closest('.product-details').find('.quantity').val();

			// 数量が0の場合はアラート
			if (!quantity || quantity == 0) {
				alert("数量を選択してください。");
				return;
			}

			$.ajax({
				url: '<%= request.getContextPath() %>/AddToCart',  // 相対パスでサーブレット指定
				type: 'POST',
				data: {
					product_id: productId,
					quantity: quantity
				},
				success: function (responseText) {
					alert(responseText);  // サーブレットからのメッセージを表示
				},
				error: function (xhr, status, error) {
					if (xhr.status === 401) {
						alert("ログインしてください。");
						location.href = "<%= request.getContextPath() %>/views/login-in.jsp";
					} else if (xhr.status !== 200) {
						alert("商品追加に失敗しました: " + error);
					}
				}
			});
		});
	});
	</script>

</body>
</html>
