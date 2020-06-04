package cn.blackui.service;


import cn.blackui.pojo.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerService {
	public Customer findOneCustomer(String username, String password);


	public Customer findAdminCustomer( String username,  String password, int status);


	public Boolean updateCustomerStatus(Customer customer, Boolean status) throws Exception;
	
	public Customer findCustomer(Integer id);
	
	public void addCustomer(Customer customer) throws Exception;
	
	public Customer findCustomerByUserName(String username);
	
	public String findCustomerCharacter(Integer characterid);

}
