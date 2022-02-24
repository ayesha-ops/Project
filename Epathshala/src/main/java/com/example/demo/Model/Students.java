package com.example.demo.Model;

public class Students {
    @Override
    public String toString() {
        return "Students{" +
                "s_id='" + s_id + '\'' +
                ", s_class=" + s_class +
                '}';
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public Integer getS_class() {
        return s_class;
    }

    public void setS_class(Integer s_class) {
        this.s_class = s_class;
    }

    public Students() {
    }

    public Students(String s_id, Integer s_class) {
        this.s_id = s_id;
        this.s_class = s_class;
    }

    private String s_id;// pk, fk
    private Integer s_class;
}
