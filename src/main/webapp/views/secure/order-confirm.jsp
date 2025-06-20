<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, jp.co.aforce.beans.Product, jp.co.aforce.beans.Order" %>

<%
	Order order = (Order) session.getAttribute("order");
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注文確認</title>
</head>
<body>
	<h2>注文内容確認</h2>

	<p>ユーザーID：<%= order.getMemberId() %></p>
	<p>支払方法：<%= order.getPaymentMethod() %></p>
	<p>お届け先：<%= order.getShippingAddress() %></p>
	<p>受取方法：<%= order.getDeliveryMethod() %></p>

	<% if ("置き配".equals(order.getDeliveryMethod())) { %>
		<p>置き場所：<%= order.getPlacementLocation() %></p>
	<% } %>

	<h3>注文商品</h3>
	<% if (cartList != null && !cartList.isEmpty()) {
		for (Product p : cartList) {
	%>
		<div>
			<img src="<%= request.getContextPath() + "/uploads/" + p.getImagePath() %>" width="80">
			<p>商品名：<%= p.getName() %></p>
			<p>数量：<%= p.getQuantity() %> 個</p>
			<p>小計：¥<%= p.getQuantity() * p.getPrice() %></p>
		</div>
		<hr>
	<%
		}
	} else {
	%>
		<p>カートが空です。</p>
	<%
	}
	%>

	<h3>合計金額：¥<%= order.getTotalPrice() %></h3>

	<form action="orderComplete" method="post">
		<input type="submit" value="注文を確定する">
	</form>

	<a href="order-form.jsp">戻る</a>
</body>
</html>