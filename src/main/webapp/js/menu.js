// slickスライダーの初期化は画像読み込み後に行う
$(window).on('load', function () {
  $('.mainvisual').slick({
    autoplay: true,
    autoplaySpeed: 3000, // ← ここでスライド間隔（ミリ秒）を自由に設定できます
	speed: 1000,
    arrows: true,
    dots: true,
    infinite: true,
    pauseOnHover: false // ← ホバーしても止まらないように（任意）
  });
});

// その他の処理はDOMができてからでOK
$(document).ready(function () {

  // 商品クリックでモーダル表示
  $(document).on('click', '.product-image', function () {
    const product = $(this).closest('.item');
    const id = product.find(".cartButton").data("id");

    const matched = window.productData.find(p => p.productId === id);

    if (matched) {
      $("#modal-name").text(matched.name);
      $("#modal-artist").text(matched.artistName);
      $("#modal-genre").text(matched.genre);
      $("#modal-price").text("¥" + matched.price);
      $("#modal-release-date").text(matched.releaseDate || "―");
      $("#modal-description").text(matched.description || "―");
      $("#modal-image").attr("src", contextPath + "/img/" + matched.imagePath);

      const videoUrl = matched.sampleUrl || "";
      let embedUrl = "";

      if (videoUrl.includes("youtube.com/watch?v=")) {
        const videoId = videoUrl.split("v=")[1].split("&")[0];
        embedUrl = "https://www.youtube.com/embed/" + videoId;
      } else if (videoUrl.includes("youtu.be/")) {
        const videoId = videoUrl.split("youtu.be/")[1].split("?")[0];
        embedUrl = "https://www.youtube.com/embed/" + videoId;
      }

      $("#modal-video").attr("src", embedUrl);
    }

    $("#productModal").fadeIn();
  });

  // モーダルを閉じる
  $(".close").click(function () {
    $("#productModal").fadeOut();
    $("#modal-video").attr("src", "");
  });

  $(window).click(function (event) {
    if ($(event.target).is("#productModal")) {
      $("#productModal").fadeOut();
      $("#modal-video").attr("src", "");
    }
  });

  // カートに追加処理
  $(document).on('click', '.cartButton', function (e) {
    e.stopPropagation();

    const button = $(this);
    const productId = button.data('id');
    const quantity = button.closest('.product-details').find('.quantity').val();
    const stock = button.data('stock');

    if (stock <= 0) {
      alert("この商品は在庫切れのため、カートに追加できません。");
      return;
    }

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
          location.href = contextPath + "/views/login-in.jsp";
        } else {
          alert("商品追加に失敗しました: " + error);
        }
      }
    });
  });

  // 並び替え処理
  function sortItems(order) {
    const items = $(".item").get();
    items.sort(function (a, b) {
      const priceA = parseInt($(a).data("price"));
      const priceB = parseInt($(b).data("price"));
      return order === "asc" ? priceA - priceB : priceB - priceA;
    });

    $(".items").empty();
    $.each(items, function (index, item) {
      $(".items").append(item);
    });
  }

  $("#sort-price-asc").on("click", function () {
    sortItems("asc");
  });

  $("#sort-price-desc").on("click", function () {
    sortItems("desc");
  });

});
