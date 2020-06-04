package cn.blackui.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.blackui.pojo.Book;
import cn.blackui.pojo.Category;
import cn.blackui.pojo.Page;
import cn.blackui.service.BookService;
import cn.blackui.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;



@Transactional
@Controller

public class BookController {
	
	@Autowired
	private BookService bookService;
	@Autowired
	private CategoryService categoryService;

	
	@RequestMapping("/admin/QueryBookController")
	public String findBookIndex(Integer pageNum, Model model, HttpServletRequest request){
		if (request.getSession().getAttribute("managerFlag") == null) {
			return "manager/login";
		}
		Page page = bookService.findPageBook(pageNum);
		
			
		System.out.println(page);
		model.addAttribute("page", page);
		return "manager/showBooks";
	}
	
	@RequestMapping("/admin/addBook")
	public String addsBookIndex(Model model, HttpServletRequest request){

//		if (request.getSession().getAttribute("managerFlag") == null) {
//			return "login";
//		}
		List<Category> categorys = categoryService.findCategoryAll();
		model.addAttribute("categorys", categorys);
		return "manager/listBook";
	}
	
	@RequestMapping("/admin/AddBookController")
	public String addsBook(HttpServletRequest request, Book book, Integer categoryId, MultipartFile picture_b, MultipartFile picture_w) throws IllegalStateException, IOException{
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		String pictureFile_name =  picture_b.getOriginalFilename();
		if(pictureFile_name == null|| pictureFile_name.equals("")){
	        //have no small picture
	    }else{
	    	String path=request.getSession().getServletContext().getRealPath("/image") ;
			String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
			File uploadPic = new File(path + "/"+newFileName);
			if(!uploadPic.exists()){
				uploadPic.mkdirs();
			}
			picture_b.transferTo(uploadPic);
			book.setImage_b("/image/"+newFileName);	
	    }
		
		String image_w_name =  picture_w.getOriginalFilename();
		if(image_w_name == null|| image_w_name.equals("")){
	        //have no big picture
	    }else{
	    	String path=request.getSession().getServletContext().getRealPath("/image") ;
			String newFileName = UUID.randomUUID().toString()+image_w_name.substring(image_w_name.lastIndexOf("."));
			File uploadPic = new File(path + "/"+newFileName);
			if(!uploadPic.exists()){
				uploadPic.mkdirs();
			}
			picture_w.transferTo(uploadPic);
			book.setImage_w("/image/"+newFileName);	
	    }
		
		book.setCurrprice(book.getPrice() * book.getDiscount() / 10);
		
		Category category = categoryService.getCategoryById(categoryId);
		book.setCategory(category);
		
		bookService.addBook(book);
		return "redirect:addBook";
	}
	
