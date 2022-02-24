package com.example.demo.Model;

public class Notifications {
    private Integer notification_id; //pk
    private String notification;
    private String user_id; //fk -> users

    public Integer getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(Integer notification_id) {
        this.notification_id = notification_id;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Notifications(Integer notification_id, String notification, String user_id) {
        this.notification_id = notification_id;
        this.notification = notification;
        this.user_id = user_id;
    }

    public Notifications() {
    }
}
