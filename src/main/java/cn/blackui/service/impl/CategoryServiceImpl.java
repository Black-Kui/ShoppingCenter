package cn.blackui.service.impl;

import java.util.List;

import cn.blackui.dao.CategoryMapper;
import cn.blackui.pojo.Category;
import cn.blackui.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	public List<Category> findCategoryAll() {

		return categoryMapper.findCategoryAll();
	}


	public void addCategory(Category category) {

		categoryMapper.addCategory(category);
	}


	public void deleteCategory(Integer id) {

		categoryMapper.deleteCategory(id);
	}


	public void updateCategory(Category category) {

		categoryMapper.updateCategory(category);
		
	}


	public Category getCategoryById(Integer id) {

		return categoryMapper.getCategoryById(id);
	}
	

	public List<Category> findCategoryByAll(String all) {
		return categoryMapper.findCategoryByAll(all);
	}
	

	public List<Category> findCategoryByName(String name) {
		return categoryMapper.findCategoryByName(name);
	}
	

	public List<Category> findCategoryByDesc(String desc) {
		return categoryMapper.findCategoryByDesc(desc);
	}
}
