package cn.blackui.service.impl;

import java.util.List;

import cn.blackui.dao.OrderMapper;
import cn.blackui.pojo.OrderItem;
import cn.blackui.pojo.Orders;
import cn.blackui.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Transactional
@Service
public class OrderServiceImpl implements OrderService {

	//insert order by order
	@Autowired
	OrderMapper orderMapper;

	public void insertOneOrder(Orders order) {

		orderMapper.insertOrder(order);
		
	}
	
	//find current order's orderid

	public Integer findOrderIdByOrdername(String ordername) {
		Integer orderid = orderMapper.findIdByOrdername(ordername);
		if(orderid!=0)
			return orderid;
		return 0;
	}

	//insert into orderitem


	public void insertOneOrderItem(OrderItem orderItem) {
		orderMapper.insertOrderItem(orderItem);
		
	}

	//find order by customerid

	public List<Orders> findOrderIdByCustomerId(Integer customerid) {
		List<Orders> list = orderMapper.findOrderByCustomeiId(customerid);
		if(list!=null)
			return list;
		return null;
	}
	

	public void updateStatusById(Integer id,Integer status) {
		orderMapper.updateOrderStatusById(id,status);
		
	}


}
