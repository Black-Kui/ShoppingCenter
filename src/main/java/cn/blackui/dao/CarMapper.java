package cn.blackui.dao;

import java.util.List;

import cn.blackui.pojo.CarItem;
import org.apache.ibatis.annotations.Param;




public interface CarMapper {

	public CarItem findCarItemByBookIdandCustomerId(@Param("bookid") Integer bookid, @Param("customerid") Integer customerid);

	public void insertOneCarItem(CarItem caritem);

	public void updateNumandMoney(@Param("id") Integer id, @Param("money") float money, @Param("num") int num);

	public List<CarItem> findCarItemByCustomerId(Integer customerid);

	public void deleteByCustomerId(Integer customerid);

	public void deleteById(Integer id);

}
