package com.example.demo.Model;

public class Admin {
    private String admin_id; // pk
    private String admin_name;
    private String password;
    private String email;
    private String picture;

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id='" + admin_id + '\'' +
                ", admin_name='" + admin_name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public Admin() {
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Admin(String admin_id, String admin_name, String password, String email, String picture) {
        this.admin_id = admin_id;
        this.admin_name = admin_name;
        this.password = password;
        this.email = email;
        this.picture = picture;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
