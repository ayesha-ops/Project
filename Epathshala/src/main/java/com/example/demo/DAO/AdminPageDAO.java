package com.example.demo.DAO;

import com.example.demo.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Component
public class AdminPageDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize() {
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public List<Courses> CourseList() {
        String sql = "SELECT * FROM COURSES";
        List<Courses> courses = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Courses.class));
        return courses;
    }
    public  List<Map<String, Object>>TeacherList() throws EmptyResultDataAccessException {
        String sql = "SELECT U.FULL_NAME AS NAME,T.T_DESIGNATION as D,T.T_ID as ID, T.T_SPECIALITY as S FROM USERS U JOIN Teachers T ON (U.USER_ID=T.T_ID)";
        return jdbcTemplate.queryForList(sql);
    }
    public Admin InfoByAdminID(String userID) {
        String sql = "SELECT * from ADMIN where ADMIN_ID=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Admin.class));
    }
    public  List<Map<String, Object>>StudentsList() throws EmptyResultDataAccessException {
        String sql = "SELECT U.FULL_NAME AS NAME,S.S_ID as ID, S.S_CLASS as S_CLASS FROM USERS U JOIN STUDENTS S ON (U.USER_ID=S.S_ID)";
        return jdbcTemplate.queryForList(sql);
    }

    public  List<Map<String, Object>>SearchStudentbyName(String name) throws EmptyResultDataAccessException {
        String sql = "SELECT U.FULL_NAME AS NAME,S.S_ID as ID, S.S_CLASS as S_CLASS FROM USERS U JOIN STUDENTS S ON (U.USER_ID=S.S_ID) WHERE\n" +
                "    UPPER(U.FULL_NAME) LIKE ? ";
        return jdbcTemplate.queryForList(sql,"%"+name.toUpperCase()+"%");
    }

    public  List<Map<String, Object>>SearchTeacherbyName(String name) throws EmptyResultDataAccessException {
        String sql = "SELECT U.FULL_NAME AS NAME,T.T_ID as ID FROM USERS U JOIN TEACHERS T ON (U.USER_ID=T.T_ID) WHERE\n" +
                "    UPPER(U.FULL_NAME) LIKE ? ";
        return jdbcTemplate.queryForList(sql,"%"+name.toUpperCase()+"%");
    }


    public  List<Map<String, Object>>SearchCoursebyName(String name) throws EmptyResultDataAccessException {
        String sql = "SELECT * FROM COURSES WHERE\n" +
                "    UPPER(TITLE) LIKE ?";
        return jdbcTemplate.queryForList(sql,"%"+name.toUpperCase()+"%");
    }


    public void deleteStudent(String s_id)
    {
        /*String sqlforcomment = "DELETE FROM COMMENTS WHERE User_ID = ?";
        jdbcTemplate.update(sqlforcomment,s_id);
        String sqlfortakesExam = "DELETE FROM TAKES_EXAM WHERE S_ID=?";
        jdbcTemplate.update(sqlfortakesExam,s_id);
        String sqlforNtf = "DELETE FROM NOTIFICATIONS WHERE USER_ID = ?";
        jdbcTemplate.update(sqlforNtf,s_id);
        String sqlforenroll = "DELETE FROM ENROLLMENT WHERE S_ID = ? " ;
        jdbcTemplate.update(sqlforenroll,s_id);*/
        String sqlforstud = "DELETE FROM STUDENTS WHERE S_ID = ?";
        jdbcTemplate.update( sqlforstud,s_id);
        /*String sqlforuser = "DELETE FROM USERS WHERE USER_ID = ? " ;
        jdbcTemplate.update(sqlforuser,s_id);*/
    }

    public Users GetInfoUser(String userID)
    {
        String sql = "SELECT * FROM Users where user_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Users.class));
    }
    public Students GetInfoStudent(String userID)
    {
        String sql = "SELECT * FROM STUDENTS where S_ID=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Students.class));
    }


    public void deleteTeacher(String T_ID) {
        /*String sql = "SELECT * FROM COURSES where T_ID=?";
        List<Courses> courses = jdbcTemplate.query(sql,new Object[]{T_ID},BeanPropertyRowMapper.newInstance(Courses.class));
        for(int i =0;i<courses.size();i++) {
            String sql0 = "DELETE FROM COMMENTS WHERE COURSE_ID = ?";
            jdbcTemplate.update(sql0, courses.get(i).getCourse_id());
            String sql1 = "DELETE FROM TAKES_EXAM WHERE QUIZ_ID IN (SELECT QUIZ_ID FROM QUIZES WHERE COURSE_ID = ?)";
            jdbcTemplate.update(sql1, courses.get(i).getCourse_id());
            String sql2 = "DELETE FROM QUIZES WHERE COURSE_ID = ?";
            jdbcTemplate.update(sql2, courses.get(i).getCourse_id());
            String sql5 = "DELETE FROM ENROLLMENT WHERE COURSE_ID = ? ";
            jdbcTemplate.update(sql5,courses.get(i).getCourse_id());
            String sql3 = "DELETE FROM TOPICS WHERE COURSE_ID = ?";
            jdbcTemplate.update(sql3, courses.get(i).getCourse_id());
            String sql4 = "DELETE FROM COURSES WHERE COURSE_ID = ? ";
            jdbcTemplate.update(sql4, courses.get(i).getCourse_id());
        }
        String sqlforNtf = "DELETE FROM NOTIFICATIONS WHERE USER_ID = ?";
        jdbcTemplate.update(sqlforNtf,T_ID);
        String sqlforcomment = "DELETE FROM COMMENTS WHERE User_ID = ?";
        jdbcTemplate.update(sqlforcomment,T_ID);*/
        String sqlforteacher = "DELETE FROM TEACHERS WHERE T_ID = ?";
        jdbcTemplate.update( sqlforteacher,T_ID);
        /*String sqlforuser = "DELETE FROM USERS WHERE USER_ID = ? " ;
        jdbcTemplate.update(sqlforuser,T_ID);*/
    }


    public void deleteCourse(int course_id) {
        /*String sql0 = "DELETE FROM COMMENTS WHERE COURSE_ID = ?";
        jdbcTemplate.update(sql0, course_id);
        String sql1 = "DELETE FROM TAKES_EXAM WHERE QUIZ_ID IN (SELECT QUIZ_ID FROM QUIZES WHERE COURSE_ID = ?)";
        jdbcTemplate.update(sql1, course_id);
        String sql2 = "DELETE FROM QUIZES WHERE COURSE_ID = ?";
        jdbcTemplate.update(sql2, course_id);
        String sql5 = "DELETE FROM ENROLLMENT WHERE COURSE_ID = ? ";
        jdbcTemplate.update(sql5, course_id);
        String sql3 = "DELETE FROM TOPICS WHERE COURSE_ID = ?";
        jdbcTemplate.update(sql3, course_id);*/
        String sql4 = "DELETE FROM COURSES WHERE COURSE_ID = ? ";
        jdbcTemplate.update(sql4, course_id);
    }
}
