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
					<input type="text" name="keyword" placeholder="商品を検索"> <input
						type="submit" value="検索">
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

<h2>検索結果：「<%= request.getAttribute("keyword") %>」</h2>

<%
	List<Product> productList = (List<Product>) request.getAttribute("productList");
	if (productList != null && !productList.isEmpty()) {
		for (Product product : productList) {
%>
		<div class="item">
			<img src="<%=product.getImagePath()%>" alt="<%=product.getName()%>">
			<p>商品名：<%=product.getName()%></p>
			<p>アーティスト名：<%=product.getArtistName()%></p>
			<p>価格：￥<%=product.getPrice()%></p>
			<!-- 必要に応じてジャンルや発売日も表示できます -->
		</div>
<%
		}
	} else {
%>
	<p>該当する商品は見つかりませんでした。</p>
<%
	}
%>





</body>
</html>