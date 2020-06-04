package cn.blackui.service.impl;

import java.util.List;

import cn.blackui.dao.CarMapper;
import cn.blackui.pojo.CarItem;
import cn.blackui.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Transactional(rollbackFor = Exception.class)
@Service
public class CarServiceImpl implements CarService {

	@Autowired
	CarMapper carMapper;
	
	//query caritem in caritem

	public CarItem findCarItemByIdandCustomerId(Integer id, Integer customerid) {
		
		return carMapper.findCarItemByBookIdandCustomerId(id,customerid);
	}

	//insert in caritem

	public void insertCarItem(CarItem caritem) {
		carMapper.insertOneCarItem(caritem);
		
	}

	//update caritem's num and money

	public void updateCarItemNumandMoney(Integer id,float money ,int num) {
		
		carMapper.updateNumandMoney(id,money,num);
	}

	//find CarItem By CustomerId

	public List<CarItem> findCarItemByCustomerId(Integer customerid) {
		List<CarItem> list= carMapper.findCarItemByCustomerId(customerid);
		if(list!=null)
			return list;
		return null;
	}

	
	//delete CarItem By CustomerId

	public void deleteCarItemByCustomerId(Integer customerid) {
		carMapper.deleteByCustomerId(customerid);
	}


	public void deleteCarItemById(Integer id) {
		carMapper.deleteById(id);
		
	}


}
