package com.pngyul.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<String,CartItem> cartItems = new HashMap<String,CartItem>();
	private int totalNum;
	private double totalMon;
	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
		
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public double getTotalMon() {
		return totalMon;
	}
	public void setTotalMon(double totalMon) {
		this.totalMon = totalMon;
	}
	
}
