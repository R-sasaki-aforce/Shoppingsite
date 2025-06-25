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
</head>
<body>
<h1>全ユーザーの注文履歴</h1>
<a href="admin-menu.jsp">管理者メニューに戻る</a>
<% if (orderList == null || orderList.isEmpty()) { %>
	<p>注文履歴はありません。</p>
<% } else { %>
	<% for (Order order : orderList) { %>
		<h3>注文番号: <%= order.getOrderId() %></h3>
		<p>会員ID: <%= order.getMemberId() %></p>
		<p>注文日: <%= order.getOrderDate() %></p>
		<p>支払い方法: <%= order.getPaymentMethod() %></p>
		<p>配送先: <%= order.getShippingAddress() %></p>
		<p>合計金額: <%= order.getTotalPrice() %>円</p>

		<table border="1">
			<tr>
				<th>商品ID</th>
				<th>数量</th>
				<th>価格</th>
				
			</tr>
			<% for (OrderItem item : order.getItems()) { %>
			<tr>
				<td><%= item.getProductId() %></td>
				<td><%= item.getQuantity() %></td>
				<td><%= item.getPrice() %>円</td>
				
			</tr>
			<% } %>
		</table>
		<hr>
	<% } %>
<% } %>


</body>
</html>