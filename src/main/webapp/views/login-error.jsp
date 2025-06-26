<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", sans-serif;
        background-color: #f8f8f8;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .error-container {
        background-color: #fff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 400px;
    }

    .error-title {
        font-size: 20px;
        color: #d33;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .error-message {
        font-size: 14px;
        color: #444;
        margin-bottom: 25px;
    }

    .back-button {
        padding: 10px 20px;
        font-size: 14px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .back-button:hover {
        background-color: #555;
    }
</style>
</head>
<body>
    <div class="error-container">
        <div class="error-title">ログインエラー</div>
        <p class="error-message">IDもしくはパスワードが違います。</p>

        <form action="login-in.jsp" method="get">
            <input type="submit" class="back-button" value="ログイン画面に戻る">
        </form>
    </div>
</body>
</html>
