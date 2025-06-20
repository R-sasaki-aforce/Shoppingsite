package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.Product;

public class ProductDAO extends DAO {
	/**
	 * 全ての商品取得
	 * @return 全ての商品データ
	 * @throws Exception
	 */
	public List<Product> getAllProducts() throws Exception {
		List<Product> products = new ArrayList<>();

		Connection con = getConnection();

		String sql = "SELECT * FROM products ORDER BY product_id";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			Product p = new Product();

			p.setProductId(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setArtistName(rs.getString("artist_name"));
			p.setGenre(rs.getString("genre"));
			p.setPrice(rs.getInt("price"));
			p.setStock(rs.getInt("stock"));
			p.setReleaseDate(rs.getDate("release_date"));
			p.setDescription(rs.getString("description"));
			p.setSampleUrl(rs.getString("sample_url"));
			p.setImagePath(rs.getString("image_path"));
			p.setCreatedAt(rs.getTimestamp("created_at"));
			p.setUpdatedAt(rs.getTimestamp("updated_at"));

			products.add(p);
		}

		rs.close();
		st.close();
		con.close();

		return products;
	}

	/**
	 * 検索にヒットした商品情報取得
	 * @param keyword
	 * @return 
	 * @throws Exception
	 */
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
			Product p = new Product();

			p.setProductId(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setArtistName(rs.getString("artist_name"));
			p.setGenre(rs.getString("genre"));
			p.setPrice(rs.getInt("price"));
			p.setStock(rs.getInt("stock"));
			p.setReleaseDate(rs.getDate("release_date"));
			p.setDescription(rs.getString("description"));
			p.setSampleUrl(rs.getString("sample_url"));
			p.setImagePath(rs.getString("image_path"));
			p.setCreatedAt(rs.getTimestamp("created_at"));
			p.setUpdatedAt(rs.getTimestamp("updated_at"));
			list.add(p);
		}

		st.close();
		con.close();

