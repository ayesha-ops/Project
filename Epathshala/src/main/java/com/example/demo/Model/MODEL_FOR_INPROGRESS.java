package com.example.demo.Model;

public class MODEL_FOR_INPROGRESS {
    private Integer course_id; //pk
    private String title;
    private String subject;
    private String published_date;
    private Double rating;
    private Integer course_duration;
    private Integer wrong_ans;
    private Integer tot_ques;
    private String t_id; //fk -> teachers
    private String course_pic;



    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPublished_date() {
        return published_date;
    }

    public void setPublished_date(String published_date) {
        this.published_date = published_date;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getCourse_duration() {
        return course_duration;
    }

    public void setCourse_duration(Integer course_duration) {
        this.course_duration = course_duration;
    }

    public Integer getWrong_ans() {
        return wrong_ans;
    }

    public void setWrong_ans(Integer wrong_ans) {
        this.wrong_ans = wrong_ans;
    }

    public Integer getTot_ques() {
        return tot_ques;
    }

    public void setTot_ques(Integer tot_ques) {
        this.tot_ques = tot_ques;
    }

    @Override
    public String toString() {
        return "MODEL_FOR_INPROGRESS{" +
                "course_id=" + course_id +
                ", title='" + title + '\'' +
                ", subject='" + subject + '\'' +
                ", published_date='" + published_date + '\'' +
                ", rating=" + rating +
                ", course_duration=" + course_duration +
                ", wrong_ans=" + wrong_ans +
                ", tot_ques=" + tot_ques +
                ", t_id='" + t_id + '\'' +
                ", course_pic='" + course_pic + '\'' +
                '}';
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String getCourse_pic() {
        return course_pic;
    }

    public void setCourse_pic(String course_pic) {
        this.course_pic = course_pic;
    }

    public MODEL_FOR_INPROGRESS(Integer course_id, String title, String subject, String published_date, Double rating, Integer course_duration, Integer wrong_ans, Integer tot_ques, String t_id, String course_pic) {
        this.course_id = course_id;
        this.title = title;
        this.subject = subject;
        this.published_date = published_date;
        this.rating = rating;
        this.course_duration = course_duration;
        this.wrong_ans = wrong_ans;
        this.tot_ques = tot_ques;
        this.t_id = t_id;
        this.course_pic = course_pic;
    }

    public MODEL_FOR_INPROGRESS() {
    }
}
