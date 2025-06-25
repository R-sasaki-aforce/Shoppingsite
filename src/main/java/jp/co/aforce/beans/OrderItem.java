package jp.co.aforce.beans;

public class OrderItem implements java.io.Serializable{
	private int orderItemId;
	private int orderId;
	private int productId;
	private int quantity;
	private int price;
	
	
	// 商品名や画像など表示用の情報
		private String productName;
		private String productImagePath;
		public int getOrderItemId() {
			return orderItemId;
		}
		public void setOrderItemId(int orderItemId) {
			this.orderItemId = orderItemId;
		}
		public int getOrderId() {
			return orderId;
		}
		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getProductImagePath() {
			return productImagePath;
		}
		public void setProductImagePath(String productImagePath) {
			this.productImagePath = productImagePath;
		}
		
		
		
}