	@RequestMapping("/admin/deleteBook")
	public String deleteBook(Integer bookId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("managerFlag") == null) {
			return "login";
		}
		bookService.deleteBook(bookId);
		return "redirect:QueryBookController?pageNum=1";
	}
	
	@RequestMapping("/admin/updateBookIndex")
	public String updateBookIndex(Integer bookId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		if (session.getAttribute("managerFlag") == null) {
//			return "login";
//		}
		List<Category> categorys = categoryService.findCategoryAll();
		model.addAttribute("categorys", categorys);
		Book book = bookService.getBookById(bookId);
		model.addAttribute("book",book);
		return "manager/updateBook";
	}
	
	@RequestMapping("/admin/updateBook")
	public String updateBook(HttpServletRequest request, Book book, Integer categoryId, MultipartFile picture_b, MultipartFile picture_w) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("managerFlag") == null) {
			return "login";
		}
		String pictureFile_name =  picture_b.getOriginalFilename();
		if(pictureFile_name == null|| pictureFile_name.equals("")){
	        //have no small picture
	    }else{
	    	String path=request.getSession().getServletContext().getRealPath("/image") ;
			String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
			File uploadPic = new File(path + "/"+newFileName);
			if(!uploadPic.exists()){
				uploadPic.mkdirs();
			}
			picture_b.transferTo(uploadPic);
			book.setImage_b("/image/"+newFileName);	
	    }
		String image_w_name =  picture_w.getOriginalFilename();
		if(image_w_name == null|| image_w_name.equals("")){
	        //have no big picture
	    }else{
	    	String path=request.getSession().getServletContext().getRealPath("/image") ;
			String newFileName = UUID.randomUUID().toString()+image_w_name.substring(image_w_name.lastIndexOf("."));
			File uploadPic = new File(path + "/"+newFileName);
			if(!uploadPic.exists()){
				uploadPic.mkdirs();
			}
			picture_w.transferTo(uploadPic);
			book.setImage_w("/image/"+newFileName);	
	    }
		
		book.setCurrprice(book.getPrice() * book.getDiscount() / 10);
		Category category = categoryService.getCategoryById(categoryId);
		book.setCategory(category);		
		bookService.updateBook(book);
		return "redirect:QueryBookController?pageNum=1";
	}
	
	@RequestMapping("/admin/showBookDetail")
	public String showManagerBookDetail(Integer bookId, Model model){
		Book book = bookService.getBookById(bookId);
		model.addAttribute("book", book);
		return "manager/detail";
	}


	//====================user interface=======================================//
	@RequestMapping("/listBook")
	public String showClientIndex(Model model, Integer current) throws ServletException, IOException{
		List<Category> list = categoryService.findCategoryAll();
		if (current == null) {
			current = 1;
		}
		Page page = bookService.findPageBook(current);	
		model.addAttribute("page", page);
		model.addAttribute("categorys", list);
		return "listBook";
	}
	
	@RequestMapping("client/ShowController")
	public String showClient(Integer current, Model model) throws ServletException, IOException{

		List<Category> list = categoryService.findCategoryAll();
		Page page = bookService.findPageBook(current);	
		model.addAttribute("page", page);
		model.addAttribute("categorys", list);
		return "listBook";
	}
	
	@RequestMapping("/CategoryPageController")
	public String getCategoryIndex(Model model, Integer categoryId, Integer current, HttpServletRequest request){

		Page page = bookService.findPageCategory(categoryId,Integer.valueOf(current));
		
		model.addAttribute("page", page);
		//����Ҫ�����з��������Ϣ
		List<Category> categorys = categoryService.findCategoryAll();
		model.addAttribute("categorys", categorys);
		
		return "categoryPage";
	}
	
	@RequestMapping("/search")
	public String searchBook(String relatedField, Integer current, Model model, String field, String manager){
		if (current == null) {
			current = 1;
		}

		if ("all".equals(field)) {
			Page pageAll = bookService.findPageBookByAll(relatedField, current);
			model.addAttribute("page", pageAll);
		} else if ("bookName".equals(field)) {
			Page pageName = bookService.findPageBookByName(relatedField, current);
			model.addAttribute("page", pageName);
		} else if ("bookAuthor".equals(field)) {
			Page pageAuthor = bookService.findPageBookByAuthor(relatedField, current);
			model.addAttribute("page", pageAuthor);
		} else if ("bookDesc".equals(field)) {
			Page pageDesc = bookService.findPageBookByDesc(relatedField, current);
			model.addAttribute("page", pageDesc);
		} else if ("categoryName".equals(field)) {
			Page pageCName = bookService.findPageBookByCName(relatedField, current);
			model.addAttribute("page", pageCName);
		} else if ("categoryDesc".equals(field)) {
			Page pageCDesc = bookService.findPageBookByCDesc(relatedField, current);
			model.addAttribute("page", pageCDesc);
		} else if ("press".equals(field)) {
			Page pagePress = bookService.findPageBookByPress(relatedField, current);
			model.addAttribute("page", pagePress);
		}
		
		
		List<Category> categorys = categoryService.findCategoryAll();
		model.addAttribute("categorys", categorys);
		
		model.addAttribute("relatedField", relatedField);
		model.addAttribute("field", field);
		if(manager != null){
			return "manager/showBooks";
		}
		return "searchPage";
	}
	
	@RequestMapping("/showDetail")
	public String showBookDetail(HttpServletRequest request,HttpServletResponse response,Integer id, Model model){
		HttpSession session = request.getSession();
		Book book = bookService.getBookById(id);
		model.addAttribute("book", book);
		return "desc";
	}
	

}
