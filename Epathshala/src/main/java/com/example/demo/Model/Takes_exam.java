package com.example.demo.Model;

public class Takes_exam {
    private Integer exam_id;//pk
    private String s_id;//fk -> students
    private Integer marks;

    @Override
    public String toString() {
        return "Takes_exam{" +
                "exam_id=" + exam_id +
                ", s_id='" + s_id + '\'' +
                ", marks=" + marks +
                '}';
    }

    public Integer getExam_id() {
        return exam_id;
    }

    public void setExam_id(Integer exam_id) {
        this.exam_id = exam_id;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public Integer getMarks() {
        return marks;
    }

    public void setMarks(Integer marks) {
        this.marks = marks;
    }

    public Takes_exam() {
    }

    public Takes_exam(Integer exam_id, String s_id, Integer marks) {
        this.exam_id = exam_id;
        this.s_id = s_id;
        this.marks = marks;
    }
}
