package com.pngyul.service.impl;

import com.pngyul.dao.CartItemDao;
import com.pngyul.domain.Product;
import com.pngyul.service.CartItemService;

public class CartItemServiceImpl implements CartItemService {
	private CartItemDao cid;
	@Override
	public Product findProductByPid(String pid) {
		
		return cid.getById(pid);
	}
	public void setCid(CartItemDao cid) {
		this.cid = cid;
	}

	
}
