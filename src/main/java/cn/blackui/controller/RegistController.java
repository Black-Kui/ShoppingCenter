package cn.blackui.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.blackui.pojo.Customer;
import cn.blackui.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller
public class RegistController {

	@Autowired
	CustomerService customerService;
	@RequestMapping("/Regist")
	public String regist() {
		return "loginandregist";
	}
	
	@RequestMapping("/RegistController")
	public String Regist(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = null;
		String username = request.getParameter("username");
		Customer customer = customerService.findCustomerByUserName(username);
		if (customer != null) {
			message = "exist";
			request.setAttribute("message", message);
		} else {
			String password = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			System.out.println(password+nickname+"*****************************************");
				Customer customer1 = new Customer();
				customer1.setUsername(username);
				customer1.setPassword(password);
				customer1.setNickname(nickname);
				customer1.setStatus(false);
				customerService.addCustomer(customer1);


}
		return "redirect:/Login";
	}
}


