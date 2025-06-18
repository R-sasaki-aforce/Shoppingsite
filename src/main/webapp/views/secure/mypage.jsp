<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/mypage.css" />
<title>マイページ</title>
</head>
<body>

<nav class="navbar">
  <ul class="menu-nav">
    <!-- 左側（ロゴなど） -->
    <li><a href="user-menu.jsp">Musicstore</a></li>

    <!-- 右側のナビゲーションをラップ -->
    <div class="menu-right">
      <% User user = (User) session.getAttribute("loginUser"); %>
      <% if (user != null) { %>
        <li><a href="mypage.jsp"><%= user.getLast_name() %><%= user.getFirst_name() %> 様</a></li>
      <% } %>
      
      <li><a href="cart.jsp">カート</a></li>
      <li><a href="#">お気に入り</a></li>
      <li><a href="#">お問い合わせ</a></li>
    </div>
  </ul>
</nav>





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