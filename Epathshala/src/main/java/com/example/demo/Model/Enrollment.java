package com.example.demo.Model;

public class Enrollment {
    private Integer enroll_id; //pk
    private String s_id; //fk ->students
    private Integer course_id; //fk -> courses

    @Override
    public String toString() {
        return "Enrollment{" +
                "enroll_id=" + enroll_id +
                ", s_id='" + s_id + '\'' +
                ", course_id=" + course_id +
                '}';
    }

    public Enrollment() {
    }

    public Enrollment(Integer enroll_id, String s_id, Integer course_id) {
        this.enroll_id = enroll_id;
        this.s_id = s_id;
        this.course_id = course_id;
    }

    public Integer getEnroll_id() {
        return enroll_id;
    }

    public void setEnroll_id(int enroll_id) {
        this.enroll_id = enroll_id;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
