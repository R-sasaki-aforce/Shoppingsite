
/**
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
	const decreaseButtons = document.querySelectorAll(".quantity-decrease");
	const increaseButtons = document.querySelectorAll(".quantity-increase");

	decreaseButtons.forEach(button => {
		button.addEventListener("click", () => {
			const input = button.nextElementSibling;
			let value = parseInt(input.value);
			if (value > 1) {
				input.value = value - 1;
			}
		});
	});

	increaseButtons.forEach(button => {
		button.addEventListener("click", () => {
			const input = button.previousElementSibling;
			let value = parseInt(input.value);
			input.value = value + 1;
		});
	});
});
