package cn.blackui.dao;

import cn.blackui.pojo.Customer;
import org.apache.ibatis.annotations.Param;



public interface CustomerMapper {
	public Customer findOneCustomer(@Param("username") String username, @Param("password") String password);

	public Customer findAdminCustomer(@Param("username") String username, @Param("password") String password,@Param("status") int status);

	public Boolean updateCustomerStatusById(@Param("id") Integer id, @Param("status") Boolean status);

	public Customer findCustomerById(Integer id);

	public void addOneCustomer(Customer customer);

	public Customer findByUsername(@Param("username") String username);

	public String findCharacter(@Param("id") Integer characterid);
}
