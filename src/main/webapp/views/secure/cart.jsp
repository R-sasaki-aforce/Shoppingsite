<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User, jp.co.aforce.beans.Product, jp.co.aforce.dao.ProductDAO" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("loginUser");
    ProductDAO dao = new ProductDAO();
    List<Product> cartList = dao.getCartProducts(user.getMember_id());

    int total = 0;
    boolean hasInsufficientStock = false;

    if (cartList != null) {
        for (Product p : cartList) {
            total += p.getPrice() * p.getQuantity();
            if (p.getStock() < p.getQuantity()) {
                hasInsufficientStock = true;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>カート</title>
    <link rel="stylesheet" href="../../css/menu.css" />
    <link rel="stylesheet" href="../../css/cart.css" />
</head>
<body>

<nav class="navbar">
    <ul class="menu-nav">
        <li><a href="user-menu.jsp">Musicstore</a></li>
        <li class="search-box">
            <form action="product-search" method="get">
                <input type="text" name="keyword" placeholder="商品を検索">
                <input type="submit" value="検索">
            </form>
        </li>
        <div class="menu-right">
            <% if (user != null) { %>
                <li><a href="mypage.jsp"><%= user.getLast_name() %><%= user.getFirst_name() %> 様</a></li>
            <% } %>
            <li><a href="cart.jsp">カート</a></li>
            <li><a href="contact.jsp">お問い合わせ</a></li>
        </div>
    </ul>
</nav>

<div class="cart-container">
    <% if (cartList == null || cartList.isEmpty()) { %>
        <p class="empty-message">カートは空です。</p>
    <% } else { 
        for (Product p : cartList) {
            int subtotal = p.getPrice() * p.getQuantity();
    %>
        <div class="cart-item">
            <img src="<%= request.getContextPath() + "/img/" + p.getImagePath() %>" class="product-image">

            <div class="cart-content">
                <div class="item-info">
                    <p>商品名：<%= p.getName() %></p>
                    <p>価格：¥<%= p.getPrice() %></p>
                    <p>在庫：<%= p.getStock() %></p>
                </div>

                <div class="item-controls">
                    <form action="CartUpdate" method="post" class="quantity-form">
                        <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                        <div class="quantity-controls">
                            <button type="button" class="quantity-decrease">−</button>
                            <input type="text" name="quantity" value="<%= p.getQuantity() %>" class="quantity-input" readonly>
                            <button type="button" class="quantity-increase">＋</button>
                            <input type="submit" name="action" value="数量変更" class="quantity-submit">
                        </div>
                    </form>

                    <form action="CartUpdate" method="post" class="delete-form">
                        <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                        <input type="submit" name="action" value="削除">
                    </form>

                    <p class="subtotal">小計：¥<%= subtotal %></p>
                </div>
            </div>
        </div>
    <% } } %>
</div>

<div class="cart-total">
    <h3>合計：¥<%= total %></h3>
</div>

<%
    session.setAttribute("cartList", cartList);
    request.setAttribute("total_price", total);
%>

<% if (cartList != null && !cartList.isEmpty()) { %>
    <form id="checkoutForm" action="order-form.jsp" method="post" class="checkout-form">
        <input type="hidden" name="total_price" value="<%= total %>">
        <input type="submit" value="お会計に進む" class="checkout-button">
    </form>
    <input type="hidden" id="hasInsufficientStock" value="<%= hasInsufficientStock %>" />
<% } %>

<script src="../../js/cart.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("checkoutForm");
    const hasInsufficient = document.getElementById("hasInsufficientStock");

    if (form && hasInsufficient && hasInsufficient.value === "true") {
        form.addEventListener("submit", function (e) {
            e.preventDefault();
            alert("数量が不足している商品があります。");
        });
    }
});
</script>

</body>
</html>
