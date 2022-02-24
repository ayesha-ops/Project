package com.example.demo.DAO;

import com.example.demo.Model.Comments;
import com.example.demo.Model.Forums;
import com.example.demo.Model.Quizes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
public class NewsForumDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize() {
        super.setDataSource(dataSource);
        jdbcTemplate = getJdbcTemplate();
    }
    public Integer get_noOfComments(int forum_ID){
        String sql = "SELECT count(*) from comments where FORUM_ID = ?";
        return jdbcTemplate.queryForObject(
                sql,
                new Object[]{forum_ID},
                Integer.class);
    }
    public void createPost(String username, String subject){
        jdbcTemplate.update("INSERT INTO FORUMS ( DISCUSSION_TOPIC ) values (?)",subject);
    }
    public List<Forums> searchTopics(String username , String keyword){
        keyword = "%"+keyword.toLowerCase()+"%";
        String sql = "SELECT * FROM (SELECT F.FORUM_ID ID, F.DISCUSSION_TOPIC TOPIC\n" +
                "FROM FORUMS F WHERE F.FORUM_ID NOT IN (SELECT C2.FORUM_ID FROM COMMENTS C2) OR F.FORUM_ID " +
                "IN (SELECT C3.FORUM_ID FROM COMMENTS C3 WHERE C3.COURSE_ID IS NULL) OR F.FORUM_ID IN (SELECT C.FORUM_ID F_ID " +
                "FROM COMMENTS C JOIN ENROLLMENT E ON ( E.S_ID = ? AND  C.COURSE_ID = E.COURSE_ID  )GROUP BY C.FORUM_ID) )where\n" +
                "LOWER(TOPIC) LIKE ?";
        return (List<Forums>) jdbcTemplate.query(
                sql,
                new Object[]{username,keyword},
                new RowMapper<Forums>() {
                    @Override
                    public Forums mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Forums forum = new Forums();
                        forum.setForum_id(rs.getInt("ID"));
                        forum.setDiscussion_topic(rs.getString("TOPIC"));
                        return forum;
                    }
                });
    }

    public List<Comments> getAllComments(String username, int forumID){
        String sql = "select COMMENT_ID,USER_ID,FORUM_ID,COURSE_ID,USER_COMMENT,LIKES,DISLIKES,COMMENT_DATE from COMMENTS where FORUM_ID = ? order by comment_date";
        return (List<Comments>) jdbcTemplate.query(
                sql,
                new Object[]{forumID},
                BeanPropertyRowMapper.newInstance(Comments.class));
    }
    public void like(int commentID){
        jdbcTemplate.update("UPDATE COMMENTS SET LIKES = LIKES + 1 WHERE COMMENT_ID = ?",commentID);
    }
    public void dislike(int commentID){
        jdbcTemplate.update("UPDATE COMMENTS SET DISLIKES = DISLIKES + 1 WHERE COMMENT_ID = ?",commentID);
    }
    public void postComment(String username,int forumID,String value){

        String sql = "INSERT INTO COMMENTS (FORUM_ID , USER_ID , COURSE_ID ,USER_COMMENT) VALUES(? ,? ,? ,?)";
        //here course id is string
        jdbcTemplate.update(sql,forumID,username,getCourseId(forumID),value);
    }
    public void deleteComment(int commentID){
        jdbcTemplate.update("DELETE FROM COMMENTS WHERE COMMENT_ID = ?",commentID);
    }
    public void updateComment(int commentID,String newVal){
        jdbcTemplate.update("UPDATE COMMENTS SET USER_COMMENT = ? WHERE COMMENT_ID = ?",newVal,commentID);
    }
    public String getForumTopic(int forumID){

            String sql = "SELECT DISCUSSION_TOPIC FROM FORUMS WHERE FORUM_ID = ?";
            return jdbcTemplate.queryForObject(sql,new Object[]{forumID}, String.class);

    }
    public String getCourseId(int forumID){
        try {
            String sql = "SELECT DISTINCT(COURSE_ID) FROM COMMENTS WHERE FORUM_ID = ?";
            // System.out.println("get Course Id of forum: "+forumID);
            return jdbcTemplate.queryForObject(sql, new Object[]{forumID}, String.class);
        }catch (EmptyResultDataAccessException e){
            System.out.println("In news forum dao , getCourseId, as no comments yet, so no data found");
            return null;
        }
    }
    public List<Forums> getAllForumTopics(String username){
        String sql = "SELECT F.FORUM_ID, F.DISCUSSION_TOPIC " +
                "FROM FORUMS F WHERE F.FORUM_ID NOT IN " +
                "(SELECT C2.FORUM_ID FROM COMMENTS C2) OR F.FORUM_ID " +
                "IN (SELECT C3.FORUM_ID FROM COMMENTS C3 WHERE C3.COURSE_ID IS NULL) " +
                "OR F.FORUM_ID IN (SELECT C.FORUM_ID F_ID FROM COMMENTS C JOIN ENROLLMENT E ON " +
                "( E.S_ID = ? AND C.COURSE_ID = E.COURSE_ID )GROUP BY C.FORUM_ID)";

        return (List<Forums>) jdbcTemplate.query(
                sql,
                new Object[]{username},
                BeanPropertyRowMapper.newInstance(Forums.class));
    }
    public List<Forums> getAllForumTopicsTeacher(String username){
        String sql = "SELECT F.FORUM_ID, F.DISCUSSION_TOPIC \n" +
                "FROM FORUMS F WHERE F.FORUM_ID NOT IN (SELECT C2.FORUM_ID FROM COMMENTS C2) OR " +
                "F.FORUM_ID IN (SELECT C3.FORUM_ID FROM COMMENTS C3 WHERE C3.COURSE_ID IS NULL) OR " +
                "F.FORUM_ID IN (SELECT C.FORUM_ID F_ID FROM COMMENTS C JOIN COURSES E ON ( E.T_ID = ? " +
                "AND C.COURSE_ID = E.COURSE_ID )GROUP BY C.FORUM_ID)";
        return (List<Forums>) jdbcTemplate.query(
                sql,
                new Object[]{username},
                BeanPropertyRowMapper.newInstance(Forums.class));
    }
    public List<Forums> searchTopicsTeacher(String username , String keyword){
        keyword = "%"+keyword.toLowerCase()+"%";
        String sql = "SELECT * FROM (SELECT F.FORUM_ID ID, F.DISCUSSION_TOPIC TOPIC\n" +
                "FROM FORUMS F WHERE F.FORUM_ID NOT IN (SELECT C2.FORUM_ID FROM COMMENTS C2) OR " +
                "F.FORUM_ID IN (SELECT C3.FORUM_ID FROM COMMENTS C3 WHERE C3.COURSE_ID IS NULL) OR " +
                "F.FORUM_ID IN (SELECT C.FORUM_ID F_ID FROM COMMENTS C JOIN COURSES E ON ( E.T_ID = ? " +
                "AND C.COURSE_ID = E.COURSE_ID )GROUP BY C.FORUM_ID) )where\n" +
                "LOWER(TOPIC) LIKE ?";
        return (List<Forums>) jdbcTemplate.query(
                sql,
                new Object[]{username,keyword},
                new RowMapper<Forums>() {
                    @Override
                    public Forums mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Forums forum = new Forums();
                        forum.setForum_id(rs.getInt("ID"));
                        forum.setDiscussion_topic(rs.getString("TOPIC"));
                        return forum;
                    }
                });
    }
}
