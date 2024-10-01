/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cc.altius.powerpack.dao;

import cc.altius.powerpack.model.IdAndLabel;
import cc.altius.powerpack.model.Order;
import java.util.List;

/**
 *
 * @author altius
 */
public interface OrderDao {

    public int createOrder(String ppkCode);

    public List<Order> getOrderList();

    public int updateOrderStatusByOrderId(int orderId, String statusId);

    public List<Order> getOrderListByUserId();

}
