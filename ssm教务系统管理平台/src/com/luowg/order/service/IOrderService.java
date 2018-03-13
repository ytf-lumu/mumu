package com.luowg.order.service;

import com.luowg.order.po.Orders;
import com.luowg.order.po.User;

public interface IOrderService {
	/**
	 * 根据id获取用户
	 */
	public Orders findOrderById(int uid)throws Exception;
	public void updateOrder(Orders u);
	public void save(Orders u);
	public Orders getById(Integer id);
}
