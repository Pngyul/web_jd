package com.pngyul.domain;

public class User {
	String uid;
	String username;
	String password;
	String mobilenum;
	String email;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", mobilenum=" + mobilenum + ", email=" + email
				+ "]";
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobilenum() {
		return mobilenum;
	}
	public void setMobilenum(String mobilenum) {
		this.mobilenum = mobilenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
