package com.pngyul.service;

import com.pngyul.domain.Order;

public interface OrderService {

	void saveOrder(Order o);

	void updateOrderState(Order o);



}
