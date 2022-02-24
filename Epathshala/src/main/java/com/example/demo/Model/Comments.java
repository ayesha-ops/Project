package com.example.demo.Model;

public class Comments {
    public Comments(Integer comment_id, String user_id, Integer forum_id, Integer likes, Integer dislikes, String comment_date, Integer course_id, String user_comment) {
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.forum_id = forum_id;
        this.likes = likes;
        this.dislikes = dislikes;
        this.comment_date = comment_date;
        this.course_id = course_id;
        this.user_comment = user_comment;
    }

    private Integer comment_id; //pk
    private String user_id; //fk users
    private Integer forum_id; //fk forums
    private Integer likes;
    private Integer dislikes;

    @Override
    public String toString() {
        return "Comments{" +
                "comment_id=" + comment_id +
                ", user_id='" + user_id + '\'' +
                ", forum_id=" + forum_id +
                ", likes=" + likes +
                ", dislikes=" + dislikes +
                ", comment_date='" + comment_date + '\'' +
                ", course_id=" + course_id +
                ", user_comment='" + user_comment + '\'' +
                '}';
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    public void setDislikes(Integer dislikes) {
        this.dislikes = dislikes;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    private String comment_date;

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getForum_id() {
        return forum_id;
    }

    public void setForum_id(Integer forum_id) {
        this.forum_id = forum_id;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getUser_comment() {
        return user_comment;
    }



    public void setUser_comment(String user_comment) {
        this.user_comment = user_comment;
    }

    public Comments() {
    }

    private Integer course_id; //fk courses
    private String user_comment;

}
