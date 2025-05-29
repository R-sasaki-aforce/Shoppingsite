package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.User;



public class UserDao extends DAO {

	//
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
			String address =rs.getString("ADDRESS");
			String mail_address =rs.getString("MAIL_ADDRESS");
			User user = new User(member_id,password,last_name,first_name,address,mail_address);
			userslist.add(user);
		}

		st.close();
		con.close();
		return userslist;
	}

	public String iDlinkNAME (String memberID)throws Exception {
		Connection con = getConnection();
		String sql = "SELECT LAST_NAME, FIRST_NAME FROM users WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,memberID);
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
}
