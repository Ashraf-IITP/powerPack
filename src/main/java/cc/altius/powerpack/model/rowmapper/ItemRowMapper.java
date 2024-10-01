/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.model.rowmapper;

import cc.altius.powerpack.model.Item;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author altius
 */
public class ItemRowMapper implements RowMapper<Item> {

    @Override
    public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Item(
                rs.getInt("ITEM_ID"),
                rs.getInt("LEVEL"),
                rs.getString("CODE"),
                rs.getString("DESCRIPTION"),
                rs.getString("FIELD_NAME"),
                rs.getInt("NEXT_LEVEL")
        );
    }
}
