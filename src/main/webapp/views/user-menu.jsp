<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String name = (String)session.getAttribute("userName"); %>
<p>ようこそ、<%=name %>さん！</p>

	<form action="retouching.jsp" method="post">
		<input type="submit" value="修正">
	</form>
	<form action="" method="post">
		<input type="submit" value="削除">
	</form>
	<form action="logout" method="post">
		<input type="submit" value="ログアウト">
	</form>

</body>
</html>