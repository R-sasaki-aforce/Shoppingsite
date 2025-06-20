<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jp.co.aforce.beans.User" %>

<%
User user = (User) session.getAttribute("loginUser");

String totalPrice = request.getParameter("total_price");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>購入手続きフォーム</h2>

	<form action="OrderConfirm" method="post">
		<p>ユーザーID：<%= user.getMember_id() %></p>
		<input type="hidden" name="member_id" value="<%= user.getMember_id() %>">

		<p>支払方法：</p>
		<select name="payment_method" required>
			<option value="クレジットカード">クレジットカード</option>
			<option value="銀行振込">代引き引き換え(手数料:\300)</option>
			<option value="代引き">コンビニ(手数料:\300)</option>
		</select>

		<p>お届け先：</p>
		<textarea name="shipping_address" rows="3" cols="40" required></textarea>
<!-- 受取方法 -->
<h3>受取方法</h3>

<label>
	<input type="radio" name="delivery_method" value="対面" checked>
	対面で受け取り
</label><br>

<label>
	<input type="radio" name="delivery_method" value="置き配">
	置き配
</label>

<div id="placement-options" style="margin-left: 20px; display: none;">
	<p>置き場所の指定:</p>
	<label><input type="radio" name="placement_location" value="玄関ドア前" checked>玄関ドア前</label><br>
	<label><input type="radio" name="placement_location" value="宅配BOX">宅配BOX</label><br>
	<label><input type="radio" name="placement_location" value="ガスメーターBOX">ガスメーターBOX</label><br>
	<label><input type="radio" name="placement_location" value="物置">物置</label><br>
	<label><input type="radio" name="placement_location" value="車庫">車庫</label><br>
	<label><input type="radio" name="placement_location" value="自転車かご">自転車かご</label><br>
	<label><input type="radio" name="placement_location" value="建物内受付/管理人預け">建物内受付/管理人預け</label><br>
</div>

		<p>合計金額：¥<%= totalPrice %></p>
		<input type="hidden" name="total_price" value="<%= totalPrice %>">

		<br><br>
		<input type="submit" value="注文確定">
	</form>
<script src="../../js/order.js"></script>
</body>
</html>