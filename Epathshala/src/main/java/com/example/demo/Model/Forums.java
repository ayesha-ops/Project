package com.example.demo.Model;

public class Forums {
    private Integer forum_id ; //pk
    private String discussion_topic;

    @Override
    public String toString() {
        return "Forums{" +
                "forum_id=" + forum_id +
                ", discussion_topic='" + discussion_topic + '\'' +
                '}';
    }


    public Forums() {
    }

    public Forums(Integer forum_id, String discussion_topic) {
        this.forum_id = forum_id;
        this.discussion_topic = discussion_topic;
        System.out.println(forum_id+" "+discussion_topic);
    }

    public Integer getForum_id() {
        return forum_id;
    }

    public void setForum_id(Integer forum_id) {
        this.forum_id = forum_id;
    }

    public String getDiscussion_topic() {
        return discussion_topic;
    }

    public void setDiscussion_topic(String discussion_topic) {
        this.discussion_topic = discussion_topic;
    }
}
