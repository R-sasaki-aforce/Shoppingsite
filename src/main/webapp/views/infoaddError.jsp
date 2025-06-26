<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>エラー</title>
  <link rel="stylesheet" href="../css/error.css">
</head>
<body>
  <div class="error-container">
    <h1 class="error-title">エラー</h1>
    <p class="error-message"><strong>エラーが発生しました。</strong></p>
    <p class="error-description">入力されたIDは既に使われています。<br>新規登録からやり直してください。</p>

    <form action="registration.jsp" method="post">
      <input type="submit" class="retry-button" value="新規登録画面にもどる">
    </form>
  </div>
</body>
</html>
