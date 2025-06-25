<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.aforce.beans.Product" %>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/menu.css" />
    <title>検索結果画面</title>
</head>
<body>
<nav class="navbar">
    <ul class="menu-nav">
        <li><a href="user-menu.jsp">Musicstore</a></li>
        <li class="search-box">
            <form action="product-search" method="get">
                <input type="text" name="keyword" placeholder="商品を検索" value="<%= request.getAttribute("keyword") %>">
                <input type="submit" value="検索">
            </form>
        </li>
        <div class="menu-right">
            <%
            User user = (User) session.getAttribute("loginUser");
            if (user != null) {
            %>
            <li><a href="mypage.jsp"><%= user.getLast_name() %><%= user.getFirst_name() %> 様</a></li>
            <% } %>
            <li><a href="cart.jsp">カート</a></li>
            <li><a href="contact.jsp">お問い合わせ</a></li>
        </div>
    </ul>
</nav>
<div class="sort-buttons" style="text-align:right; margin: 10px;">
    <button class="sort-button" id="sort-price-desc">価格が高い順</button>
    <button class="sort-button" id="sort-price-asc">価格が安い順</button>
</div>
<div class="items">
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    if (productList != null && !productList.isEmpty()) {
        for (Product product : productList) {
%>
    <div class="item" data-price="<%= product.getPrice() %>">
        <div class="image-wrapper">
        <% if (product.getStock() <= 0) { %>
            <img class="soldout-overlay" src="../../img/ソールドアウト.jpg" alt="ソールドアウト" title="ソールドアウト">
        <% } %>
            <img class="product-image" src="<%= request.getContextPath() + "/img/" + product.getImagePath() %>" alt="<%= product.getName() %>" title="<%= product.getName() %>">
        </div>
        <div class="product-details">
            <p class="product-genre"><%= product.getGenre() %></p>
            <p class="product-name"><%= product.getName() %></p>
            <p class="artist-name"><%= product.getArtistName() %></p>
            <p><span class="product-price-label">通常価格</span> <span class="product-price">¥<%= product.getPrice() %></span></p>
            <div class="product-actions">
                <select name="quantity" class="quantity">
                    <% for (int i = 0; i <= 10; i++) { %>
                        <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
                <button class="cartButton"
                        data-id="<%= product.getProductId() %>"
                        data-name="<%= product.getName() %>"
                        data-price="<%= product.getPrice() %>"
                        data-picture="<%= product.getImagePath() %>"
                        data-stock="<%= product.getStock() %>">
                    カートに追加
                </button>
            </div>
        </div>
    </div>
<%
        }
    } else {
%>
    <p>該当する商品は見つかりませんでした。</p>
<%
    }
%>
</div>
<script>
  const contextPath = '<%= request.getContextPath() %>';
  window.productData = <%= new Gson().toJson(productList != null ? productList : new java.util.ArrayList<>()) %>;
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../js/menu.js"></script>

<!-- モーダルの背景 -->
<div id="productModal" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 id="modal-name"></h2>
    <p><strong>アーティスト:</strong> <span id="modal-artist"></span></p>
    <p><strong>ジャンル:</strong> <span id="modal-genre"></span></p>
    <p><strong>価格:</strong> <span id="modal-price"></span></p>
    <p><strong>発売日:</strong> <span id="modal-release-date"></span></p>
    <p><strong>説明:</strong> <span id="modal-description" style="font-size: smaller; color: #666;"></span></p>
    <iframe id="modal-video" width="100%" height="250" frameborder="0" allowfullscreen></iframe>
    <img id="modal-image" style="width:100%; max-height:300px; object-fit:contain; margin-top:10px;" />
  </div>
</div>
</body>
</html>
