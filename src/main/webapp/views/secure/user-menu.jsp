<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.User"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.beans.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/menu.css" />
<title>メニュー画面</title>
</head>
<body>

	<nav class="navbar">
		<ul class="menu-nav">
			<!-- 左側（ロゴなど） -->
			<li><a href="user-menu.jsp">Musicstore</a></li>
			<!-- 中央：検索欄 -->
			<li class="search-box">
				<form action="product-search" method="get">
					<input type="text" name="keyword" placeholder="商品を検索"> <input
						type="submit" value="検索">
				</form>
			</li>
			<!-- 右側のナビゲーションをラップ -->
			<div class="menu-right">
				<%
				User user = (User) session.getAttribute("loginUser");
				%>
				<%
				if (user != null) {
				%>
				<li><a href="mypage.jsp"><%=user.getLast_name()%><%=user.getFirst_name()%>
						様</a></li>
				<%
				}
				%>

				<li><a href="cart.jsp">カート</a></li>
				<li><a href="#">お気に入り</a></li>
				<li><a href="#">お問い合わせ</a></li>
			</div>
		</ul>
	</nav>




	<div class="items">
		<%
		List<Product> productList = (List<Product>) session.getAttribute("productList");
		if (productList != null && !productList.isEmpty()) {
			for (Product product : productList) {
		%>


		<div class="item">
			<img src="<%=request.getContextPath() +"/uploads/" + product.getImagePath()%>" alt="<%=product.getName()%>"
				title="<%=product.getName()%>">
			<div class="product name">
				<p><%=product.getName()%>
					￥<%=product.getPrice()%></p>

				<select name="quantity"class="quantity">
					<%
					for (int i = 0; i <= 9; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
					}
					%>
				</select>

				<!-- カートに追加ボタン -->
				<button class="cartButton" data-id="<%=product.getProductId()%>"
					data-name="<%=product.getName()%>"
					data-price="<%=product.getPrice()%>"
					data-picture="<%=product.getImagePath()%>">カートに追加</button>
			</div>



		</div>
	</div>
	<!-- item -->
	<%
	}
	%>
	
	<%
	} else {
	%>
	<p>現在、商品が登録されていません。</p>
	<%
	}
	%>
	</div>
	<!-- items -->
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // カートに追加ボタンがクリックされた時の処理
        $('.cartButton').click(function () {
            const button = $(this);

            const productId = button.data('id');
            const quantity = button.closest('.product').find('.quantity').val();

            // 数量が0の場合はアラート
            if (!quantity || quantity == 0) {
                alert("数量を選択してください。");
                return;
            }

            $.ajax({
                url: '<%= request.getContextPath() %>/AddToCart',  // 相対パスでサーブレット指定
                type: 'POST',
                data: {
                    product_id: productId,
                    quantity: quantity
                },
                success: function (responseText) {
                    alert(responseText);  // サーブレットからのメッセージを表示
                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        alert("ログインしてください。");
                        location.href = "<%= request.getContextPath() %>/views/login-in.jsp";
                    } else {
                        alert("商品追加に失敗しました。");
                    }
                }
            });
        });
    });
</script>
</body>
</html>