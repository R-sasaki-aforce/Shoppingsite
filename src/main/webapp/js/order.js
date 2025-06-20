document.addEventListener("DOMContentLoaded", function() {
	const deliveryRadios = document.getElementsByName("delivery_method");
	const placementOptions = document.getElementById("placement-options");

	// 状態初期化
	function togglePlacementOptions() {
		const selected = Array.from(deliveryRadios).find(r => r.checked);
		if (selected && selected.value === "置き配") {
			placementOptions.style.display = "block";
		} else {
			placementOptions.style.display = "none";
		}
	}

	// イベント設定
	deliveryRadios.forEach(r => {
		r.addEventListener("change", togglePlacementOptions);
	});

	togglePlacementOptions(); // 初期状態の反映
});

function updateTotal() {
	
	const subtotal = parseInt(document.getElementById("subtotal").value);
	const shipping = 330;
	const method = document.getElementById("payment_method").value;

	let fee = 0;
	if (method === "cod" || method === "convenience") {
		fee = 330;
	}

	const total = subtotal + shipping + fee;

	document.getElementById("fee").textContent = fee;
	document.getElementById("total").textContent = total;
	document.getElementById("total_price").value = total;
}

document.addEventListener("DOMContentLoaded", updateTotal);