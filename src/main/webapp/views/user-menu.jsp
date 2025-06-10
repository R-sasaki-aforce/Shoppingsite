<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/menu.css" />
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
				<li><a href="#">商品一覧</a></li>
				<li><a href="#">カート</a></li>
				<li><a href="#">お気に入り</a></li>
				<li><a href="#">お問い合わせ</a></li>
			</div>
		</ul>
	</nav>




<div class="items">
	<div class="item">
		<img src="../img/JIGDRESS.jpg" alt="JIGDRESS" title="JIGDRESS">
		<div class="product name">
			<p>JIGDRESS￥1,650</p>
			<!--プルダウン-->
			<select name="quantity">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
			</select>
			<!--カートに追加ボタン-->
			<button class="cartButton" data-id="2" data-name="ボディミスト"
				data-price="1500" data-picture="img/kousui_atomizer.png">
				カートに追加</button>
		</div>
	</div>
	<div class="item">
		<img src="../img/クリーミー.jfif" alt="クリーミー" title="クリーミー">
		<div class="product name">
			<p>JIGDRESS￥1,650</p>
			<!--プルダウン-->
			<select name="quantity">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
			</select>
			<!--カートに追加ボタン-->
			<button class="cartButton" data-id="2" data-name="ボディミスト"
				data-price="1500" data-picture="img/kousui_atomizer.png">
				カートに追加</button>
		</div>
	</div>
	<div class="item">
		<img src="../img/ジュウ.jfif" alt="ジュウ" title="ジュウ">
		<div class="product name">
			<p>JIGDRESS￥1,650</p>
			<!--プルダウン-->
			<select name="quantity">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
			</select>
			<!--カートに追加ボタン-->
			<button class="cartButton" data-id="2" data-name="ボディミスト"
				data-price="1500" data-picture="img/kousui_atomizer.png">
				カートに追加</button>
		</div>
	</div>
</div>

</body>
</html>