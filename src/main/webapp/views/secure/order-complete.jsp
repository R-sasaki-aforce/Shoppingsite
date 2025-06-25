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
</head>
<body>
    <h2>ご購入ありがとうございました</h2>

    <h3>購入商品一覧</h3>
    <%
        if (purchasedItems != null && !purchasedItems.isEmpty()) {
            for (Product p : purchasedItems) {
    %>
    <div>
        <p>商品名：<%= p.getName() %></p>
        <p>数量：<%= p.getQuantity() %> 個</p>
        <hr>
    </div>
    <%
            }
        } else {
    %>
    <p>購入された商品はありません。</p>
    <%
        }
    %>

    <a href="user-menu.jsp">トップに戻る</a>
</body>
</html>
