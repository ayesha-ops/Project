package com.example.demo.Model;

public class Users {
    private String user_id; //pk
    private String password;
    private String full_name;
    private String date_of_birth;
    private String institution;
    private String email;
    private String picture;
    private String authority;
    private Character enabled;

    @Override
    public String toString() {
        return "Users{" +
                "user_id='" + user_id + '\'' +
                ", password='" + password + '\'' +
                ", full_name='" + full_name + '\'' +
                ", date_of_birth='" + date_of_birth + '\'' +
                ", institution='" + institution + '\'' +
                ", email='" + email + '\'' +
                ", picture='" + picture + '\'' +
                ", authority='" + authority + '\'' +
                ", enabled=" + enabled +
                '}';
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public Character getEnabled() {
        return enabled;
    }

    public void setEnabled(Character enabled) {
        this.enabled = enabled;
    }

    public Users(String user_id, String password, String full_name, String date_of_birth, String institution, String email, String picture, String authority, Character enabled) {
        this.user_id = user_id;
        this.password = password;
        this.full_name = full_name;
        this.date_of_birth = date_of_birth;
        this.institution = institution;
        this.email = email;
        this.picture = picture;
        this.authority = authority;
        this.enabled = enabled;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Users() {
    }


}
