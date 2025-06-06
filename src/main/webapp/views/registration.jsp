<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>新規会員登録</h1>
	
	
    <%User user=(User)session.getAttribute("confirminfo"); 
    if (user == null) {
        user = new User("","","","","",""); // 初回表示用
    }
    %>
    
	<form action="useraddconfirm" method="post">
		ユーザーID: <input type="text" id="userid" name="member_id" pattern="[A-Z a-z 0-9]{1,255}" value="<%=user.getMember_id() %>" required> 半角英数字
		<br>パスワード: <input type="text" id="password" name="password" pattern="[A-Z a-z 0-9]{1,}" value="<%=user.getPassword() %>"required> 半角英数字
		<br>名前（姓）: <input type="text" id="lastname" name="last_name" value="<%=user.getLast_name() %>"required> 
		<br>名前（名）: <input type="text"id="firstname" name="first_name" value="<%=user.getFirst_name() %>"required> 
		<br>　住所　　: <input type="text"id="" name="address" value="<%=user.getAddress() %>"required> 
		<br>メールアドレス: <input type="email" id="email" name="mail_address" value="<%=user.getMail_address() %>"required>
	<br><br><input type="submit" value="確認"> <input type="reset" value="リセット">
	</form>

	
	
	
	<br><a href="login-in.jsp">ログイン画面に戻る</a>
</body>
</html>