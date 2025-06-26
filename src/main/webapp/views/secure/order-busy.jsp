<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>注文処理中</title>
  <link rel="stylesheet" href="../../css/error.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .error-container {
      background-color: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
      max-width: 400px;
      width: 90%;
    }

    h2 {
      color: #d9534f;
      margin-bottom: 20px;
    }

    p {
      font-size: 16px;
      color: #333;
      margin-bottom: 30px;
      line-height: 1.6;
    }

   .retry-button {
  display: inline-block;
  background: linear-gradient(to right, #007bff, #0056b3);
  color: #fff;
  padding: 10px 20px;         /* サイズを小さめに */
  font-size: 14px;            /* フォントサイズ調整 */
  border: none;
  border-radius: 6px;
  text-decoration: none;
  box-shadow: 0 3px 8px rgba(0, 123, 255, 0.3);
  transition: transform 0.2s, box-shadow 0.3s;
  max-width: 100%;
  box-sizing: border-box;
}

  .retry-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 14px rgba(0, 123, 255, 0.4);
  }
  </style>
</head>
<body>
  <div class="error-container">
    <h2>ただいま注文処理中です</h2>
    <p>他のユーザーが現在、注文処理を行っています。<br>
    しばらくしてからもう一度お試しください。</p>
    <a href="cart.jsp" class="retry-button">カート画面に戻る</a>
  </div>
</body>
</html>
