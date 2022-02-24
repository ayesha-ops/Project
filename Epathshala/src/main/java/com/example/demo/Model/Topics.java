package com.example.demo.Model;

public class Topics {
    private Integer topic_id; //pk
    private String topic_name;
    private String topic_file;
    private Integer course_id; //fk

    @Override
    public String toString() {
        return "Topics{" +
                "topic_id=" + topic_id +
                ", topic_name='" + topic_name + '\'' +
                ", topic_file='" + topic_file + '\'' +
                ", course_id=" + course_id +
                '}';
    }

    public Integer getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(Integer topic_id) {
        this.topic_id = topic_id;
    }

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    public String getTopic_file() {
        return topic_file;
    }

    public void setTopic_file(String topic_file) {
        this.topic_file = topic_file;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public Topics() {
    }

    public Topics(Integer topic_id, String topic_name, String topic_file, Integer course_id) {
        this.topic_id = topic_id;
        this.topic_name = topic_name;
        this.topic_file = topic_file;
        this.course_id = course_id;
    }
}
