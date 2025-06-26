<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.aforce.beans.Order" %>
<%@ page import="jp.co.aforce.beans.OrderItem" %>
<%
	List<Order> orderList = (List<Order>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全ユーザーの注文履歴</title>
<link rel="stylesheet" href="../../../css/admin-order.css">
</head>
<body>

<div class="admin-container">
	<h1 class="admin-title">全ユーザーの注文履歴</h1>
	<a class="back-link" href="admin-menu.jsp">← 管理者メニューに戻る</a>

	<% if (orderList == null || orderList.isEmpty()) { %>
		<p class="no-data">注文履歴はありません。</p>
	<% } else { %>
		<% for (Order order : orderList) { %>
			<div class="order-card">
				<h3>注文番号: <%= order.getOrderId() %></h3>
				<p><strong>会員ID:</strong> <%= order.getMemberId() %></p>
				<p><strong>注文日:</strong> <%= order.getOrderDate() %></p>
				<p><strong>支払い方法:</strong> <%= order.getPaymentMethod() %></p>
				<p><strong>配送先:</strong> <%= order.getShippingAddress() %></p>
				<p><strong>合計金額:</strong> ¥<%= order.getTotalPrice() %></p>

				<table class="order-table">
					<tr>
						<th>商品ID</th>
						<th>数量</th>
						<th>価格</th>
					</tr>
					<% for (OrderItem item : order.getItems()) { %>
					<tr>
						<td><%= item.getProductId() %></td>
						<td><%= item.getQuantity() %></td>
						<td>¥<%= item.getPrice() %></td>
					</tr>
					<% } %>
				</table>
			</div>
		<% } %>
	<% } %>
</div>

</body>
</html>
