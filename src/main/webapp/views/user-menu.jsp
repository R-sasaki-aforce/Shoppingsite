<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="jp.co.aforce.beans.User" %>
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
  <%
	String name = (String) session.getAttribute("userName");
	%>
	
    <%User user=(User)session.getAttribute("loginUser"); %>
	<%if(user!=null){ %>
	
	 <li><a href="mypage.jsp"><%= user.getLast_name() %><%= user.getFirst_name() %>様</a></li>
<!--	<p>-->
<!--		ようこそ、<%= user.getLast_name() %><%= user.getFirst_name() %>さん！-->
<!--	</p>-->
	<%
	}else if (name != null) {
	%>
	<p>
		ようこそ、<%= name %>さん！
	</p>
	
	<%} %>
	
	<%/*
	}else{
		response.sendRedirect("login-in.jsp");
		}*/%>
  
  
  
  
 
    
    <li><a href="#">商品一覧</a></li>
    <li><a href="#">カート</a></li>
    <li><a href="#">お気に入り</a></li>
    <li><a href="#">お問い合わせ</a></li>
  </ul>
</nav>
<!--<h1>会員メニュー</h1>-->
	<!--ログイン情報（セッション）がなければログインページに戻す-->



	



<!--	<form action="retouching.jsp" method="post">-->
<!--		<input type="submit" value="修正">-->
<!--	</form>-->
<!--	<form action="user-delete" method="post">-->
<!--		<input type="submit" value="削除" onclick="return confirm('会員情報を全て削除してもよろしいですか？');"><br>-->
<!--	</form>-->
<!--	<form action="logout" method="post">-->
<!--		<input type="submit" value="ログアウト">-->
<!--	</form>-->

</body>
</html>