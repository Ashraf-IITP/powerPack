/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.dao.impl;

import cc.altius.powerpack.dao.ItemDao;
import cc.altius.powerpack.model.Item;
import cc.altius.powerpack.model.rowmapper.ItemRowMapper;
import cc.altius.utils.DateUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author altius
 */
@Repository
public class ItemDaoImpl implements ItemDao {

    private DataSource dataSource;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public List<Item> getZeroLevelItemList() {
        String sqlQuery = "select * from ms_items where LEVEL=0";
        List<Item> items = this.jdbcTemplate.query(sqlQuery, new ItemRowMapper());
        return items;
    }

    @Override
    public List<Item> getNextItemList(int nextLevel) {
        String sqlQuery = "select * from ms_items where LEVEL=:nextLevel";
        Map<String, Integer> params = new HashMap<>();
        params.put("nextLevel", nextLevel);
        List<Item> items = this.namedParameterJdbcTemplate.query(sqlQuery, params, new ItemRowMapper());
        return items;
    }

    @Override
    public List<Item> getAllItems() {
        String sqlQuery = "select * from ms_items order by LEVEL,NEXT_LEVEL";
        return this.jdbcTemplate.query(sqlQuery, new ItemRowMapper());
    }

    @Override
    @Transactional
    public int addItem(String fieldName, String code, String desc, String levelA, String levelB) {
        SimpleJdbcInsert si = new SimpleJdbcInsert(dataSource).withTableName("ms_items").usingGeneratedKeyColumns("ITEM_ID");
        Map<String, Object> params = new HashMap<>();
        params.put("LEVEL", Integer.valueOf(levelA));
        params.put("CODE", code);
        params.put("DESCRIPTION", desc);
        params.put("NEXT_LEVEL", Integer.valueOf(levelB));
        params.put("FIELD_NAME", fieldName);
        int i = si.executeAndReturnKey(params).intValue();
        return i;
    }

    @Override
    @Transactional
    public int addItemAtId(String fieldName, String code, String desc, String itemIdA, String itemIdB) {
        String sqlQuery = "SELECT LEVEL FROM ms_items WHERE ITEM_ID=:id";
        Map<String, Object> param = new HashMap<>();
        param.put("id", Integer.valueOf(itemIdB));
        int itemIdBLevel = this.namedParameterJdbcTemplate.queryForObject(sqlQuery, param, Integer.class);
        System.out.println(itemIdBLevel +"==========================>");
        String updateQuery = "update ms_items set LEVEL=LEVEL+1, NEXT_LEVEL=NEXT_LEVEL+1 WHERE LEVEL>=:level";
        param.clear();
        param.put("level", itemIdBLevel);
        int rowUpdated = this.namedParameterJdbcTemplate.update(updateQuery, param);
        
        SimpleJdbcInsert si = new SimpleJdbcInsert(dataSource).withTableName("ms_items").usingGeneratedKeyColumns("ITEM_ID");
        Map<String, Object> params = new HashMap<>();
        params.put("LEVEL", itemIdBLevel);
        params.put("CODE", code);
        params.put("DESCRIPTION", desc);
        params.put("NEXT_LEVEL", itemIdBLevel+1);
        params.put("FIELD_NAME", fieldName);
        si.executeAndReturnKey(params);
        return 1;
    }

}
