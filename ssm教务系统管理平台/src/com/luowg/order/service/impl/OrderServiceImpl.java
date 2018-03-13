package com.luowg.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.order.mapper.OrderMapper;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;
import com.luowg.order.service.IOrderService;
@Service(value="orderService")
public class OrderServiceImpl implements IOrderService{
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public void updateOrder(Orders u) {
		try {
			Orders s = orderMapper.findOrdersById(u.getId());
			if(s!=null)
				orderMapper.updateOrders(u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public Orders findOrderById(int uid) throws Exception {
		return orderMapper.findOrdersById(uid);
	}

	@Override
	public Orders getById(Integer id) {
		try {
			return orderMapper.findOrdersById(id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void save(Orders u) {
		try {
			orderMapper.save(u);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