		return list;
	}

	/**
	 * 商品登録用メソッド
	 * @param p
	 * @return
	 * @throws Exception
	 */
	public int insertProduct(Product p) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO products (name, artist_name, genre, price, stock, release_date, description, sample_url, image_path) "
						+
						"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		st.setString(1, p.getName());
		st.setString(2, p.getArtistName());
		st.setString(3, p.getGenre());
		st.setInt(4, p.getPrice());
		st.setInt(5, p.getStock());

		if (p.getReleaseDate() != null) {
			st.setDate(6, new java.sql.Date(p.getReleaseDate().getTime()));
		} else {
			st.setNull(6, java.sql.Types.DATE);
		}

		st.setString(7, p.getDescription());
		st.setString(8, p.getSampleUrl());
		st.setString(9, p.getImagePath());

		int result = st.executeUpdate();

		st.close();
		con.close();

		return result;
	}

	/**
	 * カートに商品を追加する（cartとcart_itemsの両方に処理）
	 * @param memberId ユーザーのID
	 * @param productId 商品ID
	 * @param quantity 数量
	 * @return 成功したらtrue、失敗したらfalse
	 * @throws Exception
	 */
	public boolean addToCart(String memberId, int productId, int quantity) throws Exception {
		Connection con = getConnection();

		try {
			con.setAutoCommit(false); // トランザクション開始

			int cartId = -1;

			// 1. カートの存在確認
			String findCartSql = "SELECT cart_id FROM cart WHERE member_id = ?";
			try (PreparedStatement ps = con.prepareStatement(findCartSql)) {
				ps.setString(1, memberId);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					cartId = rs.getInt("cart_id");
				}
			}

			// 2. カートが存在しない場合、新規作成
			if (cartId == -1) {
				String insertCartSql = "INSERT INTO cart (member_id) VALUES (?)";
				try (PreparedStatement ps = con.prepareStatement(insertCartSql,
						PreparedStatement.RETURN_GENERATED_KEYS)) {
					ps.setString(1, memberId);
					ps.executeUpdate();
					ResultSet rs = ps.getGeneratedKeys();
					if (rs.next()) {
						cartId = rs.getInt(1);
					}
				}
			}

			// 3. cart_items の確認（すでに同じ商品があるか）
			String checkItemSql = "SELECT quantity FROM cart_items WHERE cart_id = ? AND product_id = ?";
			try (PreparedStatement ps = con.prepareStatement(checkItemSql)) {
				ps.setInt(1, cartId);
				ps.setInt(2, productId);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					// 既に商品あり → 数量加算
					int existingQty = rs.getInt("quantity");
					String updateSql = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND product_id = ?";
					try (PreparedStatement ups = con.prepareStatement(updateSql)) {
						ups.setInt(1, existingQty + quantity);
						ups.setInt(2, cartId);
						ups.setInt(3, productId);
						ups.executeUpdate();
					}
				} else {
					// 新規追加
					String insertItemSql = "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?)";
					try (PreparedStatement ips = con.prepareStatement(insertItemSql)) {
						ips.setInt(1, cartId);
						ips.setInt(2, productId);
						ips.setInt(3, quantity);
						ips.executeUpdate();
					}
				}
			}

			con.commit(); // 成功したらコミット
			return true;

		} catch (Exception e) {
			con.rollback(); // エラー時はロールバック
			e.printStackTrace();
			return false;
		} finally {
			con.setAutoCommit(true);
			con.close();
		}
	}

	/**
	 * cart_items と products を結合して商品情報を取得するメソッド
	 * @param memberId
	 * @return
	 * @throws Exception
	 */
	public List<Product> getCartProducts(String memberId) throws Exception {
		List<Product> cartItems = new ArrayList<>();

		Connection con = getConnection();

		String sql = """
				    SELECT p.*, ci.quantity
				    FROM cart c
				    JOIN cart_items ci ON c.cart_id = ci.cart_id
				    JOIN products p ON ci.product_id = p.product_id
				    WHERE c.member_id = ?
				""";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setArtistName(rs.getString("artist_name"));
			p.setGenre(rs.getString("genre"));
			p.setPrice(rs.getInt("price"));
			p.setStock(rs.getInt("stock"));
			p.setReleaseDate(rs.getDate("release_date"));
			p.setDescription(rs.getString("description"));
			p.setSampleUrl(rs.getString("sample_url"));
			p.setImagePath(rs.getString("image_path"));
			p.setCreatedAt(rs.getTimestamp("created_at"));
			p.setUpdatedAt(rs.getTimestamp("updated_at"));

			// 数量（追加でProductクラスにquantityフィールドが必要）
			p.setQuantity(rs.getInt("quantity"));

			cartItems.add(p);
		}

		rs.close();
		st.close();
		con.close();

		return cartItems;
	}

	/**
	 * カートで数量変更処理を行うメソッド
	 * @param memberId
	 * @param productId
	 * @param quantity
	 * @throws Exception
	 */
	public void updateCartItemQuantity(String memberId, int productId, int quantity) throws Exception {
		Connection con = getConnection();

		String sql = """
				    UPDATE cart_items
				    SET quantity = ?
				    WHERE cart_id = (
				        SELECT cart_id FROM cart WHERE member_id = ?
				    ) AND product_id = ?
				""";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, quantity);
			ps.setString(2, memberId);
			ps.setInt(3, productId);
			ps.executeUpdate();
		}

		con.close();
	}

	public void deleteCartItem(String memberId, int productId) throws Exception {
		Connection con = getConnection();

		String sql = """
				    DELETE FROM cart_items
				    WHERE cart_id = (
				        SELECT cart_id FROM cart WHERE member_id = ?
				    ) AND product_id = ?
				""";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, memberId);
			ps.setInt(2, productId);
			ps.executeUpdate();
		}

		con.close();
	}

	/**
	 * 注文内容をorders,order_itemsテーブルに登録
	 * @param memberId
	 * @param cartItems
	 * @param paymentMethod
	 * @param shippingAddress
	 * @param deliveryMethod
	 * @param placementLocation
	 * @param totalPrice
	 * @throws Exception
	 */
	public void insertOrder(String memberId, List<Product> cartItems, String paymentMethod,
			String shippingAddress, String deliveryMethod, String placementLocation,
			int totalPrice) throws Exception {

		Connection con = getConnection();

		try {
			con.setAutoCommit(false);

			// 1. orders テーブルに挿入
			String insertOrderSql = """
					INSERT INTO orders (member_id, order_date, payment_method, shipping_address,
					                    delivery_method, placement_location, total_price)
					VALUES (?, NOW(), ?, ?, ?, ?, ?)
					""";
			int orderId;
			try (PreparedStatement ps = con.prepareStatement(insertOrderSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
				ps.setString(1, memberId);
				ps.setString(2, paymentMethod);
				ps.setString(3, shippingAddress);
				ps.setString(4, deliveryMethod);
				ps.setString(5, placementLocation);
				ps.setInt(6, totalPrice);

				ps.executeUpdate();

				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					orderId = rs.getInt(1);
				} else {
					throw new Exception("注文IDの取得に失敗しました。");
				}
			}

			// 2. order_items テーブルに挿入
			String insertItemSql = """
					INSERT INTO order_items (order_id, product_id, quantity, price)
					VALUES (?, ?, ?, ?)
					""";
			try (PreparedStatement ps = con.prepareStatement(insertItemSql)) {
				for (Product p : cartItems) {
					ps.setInt(1, orderId);
					ps.setInt(2, p.getProductId());
					ps.setInt(3, p.getQuantity());
					ps.setInt(4, p.getPrice());
					ps.addBatch();
				}
				ps.executeBatch();
			}

			// 3. カートを空にする
			String clearCartSql = """
					DELETE FROM cart_items
					WHERE cart_id = (SELECT cart_id FROM cart WHERE member_id = ?)
					""";
			try (PreparedStatement ps = con.prepareStatement(clearCartSql)) {
				ps.setString(1, memberId);
				ps.executeUpdate();
			}

			con.commit();

		} catch (Exception e) {
			con.rollback();
			throw e;
		} finally {
			con.setAutoCommit(true);
			con.close();
		}
	}

}
