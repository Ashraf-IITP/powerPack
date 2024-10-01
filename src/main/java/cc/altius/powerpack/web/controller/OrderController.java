/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.web.controller;

import cc.altius.powerpack.model.Item;
import cc.altius.powerpack.model.Order;
import cc.altius.powerpack.model.propertyEditor.IdAndLabelPropertyEditor;
import cc.altius.powerpack.service.ItemService;
import cc.altius.powerpack.service.MasterService;
import cc.altius.powerpack.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author altius
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private MasterService masterService;

    @Autowired
    private ItemService itemService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Item.class, new IdAndLabelPropertyEditor());
    }

    @RequestMapping(value = "createOrder.htm", method = RequestMethod.GET)
    public String showCreateOrderPage(ModelMap model) {
        model.addAttribute("itemList", itemService.getZeroLevelItemList());
        model.addAttribute("fieldName", itemService.getZeroLevelItemList().get(0).getFieldName());
        return "createOrder";
    }

    @RequestMapping(value = "placeOrder.htm", method = RequestMethod.POST)
    public String createOrder(@RequestParam(required = true) String ppkCode, ModelMap model) {
        try {
            System.out.println(ppkCode);
            model.addAttribute("rowsUpdated", orderService.createOrder(ppkCode));
            model.addAttribute("orderList", orderService.getOrderListByUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:orders.htm";
    }

    @RequestMapping(value = "orders.htm", method = RequestMethod.GET)
    public String listOrderById(ModelMap model) {
        try {
            model.addAttribute("orderList", orderService.getOrderListByUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "orders";
    }

    @RequestMapping(value = "listOrder.htm", method = RequestMethod.GET)
    public String listOrder(ModelMap model) {
        try {
            model.addAttribute("orderList", orderService.getOrderList());
            model.addAttribute("order", new Order());
            model.addAttribute("statusList", masterService.getStatusList());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listOrder";
    }

    @RequestMapping(value = "changeOrderStatus.htm", method = RequestMethod.POST)
    public String changeOrderStatus(@RequestParam(required = true) int orderId, @RequestParam(required = true) String statusId) {
        try {
            this.orderService.updateOrderStatusByOrderId(orderId, statusId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:listOrder.htm";
    }
}
