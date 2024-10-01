/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.service.impl;

import cc.altius.powerpack.dao.OrderDao;
import cc.altius.powerpack.model.Order;
import cc.altius.powerpack.service.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author altius
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao;
    
    @Override
    public int createOrder(String ppkCode) {
        return orderDao.createOrder(ppkCode);
    }

    @Override
    public List<Order> getOrderList() {
        return this.orderDao.getOrderList();
    }

    @Override
    public int updateOrderStatusByOrderId(int orderId, String statusId) {
        return this.orderDao.updateOrderStatusByOrderId(orderId, statusId);
    }

    @Override
    public List<Order> getOrderListByUserId() {
        return this.orderDao.getOrderListByUserId();
    }
    
}
