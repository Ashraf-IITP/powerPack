/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.model.rowmapper;

import cc.altius.powerpack.model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author altius
 */
public class OrderRowMapper implements RowMapper<Order>{

    @Override
    public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Order(rs.getInt("ORDER_ID"), rs.getString("PPK_CODE"),rs.getString("ORDER_CREATION_TIME"),rs.getInt("USER_ID"),rs.getString("STATUS_ID"));
    }
}
