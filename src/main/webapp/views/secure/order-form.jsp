<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User, jp.co.aforce.beans.Product, jp.co.aforce.beans.Order, java.util.List" %>

<%
User user = (User) session.getAttribute("loginUser");
Order order = (Order) session.getAttribute("order");

// カートの中身と小計の計算
List<Product> cartList = (List<Product>) session.getAttribute("cartList");
int subtotal = 0;
if (cartList != null) {
	for (Product p : cartList) {
		subtotal += p.getPrice() * p.getQuantity();
	}
}
String placement = (order != null && order.getPlacementLocation() != null) ? order.getPlacementLocation() : "玄関ドア前";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入手続き</title>
<script src="../../js/order.js" defer></script>
</head>
<body>
	<h2>購入手続きフォーム</h2>

	<form action="orderConfirm" method="post">
		<p>ユーザーID：<%=user.getMember_id()%></p>
		<input type="hidden" name="member_id" value="<%=user.getMember_id()%>">
		<input type="hidden" id="subtotal" value="<%=subtotal%>">

		<!-- 支払方法 -->
		<p>支払方法：</p>
		<select name="payment_method" id="payment_method" required onchange="updateTotal()">
			<option value="credit" <%= order != null && "credit".equals(order.getPaymentMethod()) ? "selected" : "" %>>クレジットカード(手数料: ¥0)</option>
			<option value="cod" <%= order != null && "cod".equals(order.getPaymentMethod()) ? "selected" : "" %>>代引き引き換え (手数料: ¥330)</option>
			<option value="convenience" <%= order != null && "convenience".equals(order.getPaymentMethod()) ? "selected" : "" %>>コンビニ (手数料: ¥330)</option>
		</select>

		<!-- お届け先 -->
		<p>お届け先：</p>
		<textarea name="shipping_address" rows="3" cols="40" required><%= order != null && order.getShippingAddress() != null ? order.getShippingAddress() : user.getAddress() %></textarea>

		<!-- 受取方法 -->
		<h3>受取方法</h3>
		<label><input type="radio" name="delivery_method" value="対面" <%= order == null || "対面".equals(order.getDeliveryMethod()) ? "checked" : "" %>> 対面で受け取り</label><br>
		<label><input type="radio" name="delivery_method" value="置き配" <%= order != null && "置き配".equals(order.getDeliveryMethod()) ? "checked" : "" %>> 置き配</label>

		<div id="placement-options" style="margin-left: 20px; display: <%= order != null && "置き配".equals(order.getDeliveryMethod()) ? "block" : "none" %>;">
			<p>置き場所の指定:</p>
			<label><input type="radio" name="placement_location" value="玄関ドア前" <%= "玄関ドア前".equals(placement) ? "checked" : "" %>>玄関ドア前</label><br>
			<label><input type="radio" name="placement_location" value="宅配BOX" <%= "宅配BOX".equals(placement) ? "checked" : "" %>>宅配BOX</label><br>
			<label><input type="radio" name="placement_location" value="ガスメーターBOX" <%= "ガスメーターBOX".equals(placement) ? "checked" : "" %>>ガスメーターBOX</label><br>
			<label><input type="radio" name="placement_location" value="建物内受付/管理人預け" <%= "建物内受付/管理人預け".equals(placement) ? "checked" : "" %>>建物内受付/管理人預け</label><br>
		</div>

		<!-- カート内の商品 -->
		<h3>カート内の商品</h3>
		<%
		if (cartList != null && !cartList.isEmpty()) {
			for (Product p : cartList) {
				int itemTotal = p.getPrice() * p.getQuantity();
		%>
		<div style="margin-bottom: 10px;">
			<img src="<%=request.getContextPath() + "/uploads/" + p.getImagePath()%>" width="80">
			<p>商品名：<%=p.getName()%></p>
			<p>数量：<%=p.getQuantity()%> 個</p>
			<p>小計：¥<%=itemTotal%></p>
			<hr>
		</div>
		<%
			}
		} else {
		%>
		<p>カートは空です。</p>
		<%
		}
		%>

		<!-- 料金まとめ -->
		<p>商品合計：¥<%=subtotal%></p>
		<p>送料：¥<span id="shipping">330</span></p>
		<p>支払手数料：¥<span id="fee">0</span></p>
		<p><strong>合計金額：¥<span id="total"><%=subtotal + 330%></span></strong></p>
		<input type="hidden" name="total_price" id="total_price" value="<%=subtotal + 330%>"> <br><br>
		<input type="submit" value="注文確認に進む">
	</form>

	<a href="cart.jsp">カートに戻る</a>
</body>
</html>