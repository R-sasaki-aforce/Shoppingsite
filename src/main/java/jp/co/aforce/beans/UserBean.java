package jp.co.aforce.beans;

import java.io.Serializable;

//更新用のBeanクラス

public class UserBean implements Serializable{
	private String last_name2;
	private String first_name2;
	private String address2;
	private String mail_address2;
	
	public UserBean(String last_name2, String first_name2, String address2, String mail_address2) {
		super();
		this.last_name2 = last_name2;
		this.first_name2 = first_name2;
		this.address2 = address2;
		this.mail_address2 = mail_address2;
	}

	public String getLast_name2() {
		return last_name2;
	}

	public void setLast_name2(String last_name2) {
		this.last_name2 = last_name2;
	}

	public String getFirst_name2() {
		return first_name2;
	}

	public void setFirst_name2(String first_name2) {
		this.first_name2 = first_name2;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getMail_address2() {
		return mail_address2;
	}

	public void setMail_address2(String mail_address2) {
		this.mail_address2 = mail_address2;
	}
	
	
	
	
}
