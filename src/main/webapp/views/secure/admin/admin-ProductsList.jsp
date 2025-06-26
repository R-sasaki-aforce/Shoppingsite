<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.aforce.beans.Product" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	List<Product> products = (List<Product>) session.getAttribute("productList");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<link rel="stylesheet" href="../../../css/admin-products.css">
</head>
<body>

<div class="admin-container">
	<h1 class="admin-title">商品管理</h1>

	<div class="admin-actions">
		<a class="button" href="admin-ProductAdd.jsp">＋ 新規商品登録</a>
		<a class="button-secondary" href="admin-menu.jsp">← 管理者メニューに戻る</a>
	</div>

	<%
		String deleted = request.getParameter("deleted");
		if ("1".equals(deleted)) {
	%>
	<script>alert("削除が完了しました");</script>
	<%
		}
	%>

	<table class="admin-table">
		<thead>
			<tr>
				<th>ID</th>
				<th>商品名</th>
				<th>アーティスト名</th>
				<th>ジャンル</th>
				<th>価格</th>
				<th>在庫数</th>
				<th>発売日</th>
				<th>登録日</th>
				<th>更新日時</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (products != null && !products.isEmpty()) {
				for (Product p : products) {
			%>
			<tr>
				<td><%= p.getProductId() %></td>
				<td><%= p.getName() %></td>
				<td><%= p.getArtistName() %></td>
				<td><%= p.getGenre() %></td>
				<td>¥<%= p.getPrice() %></td>
				<td><%= p.getStock() %></td>
				<td><%= p.getReleaseDate() %></td>
				<td><%= p.getCreatedAt() != null ? sdf.format(p.getCreatedAt()) : "不明" %></td>
				<td><%= p.getUpdatedAt() != null ? sdf.format(p.getUpdatedAt()) : "未更新" %></td>
				<td class="actions-cell">
				<div class="button-group">
					<form action="edit-product" method="get" style="display:inline;">
						<input type="hidden" name="product_id" value="<%= p.getProductId() %>">
						<input type="submit" class="action-button" value="編集">
					</form>
					<form action="delete-product" method="post" style="display:inline;" onsubmit="return confirm('本当に削除しますか？');">
						<input type="hidden" name="product_id" value="<%= p.getProductId() %>">
						<input type="submit" class="delete-button" value="削除">
					</form>
					 </div>
				</td>
			</tr>
			<%
				}
			} else {
			%>
			<tr>
				<td colspan="10" class="no-data">商品が存在しません。</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>

</body>
</html>
