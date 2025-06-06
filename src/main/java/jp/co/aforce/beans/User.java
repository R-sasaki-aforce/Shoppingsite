package jp.co.aforce.beans;

import java.io.Serializable;

public class User implements Serializable{
	
	private String member_id;
	private String password;
	private String last_name;
	private String first_name;
	private String address;
	private String mail_address;
	
	/**
	 * @param member_id  ユーザーIDの
	 * @param password   パスワード
	 * @param last_name  名前(姓)
	 * @param first_name 名前(名）
	 * @param address    住所
	 * @param mail_address  メールアドレス
	 */
	
	
	
	public User(String member_id, String password, String last_name, String first_name, String address,
			String mail_address) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.last_name = last_name;
		this.first_name = first_name;
		this.address = address;
		this.mail_address = mail_address;
	}

	

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail_address() {
		return mail_address;
	}

	public void setMail_address(String mail_address) {
		this.mail_address = mail_address;
	}

}
