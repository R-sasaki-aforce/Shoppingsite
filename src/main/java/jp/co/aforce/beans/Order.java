package jp.co.aforce.beans;

import java.io.Serializable;
import java.security.Timestamp;

public class Order  implements Serializable {
	private int orderId;
	private String memberId;
	private Timestamp orderDate;
	private int totalPrice;
	private String paymentMethod;
	private String shippingAddress;
	private String deliveryMethod;
	private String placementLocation;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getPlacementLocation() {
		return placementLocation;
	}
	public void setPlacementLocation(String placementLocation) {
		this.placementLocation = placementLocation;
	}
	
	
}
