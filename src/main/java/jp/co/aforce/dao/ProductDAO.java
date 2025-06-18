package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jp.co.aforce.beans.Product;

public class ProductDAO extends DAO {

	public List<Product> getAllProducts() throws Exception {
		List<Product> products = new ArrayList<>();

		Connection con = getConnection();

		String sql = "SELECT * FROM products ORDER BY product_id";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			Product product = new Product(
					rs.getInt("product_id"),
					rs.getString("name"),
					rs.getString("artist_name"),
					rs.getString("genre"),
					rs.getInt("price"),
					rs.getInt("stock"),
					rs.getDate("release_date"),
					rs.getString("description"),
					rs.getString("sample_url"),
					rs.getString("image_path"),
					rs.getTimestamp("created_at"),
					rs.getTimestamp("updated_at")

			);

			products.add(product);
		}

		rs.close();
		st.close();
		con.close();

		return products;
	}

	public List<Product> searchByKeyword(String keyword) throws Exception {
		List<Product> list = new ArrayList<>();

		Connection con = getConnection();

		// 商品名またはアーティスト名にキーワードが含まれるものを検索
		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM products WHERE name LIKE ? OR artist_name LIKE ?");
		st.setString(1, "%" + keyword + "%");
		st.setString(2, "%" + keyword + "%");

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			int productId = rs.getInt("product_id");
			String name = rs.getString("name");
			String artistName = rs.getString("artist_name");
			String genre = rs.getString("genre");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			Date releaseDate = rs.getDate("release_date");
			String description = rs.getString("description");
			String sampleUrl = rs.getString("sample_url");
			String imagePath = rs.getString("image_path");
			Date createdAt = rs.getTimestamp("created_at");
			Date updatedAt = rs.getTimestamp("updated_at");
			Product product = new Product(
					productId, name, artistName, genre, price, stock,
					releaseDate, description, sampleUrl, imagePath,
					createdAt, updatedAt);
			list.add(product);
		}

		st.close();
		con.close();

		return list;
	}
}
