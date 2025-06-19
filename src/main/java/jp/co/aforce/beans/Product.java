package jp.co.aforce.beans;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable{
	
	private int productId;
	private String name;
	private String artistName;
	private String genre;
	private int price;
	private int stock;
	private Date releaseDate;
	private String description;
	private String sampleUrl;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	
	private int quantity;
	
	/**
	 * 
	 * @param productId  主キー
	 * @param name  商品名
	 * @param artistName  アーティスト名
	 * @param genre  音楽ジャンル
	 * @param price  価格
	 * @param stock  在庫数
	 * @param releaseDate  発売日
	 * @param description  説明文
	 * @param sampleUrl  視聴リンク
	 * @param imagePath  商品画像のパス
	 * @param createdAt  登録日時
	 * @param updatedAt  更新日時
	 */
	
	



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public String getGenre() {
		return genre;
	}



	public void setGenre(String genre) {
		this.genre = genre;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getStock() {
		return stock;
	}



	public void setStock(int stock) {
		this.stock = stock;
	}



	public Date getReleaseDate() {
		return releaseDate;
	}



	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getSampleUrl() {
		return sampleUrl;
	}



	public void setSampleUrl(String sampleUrl) {
		this.sampleUrl = sampleUrl;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagepath) {
		this.imagePath = imagepath;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	
	
	
	
}
