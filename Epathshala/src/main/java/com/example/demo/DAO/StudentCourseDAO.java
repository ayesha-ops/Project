package com.example.demo.DAO;

import com.example.demo.Model.Courses;
import com.example.demo.Model.Students;
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
public class StudentCourseDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public Students getStudent(String userID)
    {
        String sql = "SELECT * FROM STUDENTS WHERE s_id = ?";
        Students s = jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Students.class));
        return s;
    }

    public Courses getCourseInfoByID(int ID){
        String sql = "SELECT * FROM COURSES WHERE course_id = ?";
        Courses course = (Courses) jdbcTemplate.queryForObject(
                sql,
                new Object[]{ID},
                BeanPropertyRowMapper.newInstance(Courses.class));

        return course;
    }
    public String getCourseTitle(int courseID){
        String sql = "SELECT TITLE FROM COURSES WHERE course_id = ?";
        String title = jdbcTemplate.queryForObject(
                sql,
                new Object[]{courseID},
                String.class);
        return title;
    }
    public boolean isEnrolled(String userID, int courseID){
        String sql = "SELECT COUNT(*) FROM ENROLLMENT WHERE s_id = ? AND course_id = ?";
        Integer counter =  jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID,courseID},
                Integer.class);
        if(counter != null)
            return counter > 0;
        else return false;
    }
    public boolean isCompleted(String userID,int courseID){//vul
        String sql = "select count(*) from TAKES_EXAM t ,QUIZES q where t.S_ID = ? and t.MARKS > 0 and q.COURSE_ID = ? and t.QUIZ_ID = q.QUIZ_ID";
        Integer counter =  jdbcTemplate.queryForObject(
                sql,
                new Object[]{userID,courseID},
                Integer.class);
        if(counter != null)
            return counter > 0;
        else return false;
    }
    public List<String> getAllSubjects(){
        String sql = "select distinct(SUBJECT) from COURSES";
        return jdbcTemplate.queryForList(
                sql,
                new Object[]{},
                String.class);
    }
    public List<Courses> getCoursesOfSubject(String subject){
        String sql = "select * from COURSES where subject = ?";
        return jdbcTemplate.query(
                sql,
                new Object[]{subject},
                BeanPropertyRowMapper.newInstance(Courses.class));
    }
    public List<Courses> getMyCourse(String userID){
        String sql = "SELECT * FROM COURSES where COURSE_ID IN (SELECT COURSE_ID FROM ENROLLMENT WHERE S_ID=?)";
        return jdbcTemplate.query(
                sql,
                new Object[]{userID},
                BeanPropertyRowMapper.newInstance(Courses.class));
    }
    public List<Courses> getCoursesOfKeyword(String key){
        key = "%"+key.toLowerCase()+"%";
        String sql = "select * from COURSES where LOWER(subject) LIKE ? or LOWER(title) like ?";
        return jdbcTemplate.query(
                sql,
                new Object[]{key,key},
                BeanPropertyRowMapper.newInstance(Courses.class));
    }
    public void enrollCourse(String userID,int courseID){
        jdbcTemplate.update("INSERT INTO ENROLLMENT (S_ID, COURSE_ID) values (?,?)",userID,courseID);
        //trigger takes exam with default mark after every insert will work here
    }
}
