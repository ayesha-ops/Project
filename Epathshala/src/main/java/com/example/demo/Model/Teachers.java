package com.example.demo.Model;

public class Teachers {
    private String t_id; //pk fk
    private String t_designation;
    private String t_speciality;

    @Override
    public String toString() {
        return "Teachers{" +
                "t_id='" + t_id + '\'' +
                ", t_designation='" + t_designation + '\'' +
                ", t_speciality='" + t_speciality + '\'' +
                '}';
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String getT_designation() {
        return t_designation;
    }

    public void setT_designation(String t_designation) {
        this.t_designation = t_designation;
    }

    public String getT_speciality() {
        return t_speciality;
    }

    public void setT_speciality(String t_speciality) {
        this.t_speciality = t_speciality;
    }

    public Teachers() {
    }

    public Teachers(String t_id, String t_designation, String t_speciality) {
        this.t_id = t_id;
        this.t_designation = t_designation;
        this.t_speciality = t_speciality;
    }
}
