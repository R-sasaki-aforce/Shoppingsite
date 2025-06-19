package jp.co.aforce.beans;

import java.io.Serializable;

public class CartItem implements Serializable{
	 private int productId;
	    private String productName;
	    private int productPrice;
	    private int quantity;
	    private String productPicture;
	    
	    
		public CartItem(int productId, String productName, int productPrice, int quantity, String productPicture) {
			super();
			this.productId = productId;
			this.productName = productName;
			this.productPrice = productPrice;
			this.quantity = quantity;
			this.productPicture = productPicture;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getProductPicture() {
			return productPicture;
		}
		public void setProductPicture(String productPicture) {
			this.productPicture = productPicture;
		}
	    
	    
}
