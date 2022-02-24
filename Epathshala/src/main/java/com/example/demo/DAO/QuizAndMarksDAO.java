package com.example.demo.DAO;

import com.example.demo.Model.Courses;
import com.example.demo.Model.Quizes;
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
public class QuizAndMarksDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public Integer get_obtainedMarks(String username, int courseID){
        String sql = "SELECT sum(t.MARKS) from TAKES_EXAM t join QUIZES q on t.QUIZ_ID=q.QUIZ_ID  where s_id=? and COURSE_ID=?";
        return  jdbcTemplate.queryForObject(
                sql,
                new Object[]{username,courseID},
                Integer.class);

    }
    public boolean is_passed_course(String username, int courseID){
        return this.get_obtainedMarks(username, courseID)*2 >= get_fullMarks(courseID);
    }
    public Integer get_fullMarks(int courseID){
        String sql = "SELECT count(*) from QUIZES where COURSE_ID=?";
        return  jdbcTemplate.queryForObject(
                sql,
                new Object[]{courseID},
                Integer.class);
    }
    public void updateMarks(String username,int qID,int marks){
        String sql = "UPDATE TAKES_EXAM SET MARKS = ? WHERE S_ID = ? AND QUIZ_ID = ?";
        jdbcTemplate.update(sql,marks,username,qID);
    }
    public List<Quizes> get_QuizQuesAns(int courseID){
        String sql = "SELECT * FROM QUIZES WHERE COURSE_ID = ? ORDER BY QUIZ_ID ASC";
        /*List<Quizes> quiz_list = jdbcTemplate.query(sql, new Object[]{courseID}, new RowMapper<Quizes>() {
            @Override
            public Quizes mapRow(ResultSet rs, int rowNum) throws SQLException {
                Quizes quiz = new Quizes();
                quiz.setQuiz_id(rs.getInt("QUIZ_ID")); //to update marks later
                quiz.setCourse_id(rs.getInt("COURSE_ID"));
                quiz.setQuiz_ques(rs.getString("QUIZ_QUES"));
                quiz.setOption1(rs.getString("OPTION1"));
                quiz.setOption2(rs.getString("OPTION2"));
                quiz.setOption3(rs.getString("OPTION3"));
                quiz.setOption4(rs.getString("OPTION4"));
                quiz.setQuiz_ans(rs.getString("QUES_ANS"));
                return quiz;
            }
        });
        return quiz_list;*/
        return jdbcTemplate.query(sql, new Object[]{courseID},BeanPropertyRowMapper.newInstance(Quizes.class));
    }
}
