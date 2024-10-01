/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.dao.impl;

import cc.altius.powerpack.dao.UserDao;
import cc.altius.powerpack.model.User;
import cc.altius.powerpack.model.rowmapper.UserRowMapper;
import cc.altius.utils.PassPhrase;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author altius
 */
@Repository
public class UserDaoImpl implements UserDao {

    private DataSource dataSource;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private JdbcTemplate jdbcTemplate;

    private final String userSql = "select u1.* from (select u.USER_ID,u.NAME,u.USERNAME,u.PASSWORD,u.ACTIVE,r.ROLE_ID,r.ROLE_DESC, GROUP_CONCAT(rbf.BUSINESS_FUNCTION_ID) 'BUSINESS_FUNCTION_IDS' from us_user u "
            + "left join us_role r on u.ROLE_ID=r.ROLE_ID "
            + "left join us_role_business_function rbf on r.ROLE_ID=rbf.ROLE_ID "
            + "group by u.USER_ID) as u1 where true ";

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public List<User> getUserList() {
        return this.jdbcTemplate.query(userSql, new UserRowMapper());
    }

    @Override
    @Transactional
    public int addUser(User user) {
        SimpleJdbcInsert se = new SimpleJdbcInsert(dataSource).withTableName("us_user").usingGeneratedKeyColumns("USER_ID");
        Map<String, Object> params = new HashMap<>();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        params.put("NAME", user.getName());
        params.put("USERNAME", user.getUsername());
        String password = PassPhrase.getPassword(8);
        System.out.println("----------------------------");
        System.out.println("password--------> " + password);
        System.out.println("----------------------------");
        params.put("PASSWORD", encoder.encode(password));
        params.put("ROLE_ID", user.getRole().getId());
        params.put("ACTIVE", true);
        int userId = se.executeAndReturnKey(params).intValue();
        return userId;
    }

    @Override
    public User getUserByUserId(int userId) {
        String sqlQuery = userSql + "and u1.USER_ID=:userId";
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        return this.namedParameterJdbcTemplate.queryForObject(sqlQuery, param, new UserRowMapper());
    }

    @Override
    @Transactional
    public int editUser(User user) {
        System.out.println(user.getRole());
        String sqlQuery = "update us_user set NAME=:name,USERNAME=:username,ACTIVE=:active, ROLE_ID=:role WHERE USER_ID=:userId";
        Map<String, Object> params = new HashMap<>();
        params.put("name", user.getName());
        params.put("username", user.getUsername());
        params.put("active", user.isActive());
        params.put("role", user.getRole().getId());
        params.put("userId", user.getUserId());
        int rowsUpdated = this.namedParameterJdbcTemplate.update(sqlQuery, params);
        return rowsUpdated;
    }

    @Override
    public User loadUserByUsername(String username) {
        String sqlQuery = userSql + "and u1.USERNAME=:username";
        Map<String, Object> param = new HashMap<>();
        param.put("username", username);
        return this.namedParameterJdbcTemplate.queryForObject(sqlQuery, param, new UserRowMapper());
    }

    @Override
    public boolean checkUsernameAvailability(String username) {
        String sqlQuery = "select USERNAME from us_user where USERNAME=:username";
        Map<String, Object> param = new HashMap<>();
        param.put("username", username);
        try {
            String uName = this.namedParameterJdbcTemplate.queryForObject(sqlQuery, param, String.class);
            return !(uName.equals(username));
        } catch (Exception e) {
            return true;
        }
    }

}
