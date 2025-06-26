<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jp.co.aforce.beans.Product" %>

<%
    List<Product> purchasedItems = (List<Product>) session.getAttribute("purchasedItems");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>購入完了</title>
    <link rel="stylesheet" href="../../css/complete.css">
    <style>
        ul.purchased-list {
            list-style-type: disc;
            text-align: left;
            margin: 0 auto 20px;
            padding-left: 20px;
            max-width: 260px;
        }
        ul.purchased-list li {
            font-size: 13px;
            color: #333;
            margin-bottom: 6px;
        }
    </style>
</head>
<body>
    <div class="complete-container">
        <h2 class="page-title">ご購入ありがとうございました</h2>

        <div class="message">以下の商品を購入しました：</div>

        <% if (purchasedItems != null && !purchasedItems.isEmpty()) { %>
            <ul class="purchased-list">
                <% for (Product p : purchasedItems) { %>
                    <li>
                        <strong><%= p.getName() %></strong>（数量：<%= p.getQuantity() %>）
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <div class="sub-message">購入された商品はありません。</div>
        <% } %>

        <a href="user-menu.jsp" class="button">トップに戻る</a>
    </div>
</body>
</html>
