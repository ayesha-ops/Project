package com.example.demo.DAO;

import com.example.demo.Model.Comments;
import com.example.demo.Model.Courses;
import com.example.demo.Model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class StudentProfileDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public Users getUserInfo(String username){
        String sql = "SELECT USER_ID , PASSWORD , FULL_NAME ,TO_CHAR(DATE_OF_BIRTH,'YYYY-MM-DD') DATE_OF_BIRTH,INSTITUTION , EMAIL ,PICTURE FROM USERS WHERE USER_ID = ?";
        Users users = (Users) jdbcTemplate.queryForObject(sql,new Object[]{username},new RowMapper<Users>() {
            @Override
            public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
                Users users1 = new Users();
                users1.setUser_id(rs.getString("user_id"));
                users1.setPassword(rs.getString("password"));
                users1.setInstitution(rs.getString("institution"));
                users1.setFull_name(rs.getString("full_name"));
                users1.setDate_of_birth(rs.getString("date_of_birth"));
                users1.setEmail(rs.getString("email"));
                users1.setPicture(rs.getString("picture"));

                return users1;
            }});
        return users;
    }
    public void setStudent(String userID,String s){

        String sql = "UPDATE Students SET " +
                "S_CLASS = ?" +
                "WHERE S_ID = ?";
        jdbcTemplate.update(sql,s,userID);
    }
    public void editProfile(String userID,String inst,String p, String name,String Pass, String email){

        String sql = "UPDATE Users SET " +
                "FULL_NAME = ? , INSTITUTION = ?," +
                "EMAIL = ?," +
                "PASSWORD = ? ," +
                "PICTURE = ?" +
                "WHERE USER_ID = ?";
        System.out.println(userID+" "+inst+" "+p+" "+name+" "+Pass+" "+email);
        jdbcTemplate.update(sql,name,inst,email,Pass,p,userID);
    }
    public String getUserPic(String username){
        String sql = "SELECT PICTURE FROM USERS WHERE USER_ID = ?";
        return jdbcTemplate.queryForObject(sql,new Object[]{username}, String.class);
    }
}
