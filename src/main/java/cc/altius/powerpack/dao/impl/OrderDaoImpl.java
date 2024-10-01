/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.dao.impl;

import cc.altius.powerpack.dao.OrderDao;
import cc.altius.powerpack.model.Order;
import cc.altius.powerpack.model.User;
import cc.altius.powerpack.model.rowmapper.OrderRowMapper;
import cc.altius.utils.DateUtils;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author altius
 */
@Repository
public class OrderDaoImpl implements OrderDao {

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
    @Transactional
    public int createOrder(String ppkCode) {
        SimpleJdbcInsert si = new SimpleJdbcInsert(dataSource).withTableName("ms_order").usingGeneratedKeyColumns("ORDER_ID");
        User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Date curDate = DateUtils.getCurrentDateObject(DateUtils.IST);
        Map<String, Object> params = new HashMap<>();
        params.put("PPK_CODE", ppkCode);
        params.put("ORDER_CREATION_TIME", DateUtils.getCurrentDateObject(DateUtils.IST));
        params.put("USER_ID", curUser.getUserId());
        params.put("STATUS_ID", "Placed");
        return si.executeAndReturnKey(params).intValue();
    }

    @Override
    public List<Order> getOrderList() {
        String sqlQuery = "SELECT * FROM ms_order";
        return this.jdbcTemplate.query(sqlQuery, new OrderRowMapper());
    }

    @Override
    public int updateOrderStatusByOrderId(int orderId, String statusId) {
        String sqlQuery = "UPDATE ms_order set STATUS_ID=:statusId where ORDER_ID=:orderId";
        Map<String, Object> params = new HashMap<>();
        params.put("orderId", orderId);
        params.put("statusId", statusId);
        return this.namedParameterJdbcTemplate.update(sqlQuery, params);
    }

    @Override
    public List<Order> getOrderListByUserId() {
        User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String sqlQuery = "select * from ms_order where USER_ID=:userId";
        Map<String, Object> params = new HashMap<>();
        params.put("userId", curUser.getUserId());
        return this.namedParameterJdbcTemplate.query(sqlQuery, params, new OrderRowMapper());
    }

}
