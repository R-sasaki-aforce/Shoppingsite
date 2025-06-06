<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>

<nav>
 <ul class="menu-nav">
    <%User user=(User)session.getAttribute("loginUser"); %>
	<%if(user!=null){ %>
	
	 <li><a href="user-menu.jsp"><%= user.getLast_name() %><%= user.getFirst_name() %>様</a></li>

	<%
	}
	%>
	
	
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