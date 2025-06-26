<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, jp.co.aforce.beans.Product, jp.co.aforce.beans.Order" %>
<%
	Order order = (Order) session.getAttribute("order");
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");

	int subtotal = 0;
	if (cartList != null) {
		for (Product p : cartList) {
			subtotal += p.getPrice() * p.getQuantity();
		}
	}

	int fee = 0;
	String method = order.getPaymentMethod();
	if ("代引き引き換え".equals(method) || "コンビニ支払い".equals(method)) {
		fee = 330;
	}
	int shipping = 330;
	int total = subtotal + shipping + fee;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注文内容確認</title>
	
	<link rel="stylesheet" href="../../css/order-confirm.css">
</head>
<body>
	

	<h2 class="page-title">注文内容の確認</h2>

	<div class="confirm-container">
		<div class="section">
			<p>ユーザーID：<%= order.getMemberId() %></p>
			<p>支払方法：<%= order.getPaymentMethod() %></p>
			<p>お届け先：<%= order.getShippingAddress() %></p>
			<p>受取方法：<%= order.getDeliveryMethod() %></p>
			<% if ("置き配".equals(order.getDeliveryMethod())) { %>
				<p>置き場所：<%= order.getPlacementLocation() %></p>
			<% } %>
		</div>

		<div class="section">
			<h3>注文商品</h3>
			<% if (cartList != null && !cartList.isEmpty()) {
				for (Product p : cartList) {
			%>
			<div class="confirm-item">
				<img src="<%= request.getContextPath() + "/img/" + p.getImagePath() %>" width="80">
				<div class="item-details">
					<p>商品名：<%= p.getName() %></p>
					<p>数量：<%= p.getQuantity() %> 個</p>
					<p>小計：¥<%= p.getQuantity() * p.getPrice() %></p>
				</div>
			</div>
			<% } %>
			<% } else { %>
				<p>カートが空です。</p>
			<% } %>
		</div>

		<div class="section">
			<h3>料金詳細</h3>
			<p>商品合計：¥<%= subtotal %></p>
			<p>送料：¥<%= shipping %></p>
			<p>支払手数料：¥<%= fee %></p>
			<p class="total">合計金額：¥<%= total %></p>
		</div>

		<div class="button-area">
			<form action="orderComplete" method="post">
				<input type="submit" value="注文を確定する" class="confirm-button">
			</form>
			<a href="order-form.jsp" class="back-link">戻る</a>
		</div>
	</div>
</body>
</html>
