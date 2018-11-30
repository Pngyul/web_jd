package com.pngyul.service.impl;

import com.pngyul.dao.OrderDao;
import com.pngyul.domain.Order;
import com.pngyul.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao od ;
	@Override
	public void saveOrder(Order o) {
		od.save(o);
	}
	@Override
	public void updateOrderState(Order o) {
		od.update(o);
	}
	public void setOd(OrderDao od) {
		this.od = od;
	}
	
	
}
