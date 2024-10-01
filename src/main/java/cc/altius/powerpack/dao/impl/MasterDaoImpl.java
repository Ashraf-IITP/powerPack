/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.dao.impl;

import cc.altius.powerpack.dao.MasterDao;
import cc.altius.powerpack.model.IdAndLabel;
import cc.altius.powerpack.model.rowmapper.IdAndLabelRowMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author altius
 */
@Repository
public class MasterDaoImpl implements MasterDao {

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
    public List<IdAndLabel> getRoleList() {
        return this.jdbcTemplate.query("select r.ROLE_ID AS ID, r.ROLE_DESC AS LABEL FROM us_role r", new IdAndLabelRowMapper());
    }

    @Override
    public List<IdAndLabel> getStatusList() {
        String sqlQuery = "SELECT STATUS_ID AS id, STATUS_DESC AS label FROM ms_status";
        return this.jdbcTemplate.query(sqlQuery, new IdAndLabelRowMapper());
    }
}
