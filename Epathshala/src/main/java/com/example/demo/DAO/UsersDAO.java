package com.example.demo.DAO;

import com.example.demo.Model.Courses;
import com.example.demo.Model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

@Component
public class UsersDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public Users getUserInfo(String userID){
        String sql = "SELECT * FROM USERS WHERE user_id = ?";
        return jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID},
                BeanPropertyRowMapper.newInstance(Users.class));
    }

    public boolean isDuplicatedUserID(String user_id){
        String sql = "SELECT count(*) FROM USERS WHERE user_id = ?";
        Integer n = jdbcTemplate.queryForObject(
                sql,
                new Object[]{user_id},Integer.class);
        if(n!=null) {
            return (n == 1);
        }
        return false;
    }

    public void saveUser(Users user){
        String sql = "Insert into users values(?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getUser_id(),user.getPassword(),user.getFull_name(),user.getDate_of_birth(),user.getInstitution(),user.getEmail(),user.getPicture(),user.getEnabled(),user.getAuthority());
        if(user.getAuthority().equals("ROLE_STUDENT")){
            jdbcTemplate.update("Insert into students(s_id) values(?)",user.getUser_id());
        }else if(user.getAuthority().equals("ROLE_TEACHER")){
            jdbcTemplate.update("Insert into teachers(t_id) values(?)",user.getUser_id());
        }
    }

    public Boolean isStudent(String userID){
        String sql = "SELECT count(*) FROM STUDENTS WHERE s_id = ?";
        Integer n = jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID},Integer.class);
        if(n!=null) {
            return (n == 1);
        }
        return false;
    }
    public Boolean isTeacher(String userID){
        String sql = "SELECT count(*) FROM TEACHERS WHERE t_id = ?";
        Integer n = jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID},Integer.class);
        if(n!=null) {
            return (n == 1);
        }
        return false;
    }
    public Boolean isAdmin(String userID){
        String sql = "SELECT count(*) FROM ADMIN WHERE admin_id = ?";
        Integer n = jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID},Integer.class);
        if(n!=null) {
            return (n == 1);
        }
        return false;
    }
}
