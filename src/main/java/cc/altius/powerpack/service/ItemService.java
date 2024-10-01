/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cc.altius.powerpack.service;

import cc.altius.powerpack.model.Item;
import java.util.List;

/**
 *
 * @author altius
 */
public interface ItemService {
    
    public List<Item> getZeroLevelItemList();

    public List<Item> getNextItemList(int nextLevel);

    public List<Item> getAllItems();

    public int addItem(String fieldName, String code, String desc, String levelA, String levelB);

    public int addItemAtId(String fieldName, String code, String desc, String itemIdA, String itemIdB);
}
