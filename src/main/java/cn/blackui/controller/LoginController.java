package cn.blackui.controller;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.blackui.pojo.Customer;
import cn.blackui.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;


@Controller
public class LoginController {
	@Autowired
	CustomerService customerService;



	@RequestMapping("/Login")
	public String login() {
		return "loginandregist";
	}

	
	@RequestMapping(value = "/LoginController")
	public void login(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String message = "";
		String validate = request.getParameter("validate");
		String truevalidate = request.getParameter("truevalidate");
		System.out.println(username+password+"*************************************");
		Customer customer = customerService.findOneCustomer(username, password);
		if (customer!=null && validate.equals(truevalidate)){
			request.getSession().setAttribute("customer",customer);
			request.getRequestDispatcher("listBook").forward(request, response);
		}else{
			request.getRequestDispatcher("/").forward(request, response);
		}
	}


		@RequestMapping("/admin/login")
		public  String adminlogin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Customer customer = customerService.findAdminCustomer(username,password,1);
			if (customer!=null ){
				request.getSession().setAttribute("managerFlag",customer);
				return "manager/index";
			}else{
				return "manager/login";
			}
	}}









//		//md5加密转换
//		Customer customer = customerService.findOneCustomer(username, DigestUtils.md5DigestAsHex(password.getBytes()));
//		if(!username.equals("") && !password.equals("") && !validate.equals("")) {
//			if(validate.equalsIgnoreCase(truevalidate)) {
//				if(customer != null && !customer.getStatus())
//				{
//
//					if(customerService.updateCustomerStatus(customer, true))
//					{
//						Integer characterid = customer.getCharacterid();
//						String character = customerService.findCustomerCharacter(characterid);
//						if("user".equals(character)){
//
//							session.setAttribute("customer.id",customer.getId());
//							session.setAttribute("customer",customer);
//							response.sendRedirect(request.getContextPath()+"/listBook");
//							return;
//						}
//						else if("manager".equals(character)){
//							session.setAttribute("customer.id",customer.getId());
//							session.setAttribute("customer",customer);
//							session.setAttribute("managerFlag", "true");
//
//							response.sendRedirect(request.getContextPath()+"/admin");
//							return;
//						}
//					}
//					else
//					{
//						message = "false";
//						request.setAttribute("message", message);
//					}
//				}
//				else if(customer != null) {
//					message = "online";
//					request.setAttribute("message", message);
//				}
//				else {
//					message = "no";
//					request.setAttribute("message", message);
//				}
//			}
//			else {
//				message = "validateerror";
//				request.setAttribute("message", message);
//			}
//		}
//		else {
//			message = "paranull";
//			request.setAttribute("message", message);
//		}
//		request.getRequestDispatcher("listBook").forward(request, response);
//	}




