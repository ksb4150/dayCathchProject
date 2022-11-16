package com.springboot.order.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("orderPageVO")

public class OrderPageVO {

	private List<OrderPageGoodsVO> orders;
	
public List<OrderPageGoodsVO> getOrders() {
	return orders;
}

public void setOrders(List<OrderPageGoodsVO> orders) {
	this.orders = orders;
}
	
@Override
public String toString() {
	return "OrderPageVO [orders=" + orders + "]";
}

}
