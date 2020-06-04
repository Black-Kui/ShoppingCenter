package cn.blackui.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.blackui.pojo.Customer;
import cn.blackui.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutController {

	@Autowired
	private CustomerService customerService;


	@RequestMapping("/LogoutController")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			HttpSession session = request.getSession();
		request.getSession().removeAttribute("customer");

		response.sendRedirect(request.getContextPath() + "/listbook");
//			Integer id = (Integer) request.getSession().getAttribute("customer.id");
//			Customer customer = customerService.findCustomer(id);
//			String message = null;

//			if(customerService.updateCustomerStatus(customer, false)!=null&&session.getAttribute("managerFlag")==null)
//			{
//				session.setAttribute("customer", null);
//				session.setAttribute("customer.id", null);
//				session.setAttribute("managerFlag", null);
//			}
//			if(customerService.updateCustomerStatus(customer, false)!=null&&session.getAttribute("managerFlag")!=null)
//			{
//				session.setAttribute("customer", null);
//				session.setAttribute("customer.id", null);
//				session.setAttribute("managerFlag", null);
//			}
//			else if(customerService.updateCustomerStatus(customer, false)==null&&session.getAttribute("managerFlag")==null)
//			{
//				message = "logfalse";
//				session.setAttribute("message", message);
//			}
//			else if(customerService.updateCustomerStatus(customer, false)==null&&session.getAttribute("managerFlag")!=null) {
//				message = "logfalse";
//				request.setAttribute("message", message);
//				request.getRequestDispatcher("admin").forward(request, response);
//				return;
//			}
//			response.sendRedirect(request.getContextPath()+"/listBook");
//			return;
	}


	@RequestMapping("/AdminLogoutController")
	public void adminlogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			HttpSession session = request.getSession();
		request.getSession().removeAttribute("managerFlag");

		response.sendRedirect(request.getContextPath() + "/listBook");
	}
}