package com.example.demo.Controller;

import com.example.demo.DAO.CourseTopicsDAO;
import com.example.demo.DAO.NewsForumDAO;
import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.DAO.StudentProfileDAO;
import com.example.demo.Model.Comments;
import com.example.demo.Model.Forums;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/teacher/TeacherProfile/news-forum")
public class TeacherNewsForumController {
    @Autowired
    NewsForumDAO newsForumDAO;
    @Autowired
    StudentProfileDAO studentProfileDAO;
    @Autowired
    CourseTopicsDAO courseTopicsDAO;
    @Autowired
    StudentCourseDAO studentCourseDAO;

    @RequestMapping(value = "/view-all-topics/{userID}",method = RequestMethod.GET)
    public ModelAndView allForumTopics(@PathVariable String userID) {
        ModelAndView model = new ModelAndView("webpages/teacher/teacherAll");
        model.addObject("username", userID);
        List<Forums> forums = newsForumDAO.getAllForumTopicsTeacher(userID);
        model.addObject("all_topics", forums);
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (Forums f : forums) {
            map.put(f.getForum_id(), newsForumDAO.get_noOfComments(f.getForum_id()));
        }
        System.out.println("hello     " +forums);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        model.addObject("no_of_comment", map);


        return model;
    }

    @RequestMapping(value = "/add-topic/{userID}",method = RequestMethod.POST)
    public ModelAndView AddNewTopic(@PathVariable String userID, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("webpages/teacher/teacherAll");
        model.addObject("username", userID);
        System.out.println("hello     "+request.getParameter("keyword"));
        if (request.getParameter("keyword") != null) {
            newsForumDAO.createPost(userID, request.getParameter("keyword"));
        }
        List<Forums> forums = newsForumDAO.getAllForumTopicsTeacher(userID);
        model.addObject("all_topics", forums);
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (Forums f : forums) {
            map.put(f.getForum_id(), newsForumDAO.get_noOfComments(f.getForum_id()));
        }
        model.addObject("no_of_comment", map);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }

    @RequestMapping(value = "/search-topic/{userID}", method = RequestMethod.POST)
    public ModelAndView SearchTopic(@PathVariable String userID, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("webpages/teacher/teacherAll");
        model.addObject("username", userID);
        List<Forums> forums;
        System.out.println(request.getParameter("keyword"));
        if (request.getParameter("keyword") != null) {
            forums = newsForumDAO.searchTopicsTeacher(userID, request.getParameter("keyword"));
            System.out.println(forums);
        } else {
            forums = newsForumDAO.getAllForumTopicsTeacher(userID);
        }
        model.addObject("all_topics", forums);
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (Forums f : forums) {
            System.out.println(f);
            map.put(f.getForum_id(), newsForumDAO.get_noOfComments(f.getForum_id()));
        }
        model.addObject("no_of_comment", map);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }

    @RequestMapping(value = "/view-specific-forum/{userID}/{forumID}")
    public ModelAndView allComments(@PathVariable String userID, @PathVariable String forumID) {
        ModelAndView model = new ModelAndView("webpages/teacher/teacherSpecificForum");
        model.addObject("username", userID);
        List<Comments> comments = newsForumDAO.getAllComments(userID, Integer.parseInt(forumID));
        model.addObject("comments_list", comments);
        //System.out.println("request for " + forumID);
        String[] commenters_pic = new String[comments.size()];
        int i = 0;
        //System.out.println(newsForumDAO.getForumTopic(Integer.parseInt(forumID)));
        for (Comments c : comments) {
            commenters_pic[i] = studentProfileDAO.getUserPic(c.getUser_id());
            i++;
        }
        model.addObject("commenters_pic_array", commenters_pic);
        model.addObject("discussion_topic", newsForumDAO.getForumTopic(Integer.parseInt(forumID)));//faka ashe
        String pic = "/images/cartoon2.jpg";
        //for finding out course_id
        //course if not in the table return null , dnt knw how to handle
        String course_id = newsForumDAO.getCourseId(Integer.parseInt(forumID));
        //System.out.println(course_id + " " + course_id.matches("[0-9]+"));
        if (course_id !=null && course_id.matches("[0-9]+")) {
            int c_id = Integer.parseInt(course_id);
            pic = courseTopicsDAO.getCoursePic(c_id);
        }
        //System.out.println(pic);
        model.addObject("decoration_pic", pic);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }

    @RequestMapping(value = "/like-comment/{userID}/{forumID}/{commentID}", method = RequestMethod.GET)
    public ModelAndView likeComment(@PathVariable String userID, @PathVariable String forumID, @PathVariable String commentID) {
        newsForumDAO.like(Integer.parseInt(commentID));
        return new ModelAndView("redirect:/teacher/TeacherProfile/news-forum/view-specific-forum/{userID}/{forumID}");
    }

    @RequestMapping(value = "/dislike-comment/{userID}/{forumID}/{commentID}", method = RequestMethod.GET)
    public ModelAndView AddNewComment(@PathVariable String userID, @PathVariable String forumID, @PathVariable String commentID) {
        newsForumDAO.dislike(Integer.parseInt(commentID));
        return new ModelAndView("redirect:/teacher/TeacherProfile/news-forum/view-specific-forum/{userID}/{forumID}");
    }
    @RequestMapping(value = "/delete-comment/{userID}/{forumID}/{commentID}")
    public ModelAndView DeleteComment(@PathVariable String userID, @PathVariable String forumID, @PathVariable String commentID) {
        newsForumDAO.deleteComment(Integer.parseInt(commentID));
        return new ModelAndView("redirect:/teacher/TeacherProfile/news-forum/view-specific-forum/{userID}/{forumID}");
    }
    @RequestMapping(value = "/edit-comment/{userID}/{forumID}/{commentID}", method = RequestMethod.POST)
    public ModelAndView EditComment(@PathVariable String userID, @PathVariable String forumID, @PathVariable String commentID, HttpServletRequest request) {
        if(request.getParameter("updated_comment")!=null) {
            newsForumDAO.updateComment(Integer.parseInt(commentID), request.getParameter("updated_comment"));
        }
        return new ModelAndView("redirect:/teacher/TeacherProfile/news-forum/view-specific-forum/{userID}/{forumID}");
    }
    @RequestMapping(value = "/post-comment/{userID}/{forumID}", method = RequestMethod.POST)
    public ModelAndView PostComment(@PathVariable String userID, @PathVariable String forumID,HttpServletRequest request) {
        if(request.getParameter("new_comment")!=null) {
            newsForumDAO.postComment(userID,Integer.parseInt(forumID),request.getParameter("new_comment"));
        }
        return new ModelAndView("redirect:/teacher/TeacherProfile/news-forum/view-specific-forum/{userID}/{forumID}");
    }
}
