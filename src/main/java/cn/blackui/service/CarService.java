package cn.blackui.service;

import cn.blackui.pojo.CarItem;

import java.util.List;



public interface CarService {
	
	public CarItem findCarItemByIdandCustomerId(Integer id, Integer customerid);

	public void insertCarItem(CarItem caritem);
	
	public void updateCarItemNumandMoney(Integer id, float money, int num);
	
	public List<CarItem> findCarItemByCustomerId(Integer customerid);
	
	public void deleteCarItemByCustomerId(Integer customerid);

	public void deleteCarItemById(Integer id);
}
