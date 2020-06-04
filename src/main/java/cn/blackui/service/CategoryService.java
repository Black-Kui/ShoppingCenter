package cn.blackui.service;

import cn.blackui.pojo.Category;

import java.util.List;


public interface CategoryService {

	/**
	 * ��ѯ���з�����Ϣ
	 * @return ���з�����Ϣ
	 */
	public List<Category> findCategoryAll();
	
	/**
	 * ���������Ϣ
	 * @param category
	 * @return
	 */
	public void addCategory(Category category);
	
	/**
	 * ɾ��������Ϣ
	 * @param id
	 * @return
	 */
	public void deleteCategory(Integer id);
	
	/**
	 * ���·�����Ϣ
	 * @param category ���º��category����
	 */
	public void updateCategory(Category category);
	
	/**
	 * ����id����ָ������
	 * @param id
	 * @return
	 */
	public Category getCategoryById(Integer id);

	public List<Category> findCategoryByAll(String all);

	public List<Category> findCategoryByName(String name);

	public List<Category> findCategoryByDesc(String desc);
}
