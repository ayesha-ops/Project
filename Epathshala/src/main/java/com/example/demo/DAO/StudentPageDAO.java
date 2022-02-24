package com.example.demo.DAO;

import com.example.demo.Model.Courses;
import com.example.demo.Model.MODEL_FOR_INPROGRESS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Component
public class StudentPageDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }
    public  List<Map<String, Object>>SearchCoursebyName(String name) throws EmptyResultDataAccessException {
        String sql = "SELECT * FROM COURSES WHERE\n" +
                "    UPPER(TITLE) LIKE ?";
        return jdbcTemplate.queryForList(sql,name.toUpperCase().concat("%"));
    }

    public List<Courses> PopularCourseList(){//enroll kora student beshi
        String sql = "SELECT C.COURSE_ID FROM COURSES C JOIN ENROLLMENT E ON(E.COURSE_ID=C.COURSE_ID) GROUP BY C.COURSE_ID ORDER BY COUNT(*) DESC";
        List<Integer> c_id=jdbcTemplate.queryForList(sql,new Object[]{},Integer.class);
        String sql2="SELECT * FROM COURSES WHERE COURSE_ID = ?";
        List<Courses> coursesList = new LinkedList<Courses>();
        for(Integer c:c_id){
            Courses courses = jdbcTemplate.queryForObject(
                    sql2,
                    new Object[]{c},
                    BeanPropertyRowMapper.newInstance(Courses.class));
            coursesList.add(courses);
        }
        return coursesList;
    }
    public List<Courses> MostRatedCourseList(){
        String sql = "SELECT * FROM COURSES ORDER BY RATING DESC";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Courses.class));
    }
    public List<Courses> InProgressCourseList(String userID){
        String sql = "SELECT IN_PROGRESS_COURSE_ID,c_title,c_sub,failed_exams FROM ( SELECT q.COURSE_ID in_progress_course_id,count( * ) failed_exams FROM TAKES_EXAM t JOIN QUIZES q ON ( t.QUIZ_ID = q.QUIZ_ID ) WHERE t.S_ID = ? AND t.MARKS <=0 GROUP BY q.COURSE_ID ) relation1 JOIN (SELECT c.COURSE_ID all_course_id, c.TITLE c_title,c.SUBJECT c_sub , count( * ) tot_course_exams FROM COURSES c JOIN QUIZES q2 ON ( c.COURSE_ID = q2.COURSE_ID ) GROUP BY c.COURSE_ID,c.TITLE,c.SUBJECT ) relation2 ON ( relation1.in_progress_course_id = relation2.ALL_COURSE_ID ) WHERE\n" +
                "\tfailed_exams * 2 > tot_course_exams";
            List<Courses> in_progress_course_list = jdbcTemplate.query(sql, new Object[]{userID}, new RowMapper<Courses>() {
            @Override
            public Courses mapRow(ResultSet rs, int rowNum) throws SQLException {
                Courses course = new Courses();
                course.setCourse_id(rs.getInt("in_progress_course_id"));
                course.setTitle(rs.getString("c_title"));
                course.setSubject(rs.getString("c_sub"));
                //System.out.println(course);
                return course;
            }
        });
        List<Courses> progress_list = new LinkedList<>();
        String sql2 = "select COURSE_ID,TITLE,SUBJECT,PUBLISHED_DATE,RATING,COURSE_DURATION,T_ID,COURSE_PIC, COUNT_FAILED_EXAM(?,COURSE_ID) WRONG_ANS , COUNT_TOTAL_EXAM(COURSE_ID) TOT_QUES FROM COURSES";
        List<MODEL_FOR_INPROGRESS> query_list=jdbcTemplate.query(sql2,new Object[]{userID},BeanPropertyRowMapper.newInstance(MODEL_FOR_INPROGRESS.class));
        for(MODEL_FOR_INPROGRESS q:query_list){
            if(q.getWrong_ans()!=null) {
                if(q.getWrong_ans()*2>q.getTot_ques()) {
                    Courses c = new Courses(q.getCourse_id(), q.getTitle(), q.getSubject(), q.getPublished_date(), q.getRating(), q.getCourse_duration(), q.getT_id(), q.getCourse_pic());
                    progress_list.add(c);

                }
            }
        }
        System.out.println(in_progress_course_list);

        return progress_list;

    }
    public List<Courses> CompletedCourseList(String userID){
        String sql = "SELECT PASSED_COURSE_ID,c_title,c_sub FROM ( SELECT q.COURSE_ID passed_course_id,count( * ) passed_exams FROM TAKES_EXAM t JOIN QUIZES q ON ( t.QUIZ_ID = q.QUIZ_ID ) WHERE t.S_ID = ? AND t.MARKS > 0 GROUP BY q.COURSE_ID ) relation1 JOIN (SELECT\tc.COURSE_ID all_course_id, c.TITLE c_title,c.SUBJECT c_sub , count( * ) tot_course_exams FROM\tCOURSES c JOIN QUIZES q2 ON ( c.COURSE_ID = q2.COURSE_ID ) GROUP BY c.COURSE_ID,c.TITLE,c.SUBJECT ) relation2 ON ( relation1.passed_course_id = relation2.ALL_COURSE_ID AND relation1.PASSED_EXAMS*2 >= relation2.TOT_COURSE_EXAMS )";
        List<Courses> completed_course_list = jdbcTemplate.query(sql, new Object[]{userID}, new RowMapper<Courses>() {
            @Override
            public Courses mapRow(ResultSet rs, int rowNum) throws SQLException {
                Courses course = new Courses();
                course.setCourse_id(rs.getInt("passed_course_id"));
                course.setTitle(rs.getString("c_title"));
                course.setSubject(rs.getString("c_sub"));
                //System.out.println(course);
                return course;
            }
        });
        return completed_course_list;
    }
}
