<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/menu.css" />
<title>マイページ</title>
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
<h1>登録されている情報</h1>
ユーザーID：<%=user.getMember_id()%>
<br>名前＿姓：<%=user.getLast_name()%>
<br>名前＿名：<%=user.getFirst_name()%>
<br>住所：<%=user.getAddress()%>
<br>メールアドレス：<%=user.getMail_address()%>


<form action="order-history" method="get">
		<input type="submit" value="注文履歴">
	</form>
<form action="retouching.jsp" method="post">
		<input type="submit" value="修正">
	</form>
	<form action="user-delete" method="post">
		<input type="submit" value="削除" onclick="return confirm('会員情報を全て削除してもよろしいですか？');"><br>
	</form>
	<form action="logout" method="post">
		<input type="submit" value="ログアウト">
	</form>


</body>
</html>