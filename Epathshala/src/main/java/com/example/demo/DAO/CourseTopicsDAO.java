package com.example.demo.DAO;

import com.example.demo.Model.Courses;
import com.example.demo.Model.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.List;

@Component
public class CourseTopicsDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public List<Topics> getTopicsByCourseID(int ID){
        String sql = "SELECT * FROM TOPICS WHERE course_id = ? ORDER BY TOPIC_ID";
        return (List<Topics>) jdbcTemplate.query(
                sql,
                new Object[]{ID},
                BeanPropertyRowMapper.newInstance(Topics.class));
    }
    public String getCoursePic(int CourseID){
        System.out.println("get Pic of Course Id : "+CourseID);
        String sql = "SELECT COURSE_PIC FROM COURSES WHERE COURSE_ID = ?";
        return jdbcTemplate.queryForObject(sql,new Object[]{CourseID}, String.class);
    }
    public Integer getForumIdOfCourse(int courseID){

            String sql = "SELECT FORUM_ID FROM COMMENTS WHERE COURSE_ID = ? GROUP BY FORUM_ID, COURSE_ID";
            return jdbcTemplate.queryForObject(
                    sql,
                    new Object[]{courseID},
                    Integer.class);

    }
}
