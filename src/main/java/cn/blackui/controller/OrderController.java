package cn.blackui.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.blackui.pojo.*;
import cn.blackui.service.BookService;
import cn.blackui.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;




@Transactional(rollbackFor = Exception.class)
@Controller
public class OrderController {


	@Autowired
	OrderService orderService;

	@Autowired
	BookService bookService;

	//car's balance
	@RequestMapping("/OrderController")
	public String payorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		Car car = (Car)request.getSession().getAttribute("car");
		if(customer !=null) {
			Orders orders = new Orders();
			orders.setCustomerid(customer.getId());
			orders.setMoney(car.getTotalMoney());
			orders.setNum(car.getTotalNum());
			orders.setOrdername(UUID.randomUUID().toString());
			orders.setStatus(0);
			orderService.insertOneOrder(orders);
			Integer orderid=orderService.findOrderIdByOrdername(orders.getOrdername());
			if(orderid!=0){
				List<OrderItem> orderItems = new ArrayList<OrderItem>();
				for(CarItem caritem:car.getCarItems()) {
					OrderItem orderitem = new OrderItem();
					orderitem.setBook(caritem.getBook());
					orderitem.setBookid(caritem.getBookid());
					orderitem.setCustomerid(customer.getId());
					orderitem.setNum(caritem.getNum());
					orderitem.setPrice(caritem.getMoney());
					orderitem.setOrderid(orderid);
					orderItems.add(orderitem);
				}
				for(OrderItem orderItem:orderItems){
					orderService.insertOneOrderItem(orderItem);
				}

				request.getSession().removeAttribute("car");
				request.getSession().removeAttribute("caritemandnum");
				//response.sendRedirect(request.getContextPath()+"/showMyOrder");
				return"redirect:/showMyOrder";
			}
		}
			return "redirect:/Login";
			//request.getRequestDispatcher("/error/404").forward(request, response);
		}


		//错误页面，需要登录去
	@RequestMapping("/error")
		public  String error(){
		return  "/error/404";
		}


	//show order
	@RequestMapping("/showMyOrder")
	public String showOrder(HttpServletRequest request,HttpServletResponse response,Model model) throws ServletException, IOException{
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		if(customer !=null){
			List<Orders> list =  orderService.findOrderIdByCustomerId(customer.getId());
			List<Orders> newlist = new ArrayList<Orders>();
			for(Orders order : list){
				if(order.getStatus()==0||order.getStatus()==1) {
					for(OrderItem orderitem:order.getOrderItems()){
						Book book = new Book();
						book=bookService.getBookById(orderitem.getBookid());
						orderitem.setBook(book);
					}
					newlist.add(order);
				}
			}
			model.addAttribute("orders",newlist);
			return "order";
		}	
		return "order";
	}

	//pay order
	@RequestMapping("/PayOrderController")
	public String PayOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Integer orderid = Integer.valueOf(request.getParameter("orderid"));
		if(orderid != null) {
			orderService.updateStatusById(orderid,1);
		}

		return "redirect:/showMyOrder";
	}
	
	@RequestMapping("DeleteOrders")
	public String deleteItem(HttpServletRequest request , HttpServletResponse response) {
		Integer orderid = Integer.valueOf(request.getParameter("orderid"));
		orderService.updateStatusById(orderid,2);
		return "redirect:/showMyOrder";
	}
}
