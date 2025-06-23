/**
 * 
 */
$(document).ready(function () {
		// カートに追加ボタンがクリックされた時の処理
		$('.cartButton').click(function () {
		    const button = $(this);

		    const productId = button.data('id');
		    const quantity = button.closest('.product-details').find('.quantity').val();
		    const stock = button.data('stock');

		    // 在庫が0なら追加させずに警告
		    if (stock <= 0) {
		        alert("この商品は在庫切れのため、カートに追加できません。");
		        return;
		    }

		    // 数量が0の場合はアラート
		    if (!quantity || quantity == 0) {
		        alert("数量を選択してください。");
		        return;
		    }

		    $.ajax({
		        url: contextPath + "/AddToCart",
		        type: 'POST',
		        data: {
		            product_id: productId,
		            quantity: quantity
		        },
		        success: function (responseText) {
		            alert(responseText);
		        },
		        error: function (xhr, status, error) {
		            if (xhr.status === 401) {
		                alert("ログインしてください。");
		                location.href = "<%= request.getContextPath() %>/views/login-in.jsp";
		            } else if (xhr.status !== 200) {
		                alert("商品追加に失敗しました: " + error);
		            }
		        }
		    });
		});

	});