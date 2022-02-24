package com.example.demo.Model;

public class Quizes {
    private Integer quiz_id; //pk
    private Integer course_id; //fk -> courses
    private String quiz_ques;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String ques_ans;

    @Override
    public String toString() {
        return "Quizes{" +
                "quiz_id=" + quiz_id +
                ", course_id=" + course_id +
                ", quiz_ques='" + quiz_ques + '\'' +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", quiz_ans='" + ques_ans + '\'' +
                '}';
    }

    public Integer getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(Integer quiz_id) {
        this.quiz_id = quiz_id;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getQuiz_ques() {
        return quiz_ques;
    }

    public void setQuiz_ques(String quiz_ques) {
        this.quiz_ques = quiz_ques;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getQues_ans() {
        return ques_ans;
    }

    public void setQues_ans(String ques_ans) {
        this.ques_ans = ques_ans;
    }

    public Quizes() {
    }

    public Quizes(Integer quiz_id, Integer course_id, String quiz_ques, String option1, String option2, String option3, String option4, String ques_ans) {
        this.quiz_id = quiz_id;
        this.course_id = course_id;
        this.quiz_ques = quiz_ques;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.ques_ans = ques_ans;
    }
}
