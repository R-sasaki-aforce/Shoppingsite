/**
 * 
 */
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