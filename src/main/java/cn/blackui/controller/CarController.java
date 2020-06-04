package cn.blackui.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.blackui.pojo.Book;
import cn.blackui.pojo.Car;
import cn.blackui.pojo.CarItem;
import cn.blackui.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class CarController {

	@Autowired
	BookService bookService;
	
	
	//enter car
	@RequestMapping("/showMyCar")
	public String showCar(HttpServletRequest request,HttpServletResponse response ,Model model) throws ServletException, IOException{
		Integer customerid = (Integer)request.getSession().getAttribute("customer.id");
		HttpSession session = request.getSession();
		HashMap<Integer,Integer> caritemandnum = new HashMap<Integer, Integer>();
		if(session.getAttribute("caritemandnum")!=null)
				caritemandnum = (HashMap<Integer,Integer>) session.getAttribute("caritemandnum");
		List<CarItem> list = new ArrayList<CarItem>();
		Car car = new Car();
		if(caritemandnum!=null) {
			for(Integer bookid:caritemandnum.keySet()) {
				Book book = bookService.getBookById(bookid);
				CarItem carItemnew = new CarItem();
				carItemnew.setId(bookid);
				carItemnew.setBook(book);
				carItemnew.setBookid(bookid);
				carItemnew.setCustomerid(customerid);
				carItemnew.setMoney(book.getCurrprice()*caritemandnum.get(bookid));
				carItemnew.setNum(caritemandnum.get(bookid));
				list.add(carItemnew);
			}
			car.setCarItems(list);
		}


		request.getSession().setAttribute("car", car);
		request.getSession().setAttribute("customer.id", customerid);
		return "showCar";
	}
	
	//add into car
	@RequestMapping("/BuyController")
	public void addCar(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		Integer bookid = Integer.valueOf(request.getParameter("bookId"));
		Integer customerid = (Integer) request.getSession().getAttribute("customer.id");
		Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		HttpSession session = request.getSession();
		HashMap<Integer,Integer> caritemandnum = new HashMap<Integer, Integer>();
		String message = (String)request.getSession().getAttribute("message");
		if(session.getAttribute("caritemandnum")!=null)
			 caritemandnum = (HashMap<Integer,Integer>) session.getAttribute("caritemandnum");
		
		if(caritemandnum==null) {
			caritemandnum.put(bookid, quantity);
			session.setAttribute("caritemandnum", caritemandnum);
		}
		else if(caritemandnum!=null&&caritemandnum.size()<5) {
			if(caritemandnum.containsKey(bookid)) {
				caritemandnum.put(bookid, caritemandnum.get(bookid)+quantity);
			}
			else
				caritemandnum.put(bookid, quantity);
			session.setAttribute("caritemandnum", caritemandnum);
		}
		else {
			if(caritemandnum.containsKey(bookid)) {
				caritemandnum.put(bookid, caritemandnum.get(bookid)+quantity);
			}
			else {
				message = "overnum";
				request.setAttribute("message", message);
				request.getRequestDispatcher("showDetail?id="+bookid).forward(request, response);
				return;
			}
		}
		/*
		request.getRequestDispatcher("listBook").forward(request, response);
		return;
		*/


		response.sendRedirect(request.getContextPath()+"/listBook");
		return;
	}
	
	@RequestMapping("DeleteCarItem")
	public String deleteItem(HttpServletRequest request , HttpServletResponse response) {
		/*
		Integer caritemid = Integer.valueOf(request.getParameter("caritemid"));
		if(caritemid!=null) {
			carService.deleteCarItemById(caritemid);
		}
		
		return "redirect:/showCar";
		*/
		HttpSession session = request.getSession();
		HashMap<Integer,Integer> caritemandnum = (HashMap<Integer,Integer>) session.getAttribute("caritemandnum");
		Integer caritemid = Integer.valueOf(request.getParameter("caritemid"));
		caritemandnum.remove(caritemid);
		return "redirect:/showMyCar";
	}
	
}
