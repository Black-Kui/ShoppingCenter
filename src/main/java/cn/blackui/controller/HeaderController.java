package cn.blackui.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Black.kui
 * 这个请求是:直接访问主页的页面路径
 */

@Controller
public class HeaderController {
	
	@RequestMapping("/")
	public void welcomeheader1(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, Model model) throws ServletException, IOException{
		request.getRequestDispatcher("listBook").forward(request, response);

	}
	
}
