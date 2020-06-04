package cn.blackui.dao;



import java.util.List;

import cn.blackui.pojo.OrderItem;
import cn.blackui.pojo.Orders;
import org.apache.ibatis.annotations.Param;



public interface OrderMapper {

	public void insertOrder(Orders order);

	public Integer findIdByOrdername(String ordername);

	public void insertOrderItem(OrderItem orderItem);

	public List<Orders> findOrderByCustomeiId(Integer customerid);
	
	public void updateOrderStatusById(@Param("id") Integer id, @Param("status") Integer status);

}
