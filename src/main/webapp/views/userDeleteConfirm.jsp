<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--ダイアログ表示するならこれはいらない-->



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = (String) session.getAttribute("userName");
	%>
	<%
	if (name != null) {
	%>
	<h1>削除してよろしいですか？</h1>
	<p><%=name%>さん
	</p>
	<%}else{
		response.sendRedirect("login-in.jsp");
		}%>

	<form action="user-delete" method="post">
		<input type="submit" value="削除">
	</form>
	
	<a href="user-menu.jsp">会員メニューに戻る</a>
</body>
</html>