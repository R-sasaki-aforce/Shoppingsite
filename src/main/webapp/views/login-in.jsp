<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>

<div class="login-wrapper">
    <!-- タイトル -->
    <h2 class="header-title">Login</h2>

    <!-- フォーム本体 -->
    <div class="login-container">
        <% session.removeAttribute("confirminfo"); %>
        <form action="login-in" method="post">
            <input type="text" name="member_id" placeholder="ユーザーID（半角英数字）" required> 
            <input type="password" name="password" placeholder="パスワード (半角英数字)" required> 
            <input type="submit" value="ログイン">
        </form>
        <a href="registration.jsp">新規会員登録</a>
    </div>
</div>

</body>
</html>
