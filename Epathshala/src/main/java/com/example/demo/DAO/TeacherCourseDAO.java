package com.example.demo.DAO;

import com.example.demo.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.security.auth.Subject;
import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

@Component
public class TeacherCourseDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize(){
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }

    public List<Courses> CreatedCourseList(String userID){
        String sql = "SELECT * FROM COURSES where t_id=?";
        List<Courses> courses = jdbcTemplate.query(sql,new Object[]{userID}, BeanPropertyRowMapper.newInstance(Courses.class));
        return jdbcTemplate.query(sql,new Object[]{userID}, BeanPropertyRowMapper.newInstance(Courses.class));
    }

    public List<Map<String,Object>> Statistics(String name) throws EmptyResultDataAccessException
    {
        String sql ="select U.FULL_NAME as NAME,U.EMAIL as EMAIL, C.TITLE as Course,S.S_ID as Student,S.S_CLASS as CLASS " +
                "from USERS U Join STUDENTS S ON (U.USER_ID=S.S_ID) join ENROLLMENT E \n" +
                "ON(E.S_ID=S.S_ID)\n" +
                "JOIN COURSES C ON (C.COURSE_ID=E.COURSE_ID)\n" +
                "WHERE C.T_ID = ?               \n" +
                "ORDER BY U.FULL_NAME";
        return jdbcTemplate.queryForList(sql,new Object[]{name});
    }

    public List<Map<String,Object>> Search(String id,String name) throws EmptyResultDataAccessException
    {
        String sql ="select U.FULL_NAME as NAME,U.EMAIL as EMAIL, C.TITLE as Course,S.S_ID as Student,S.S_CLASS as CLASS " +
                "from USERS U Join STUDENTS S ON (U.USER_ID=S.S_ID) join ENROLLMENT E \n" +
                "ON(E.S_ID=S.S_ID)\n" +
                "JOIN COURSES C ON (C.COURSE_ID=E.COURSE_ID)\n" +
                "WHERE C.T_ID = ?    AND        " +
                "UPPER(U.FULL_NAME) LIKE ?  \n" +
                "ORDER BY U.FULL_NAME";
        return jdbcTemplate.queryForList(sql,id,"%"+name.toUpperCase()+"%");
    }

    public Users GetInfoUser(String userID)
    {
        String sql = "SELECT * FROM Users where user_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Users.class));
    }
    public Courses GetInfoCourse(int courseID)
    {
        String sql = "SELECT * FROM Courses where course_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{courseID},BeanPropertyRowMapper.newInstance(Courses.class));
    }
    public Teachers GetInfoTeacher(String userID)
    {
        String sql = "SELECT * FROM Teachers where t_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{userID},BeanPropertyRowMapper.newInstance(Teachers.class));
    }
    public void addCourse(String userID, String pic,String Subject, String Title, int duration, int rating)
    {

        /*String d = "SELECT max(COURSE_ID) FROM COURSES";
        String a = "Discuss your problems here";
        int course_Id =jdbcTemplate.queryForObject(d,(Integer.class))+1;
        String qc = "SELECT max(COMMENT_ID) FROM COMMENTS";
        int comment_Id =jdbcTemplate.queryForObject(qc,(Integer.class))+1;
        jdbcTemplate.update("INSERT INTO FORUMS (DISCUSSION_TOPIC) values (?)",Title);
        String s = "SELECT max(FORUM_ID) FROM FORUMS";
        int forum_Id =jdbcTemplate.queryForObject(s,(Integer.class));*/
        jdbcTemplate.update("INSERT INTO COURSES (TITLE,COURSE_PIC,SUBJECT,COURSE_DURATION,T_ID,RATING) " +
                "values (?,?,?,?,?,?)",Title,pic,Subject,duration,userID,rating);
        /*jdbcTemplate.update("INSERT INTO COMMENTS " +
                "(USER_ID,FORUM_ID,COURSE_ID,USER_COMMENT,LIKES,DISLIKES) values (?,?,?,?,0,0)",userID,forum_Id,course_Id,a);*/
    }
    public void setCourse(int course_id,String Title)
    {
        String sql = "UPDATE COURSES SET TITLE = ? WHERE COURSE_ID = ? " ;
        jdbcTemplate.update(sql,Title,course_id);
    }

    public void ReduceCourseDuration(int course_id,int d)
    {
        String sql = "UPDATE COURSES SET COURSE_DURATION = ? WHERE COURSE_ID = ? " ;
        jdbcTemplate.update(sql,d-1, course_id);
    }

    public void setTopic(int course_id,String Title,String topicFile)
    {
        String sql = "UPDATE TOPICS SET TOPIC_NAME = ?, TOPIC_FILE = ?  WHERE TOPIC_ID = ? " ;
        jdbcTemplate.update(sql,Title,topicFile,course_id);
    }
    public Topics TopicInfo(int ID)
    {
        String sql = "SELECT * FROM Topics where topic_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{ID},BeanPropertyRowMapper.newInstance(Topics.class));
    }

    public void deleteCourse(int course_id)
    {
      /* String sql0 = "DELETE FROM COMMENTS WHERE COURSE_ID = ?";
       jdbcTemplate.update(sql0,course_id);
        String sql1 = "DELETE FROM TAKES_EXAM WHERE QUIZ_ID IN (SELECT QUIZ_ID FROM QUIZES WHERE COURSE_ID = ?)";
        jdbcTemplate.update(sql1,course_id);
        String sql2 = "DELETE FROM QUIZES WHERE COURSE_ID = ?";
        jdbcTemplate.update(sql2,course_id);
        String sql5 = "DELETE FROM ENROLLMENT WHERE COURSE_ID = ? " ;
        jdbcTemplate.update(sql5,course_id);
        String sql3 = "DELETE FROM TOPICS WHERE COURSE_ID = ?";
        jdbcTemplate.update(sql3,course_id);*/
        String sql4 = "DELETE FROM COURSES WHERE COURSE_ID = ? " ;
        jdbcTemplate.update(sql4,course_id);
    }

    public void deleteTopic(int topic_id)
    {
        String sql0 = "DELETE FROM TOPICS WHERE TOPIC_ID = ?";
        jdbcTemplate.update(sql0,topic_id);
        String sql1 = "UPDATE COURSES SET COURSE_DURATION = ? WHERE COURSE_ID + ?";
    }

    public void addTopic(int courseID,String topic_name,String Topicf)
    {
        /*String Topic = "SELECT max(TOPIC_ID) FROM TOPICS";
        int topic_id= jdbcTemplate.queryForObject(Topic,(Integer.class));*/

        jdbcTemplate.update("INSERT INTO TOPICS (TOPIC_NAME,TOPIC_FILE,COURSE_ID) " +
                "values(?,?,?)",topic_name,Topicf,courseID);
    }
    public List<Topics> getTopicsByCourseID(int ID){
        String sql = "SELECT * FROM TOPICS WHERE course_id = ? ORDER BY TOPIC_ID";
        return (List<Topics>) jdbcTemplate.query(
                sql,
                new Object[]{ID},
                BeanPropertyRowMapper.newInstance(Topics.class));
    }
    public List<Topics> getTopic(){
        String sql = "SELECT * FROM TOPICS";
        System.out.println(sql);
        return (List<Topics>) jdbcTemplate.query(
                sql,
                BeanPropertyRowMapper.newInstance(Topics.class));
    }

    public void addQuiz(int courseID,String ques,String option1,String option2,String option3,String option4,String ans)
    {
        /*String Quizes = "SELECT max(quiz_ID) FROM quizes";
        int quiz_id= jdbcTemplate.queryForObject(Quizes,(Integer.class))+1;*/
        jdbcTemplate.update("INSERT INTO QUIZES (COURSE_ID,QUIZ_QUES,OPTION1,OPTION2,OPTION3,OPTION4,QUES_ANS) " +
                "values(?,?,?,?,?,?,?)",courseID,ques,option1,option2,option3,option4,ans);
    }
    public List<Quizes> getQUIZByCourseID(int ID){
        String sql = "SELECT * FROM QUIZES WHERE course_id = ? ORDER BY QUIZ_ID";
        return (List<Quizes>) jdbcTemplate.query(
                sql,
                new Object[]{ID},
                BeanPropertyRowMapper.newInstance(Quizes.class));
    }
    public void deleteQuiz(int quizID)
    {
        String t = "DELETE FROM TAKES_EXAM WHERE QUIZ_ID=?";

        jdbcTemplate.update(t,quizID);
        String Quizes = "DELETE FROM QUIZES WHERE QUIZ_ID=?";

        jdbcTemplate.update(Quizes,quizID);
    }
    public Quizes QuizInfo(int ID)
    {
        String sql = "SELECT * FROM Quizes where quiz_id=?";
        return jdbcTemplate.queryForObject(sql,new Object[]{ID},BeanPropertyRowMapper.newInstance(Quizes.class));
    }

    public void editQuiz(int course_id,String q,String o1,String o2,String o3,String o4,String a)
    {
        String sql = "UPDATE QUIZES SET QUIZ_QUES=?, OPTION1 = ?,OPTION2 = ?,OPTION3 = ?,OPTION4 = ?,QUES_ANS=?  WHERE QUIZ_ID = ? " ;
        jdbcTemplate.update(sql,q,o1,o2,o3,o4,a, course_id);
    }
    public void editProfile(String userID,String p, String name,String Pass, String email){

        String sql = "UPDATE Users SET " +
                "FULL_NAME = ?," +
                "EMAIL = ?," +
                "PASSWORD = ? ," +
                "PICTURE = ?" +
                "WHERE USER_ID = ?";
        jdbcTemplate.update(sql,name,email,Pass,p,userID);
    }

    public void TeacherSet(String userID,String s,String d){

        String sql = "UPDATE TEACHERS SET " +
                "T_DESIGNATION = ?," +
                "T_SPECIALITY=?" +
                "WHERE T_ID = ?";
        jdbcTemplate.update(sql,d,s,userID);
    }
}
