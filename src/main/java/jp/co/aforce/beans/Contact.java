package jp.co.aforce.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Contact implements Serializable{
	private int contactId;
	private String memberId;
	private String name;
	private String email;
	private String subject;
	private String message;
	private Timestamp submittedAt;
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getSubmittedAt() {
		return submittedAt;
	}
	public void setSubmittedAt(Timestamp submittedAt) {
		this.submittedAt = submittedAt;
	}
	
}
