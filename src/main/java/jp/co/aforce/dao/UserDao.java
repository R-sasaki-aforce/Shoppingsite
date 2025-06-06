package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.User;
import jp.co.aforce.beans.UserBean;

public class UserDao extends DAO {

	/**
	 * 
	 * @return  userテーブルの全てのカラムのデータを取得
	 * @throws Exception
	 */
	public List<User> getAllusers() throws Exception {
		List<User> userslist = new ArrayList<>();
		Connection con = getConnection();
		String sql = "SELECT * from users";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String member_id = rs.getString("MEMBER_ID");
			String password = rs.getString("PASSWORD");
			String last_name = rs.getString("LAST_NAME");
			String first_name = rs.getString("FIRST_NAME");
			String address = rs.getString("ADDRESS");
			String mail_address = rs.getString("MAIL_ADDRESS");
			User user = new User(member_id, password, last_name, first_name, address, mail_address);
			userslist.add(user);

			//userslist.add(new User(member_id,password,last_name,first_name,address,mail_address));

		}

		st.close();
		con.close();
		return userslist;
	}

	/**
	 * 
	 * @param memberID  ユーザーID
	 * @return 　ユーザーIDと同じ行にある名前を取得
	 * @throws Exception
	 */
	public String iDlinkNAME(String memberID) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT LAST_NAME, FIRST_NAME FROM users WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberID);
		ResultSet rs = st.executeQuery();
		String fullName = null;

		if (rs.next()) {
			String lastName = rs.getString("LAST_NAME");
			String firstName = rs.getString("FIRST_NAME");
			fullName = lastName + firstName; // 
		}
		rs.close();
		st.close();
		con.close();
		return fullName;
	}

	/**
	 * 情報をuserテーブルに登録
	 * @param user 入力してもらったユーザーの情報
	 * @throws Exception
	 */
	public void userInfoAdd(User user) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO users (member_id, password, last_name, first_name, address, mail_address) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getMember_id());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getLast_name());
		pstmt.setString(4, user.getFirst_name());
		pstmt.setString(5, user.getAddress());
		pstmt.setString(6, user.getMail_address());

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	}

	/**
	 * 入力してもらったIDとがデータベース上に登録されているものと同じものがあるか確認するメソッド
	 * 同じIDがあればcountが増える
	 * @param memberId
	 * @return
	 * @throws Exception
	 */
	public boolean isDuplicateId(String memberId) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT COUNT(*) FROM users WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberId);
		ResultSet rs = st.executeQuery();
		rs.next();
		int count = rs.getInt(1);

		rs.close();
		st.close();
		con.close();
		//boolean 型のメソッドのためboolean型でリターンする
		return count > 0;
	}

	/**
	 * 修正した情報をアップデートするメソッド
	 * @param user　修正中の情報
	 * @param user2　ログイン中の情報
	 * @throws Exception　
	 */
	public void updateUserInfo(UserBean user, User user2) throws Exception {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = getConnection();

			String sql = "UPDATE users SET LAST_NAME = ?, FIRST_NAME = ?, ADDRESS = ?, MAIL_ADDRESS = ? WHERE MEMBER_ID = ?";
			st = con.prepareStatement(sql);
			st.setString(1, user.getLast_name2());
			st.setString(2, user.getFirst_name2());
			st.setString(3, user.getAddress2());
			st.setString(4, user.getMail_address2());
			st.setString(5, user2.getMember_id()); // MEMBER_IDで更新対象を特定

			//int result = 
			st.executeUpdate();
			//return result > 0;

		} finally {
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		}

	}

	/**
	 * 会員情報を消すメソッド
	 * 
	 * @param user ログインするときなどの会員情報をいれるクラス
	 * @throws Exception
	 */
	public void deleteUser(User user) throws Exception {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = getConnection();
			String sql = "DELETE FROM users WHERE MEMBER_ID = ?";
			st = con.prepareStatement(sql);
			st.setString(1, user.getMember_id());

			//int result = 
			st.executeUpdate();
			//return result > 0;
		} finally {
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		}
	}
/**
 * 編集したあとになどに使う
 * 
 * ユーザーの情報を取得する
 * 
 * @param memberId ログインしているユーザーのID
 * @return ユーザーの情報
 * @throws Exception
 */
	public User findById(String memberId) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM users WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberId);
		ResultSet rs = st.executeQuery();

		User user = null;

		if (rs.next()) {
			String member_id = rs.getString("MEMBER_ID");
			String password=rs.getString("PASSWORD");
			String lastname= rs.getString("LAST_NAME");
			String firstname=rs.getString("FIRST_NAME");
			String address=rs.getString("ADDRESS");
			String mail=rs.getString("MAIL_ADDRESS");
			user = new User(member_id,password,lastname,firstname,address,mail);

		}

		rs.close();
		st.close();
		con.close();

		return user;
	}
}
