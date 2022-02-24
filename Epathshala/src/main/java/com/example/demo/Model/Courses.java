package com.example.demo.Model;

public class Courses {
    private Integer course_id; //pk
    private String title;
    private String subject;
    private String published_date;
    private double rating;
    private Integer course_duration;


    public Courses(Integer course_id, String title, String subject) {
        this.course_id = course_id;
        this.title = title;
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Courses{" +
                "course_id=" + course_id +
                ", title='" + title + '\'' +
                ", subject='" + subject + '\'' +
                ", published_date='" + published_date + '\'' +
                ", rating=" + rating +
                ", course_duration=" + course_duration +
                ", t_id='" + t_id + '\'' +
                ", course_pic='" + course_pic + '\'' +
                '}';
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
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

    public Integer getCourse_duration() {
        return course_duration;
    }

    public void setCourse_duration(Integer course_duration) {
        this.course_duration = course_duration;
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

    public Courses() {
    }

    public Courses(Integer course_id, String title, String subject, String published_date, double rating, Integer course_duration, String t_id, String course_pic) {
        this.course_id = course_id;
        this.title = title;
        this.subject = subject;
        this.published_date = published_date;
        this.rating = rating;
        this.course_duration = course_duration;
        this.t_id = t_id;
        this.course_pic = course_pic;
    }

    private String t_id; //fk -> teachers
    private String course_pic;
}
