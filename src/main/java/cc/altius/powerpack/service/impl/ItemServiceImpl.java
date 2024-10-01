/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.service.impl;

import cc.altius.powerpack.dao.ItemDao;
import cc.altius.powerpack.model.Item;
import cc.altius.powerpack.service.ItemService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author altius
 */
@Service
public class ItemServiceImpl implements ItemService{

    @Autowired
    private ItemDao itemsDao;
    
    @Override
    public List<Item> getZeroLevelItemList() {
        return itemsDao.getZeroLevelItemList();
    }

    @Override
    public List<Item> getNextItemList(int nextLevel) {
        return itemsDao.getNextItemList(nextLevel);
    }

    @Override
    public List<Item> getAllItems() {
        return itemsDao.getAllItems();
    }

    @Override
    public int addItem(String fieldName, String code, String desc, String levelA, String levelB) {
        return this.itemsDao.addItem(fieldName,code,desc,levelA,levelB);
    }

    @Override
    public int addItemAtId(String fieldName, String code, String desc, String itemIdA, String itemIdB) {
        return this.itemsDao.addItemAtId(fieldName, code, desc, itemIdA, itemIdB);
    }
    
}
