package cn.blackui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.blackui.pojo.Category;
import cn.blackui.service.BookService;
import cn.blackui.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/admin")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	BookService bookService;

	@RequestMapping("/index")
	public String showIndex(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		return "manager/index";
	}

	@RequestMapping("")
	public String toadmin(){
		return "manager/login";
	}



	@RequestMapping("/QueryController")
	public String queryCatalog(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		List<Category> list = categoryService.findCategoryAll();
		model.addAttribute("categorys", list);
		return "manager/listCategory";
	}

	@RequestMapping("/addcategory")
	public String addCategory(Category category, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("managerFlag") == null) {
			return "manager/login";
		}
		categoryService.addCategory(category);
		return "manager/index";
	}

	@RequestMapping("/updateCategoryIndex")
	public String updateCategoryIndex(Integer categoryId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		Category category = categoryService.getCategoryById(categoryId);
		model.addAttribute("category", category);
		return "manager/updateCategory";
	}

	@RequestMapping("/updateCategory")
	public String updateCategory(Category category, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		categoryService.updateCategory(category);
		return "redirect:QueryController";
	}

	@RequestMapping("/deleteCategory")
	public String deleteCategory(Integer categoryId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("managerFlag") == null) {
			return "manager/login3";
		}
		bookService.deleteBookByCategoryId(categoryId);
		categoryService.deleteCategory(categoryId);
		return "redirect:QueryController";
	}

	@RequestMapping("/searchCategory")
	public String findCategory(String relatedField, Model model, String field, HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("managerFlag") == null) {
			return "manager/login3";
		}

		if ("all".equals(field)) {
			List<Category> categorysAll = categoryService.findCategoryByAll(relatedField);
			model.addAttribute("categorys", categorysAll);
		} else if ("categoryName".equals(field)) {
			List<Category> categorysName = categoryService.findCategoryByName(relatedField);
			model.addAttribute("categorys", categorysName);
		} else if ("categoryDesc".equals(field)) {
			List<Category> categorysDesc = categoryService.findCategoryByDesc(relatedField);
			model.addAttribute("categorys", categorysDesc);
		}
		model.addAttribute("relatedField", relatedField);
		model.addAttribute("field", field);
			
		return "manager/listCategory";
	}

	
}
