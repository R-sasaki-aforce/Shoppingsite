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

			<!-- 右側のナビゲーションをラップ -->
			<div class="menu-right">
				<%
				User user = (User) session.getAttribute("loginUser");
				%>
				<%
				if (user != null) {
				%>
				<li><a href="mypage.jsp"><%=user.getLast_name()%><%=user.getFirst_name()%>
						様</a></li>
				<%
				}
				%>

				<li><a href="#">カート</a></li>
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
			<img src="<%=product.getImagePath()%>"
				alt="<%=product.getName()%>" title="<%=product.getName()%>">
			<div class="product name">
				<p><%=product.getName()%>
					￥<%=product.getPrice()%></p>

				<select name="quantity">
					<%
					for (int i = 0; i <= 9; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
					}
					%>
				</select>

				<!-- カートに追加ボタン -->
				<button class="cartButton" data-id="<%=product.getProductId()%>"
					data-name="<%=product.getName()%>"
					data-price="<%=product.getPrice()%>"
					data-picture="<%=product.getImagePath()%>">カートに追加</button>
			</div>



		</div>
	</div>
	<!-- item -->
	<%
	}
	%>
	<!-- ← for 文の閉じ -->
	<%
	} else {
	%>
	<p>現在、商品が登録されていません。</p>
	<%
	}
	%>
	</div>
	<!-- items -->
</body>
</html>