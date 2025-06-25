<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせ</title>
<link rel="stylesheet" href="../../css/menu.css">
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
<div class="contact-submit">
    <h2>お問い合わせフォーム</h2>
    <form action="contact-submit" method="post">
        <label for="name">お名前:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">メールアドレス:</label>
        <input type="email" id="email" name="email" required>

        <label for="subject">件名:</label>
        <input type="text" id="subject" name="subject" required>

        <label for="message">お問い合わせ内容:</label>
        <textarea id="message" name="message" rows="8" required></textarea>

        <input type="submit" value="送信">
    </form>
</div>

</body>
</html>
