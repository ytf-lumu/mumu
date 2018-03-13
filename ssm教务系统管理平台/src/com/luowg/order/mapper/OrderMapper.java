package com.luowg.order.mapper;

import com.luowg.order.po.Orders;
import com.luowg.order.po.User;



/**
 * Mapper动态代理方式
 * 
 *	查询缓存
 *		一级缓存：默认开启
 *			Mybatis一级缓存的作用域是同一个SqlSession，在同一个sqlSession中两次执行相同的sql语句，
 *			第一次执行完毕会将数据库中查询的数据写到缓存（内存），第二次会从缓存中获取数据将不再从数据库查询，从而提高查询效率
 *
 *		二级缓存: setting全局参数中配置开启二级缓存
 *			Mybatis二级缓存是多个SqlSession共享的，其作用域是mapper的同一个namespace，
 *			不同的sqlSession两次执行相同namespace下的sql语句且向sql中传递参数也相同即最终执行相同的sql语句，
 *			第一次执行完毕会将数据库中查询的数据写到缓存（内存），第二次会从缓存中获取数据将不再从数据库查询，从而提高查询效率
 *		
 *		
 * @author luowenguan
 *
 */
public interface OrderMapper {
	public Orders findOrdersById(int uid)throws Exception;
	public void updateOrders(Orders orders)throws Exception;
	
	public void save(Orders orders)throws Exception;
	
}
