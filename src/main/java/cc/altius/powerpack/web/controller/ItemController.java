/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.web.controller;

import cc.altius.powerpack.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author altius
 */
@Controller
public class ItemController {
    
    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/items.htm", method = RequestMethod.GET)
    public String getAllItems(ModelMap model){
        model.addAttribute("itemList", itemService.getAllItems());
        return "flow";
    }
}
