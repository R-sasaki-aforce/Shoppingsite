package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

}
