package cn.blackui.service;


import cn.blackui.pojo.OrderItem;
import cn.blackui.pojo.Orders;

import java.util.List;



public interface OrderService {
	public void insertOneOrder(Orders order);

	public Integer findOrderIdByOrdername(String ordername);
	
	public void insertOneOrderItem(OrderItem orderItem);

	public List<Orders> findOrderIdByCustomerId(Integer customerid);
	
	public void updateStatusById(Integer id, Integer status);
}
