package cn.blackui.service.impl;

import cn.blackui.dao.CustomerMapper;
import cn.blackui.pojo.Customer;
import cn.blackui.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Transactional(rollbackFor = Exception.class)
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	


	public Customer findOneCustomer(String username ,String password) {
		Customer customer = customerMapper.findOneCustomer(username, password);
		if(customer!=null)
			return customer;
		return null;
	}

	public Customer findAdminCustomer(String username, String password, int status) {
		return customerMapper.findAdminCustomer(username,password,status);
	}


	public Boolean updateCustomerStatus(Customer customer,Boolean status) throws Exception{
		if (customerMapper.updateCustomerStatusById(customer.getId(),status) == true) {
			return true;
		}
		return false;
	}
	

	public Customer findCustomer(Integer id) {
		Customer customer = customerMapper.findCustomerById(id);
		if(customer!=null)
			return customer;
		return null;
	}



	public void addCustomer(Customer customer) throws Exception{
		customerMapper.addOneCustomer(customer);
	}



	public Customer findCustomerByUserName(String username) {
		return customerMapper.findByUsername(username);
		
	}



	public String findCustomerCharacter(Integer characterid) {
		return customerMapper.findCharacter(characterid);
	}

}
