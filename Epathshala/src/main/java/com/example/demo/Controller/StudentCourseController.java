package com.example.demo.Controller;

import com.example.demo.DAO.CourseTopicsDAO;
import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.Model.Courses;
import com.example.demo.Model.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value="/course/coursepage")
public class StudentCourseController {
    @Autowired
    private StudentCourseDAO studentCourseDAO;

    @Autowired
    private CourseTopicsDAO courseTopicsDAO;

    @RequestMapping(value="/{userID}/{courseID}",method= RequestMethod.GET)
    public ModelAndView coursePage(@PathVariable String userID,@PathVariable String courseID) {
        //for(Courses c:mostRatedCourseList) System.out.println(c);
        ModelAndView model = new ModelAndView("webpages/course/coursepage");
        model.addObject("username", userID);
        Courses course = studentCourseDAO.getCourseInfoByID(Integer.parseInt(courseID));
        //System.out.println(course);
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        model.addObject("course_info",course);
        model.addObject("topics_list",topics);
        model.addObject("duration",topics.size());
        model.addObject("isEnrolled",studentCourseDAO.isEnrolled(userID,Integer.parseInt(courseID)));
        model.addObject("forum_id",courseTopicsDAO.getForumIdOfCourse(Integer.parseInt(courseID)));
        //model.addObject("topicList",studentCourseDAO.isCompleted(userID,Integer.parseInt(courseID)));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
    @RequestMapping(value="/enrollCourse/{userID}/{courseID}",method= RequestMethod.GET)
    public ModelAndView enrollCourse(@PathVariable String userID,@PathVariable String courseID){
        studentCourseDAO.enrollCourse(userID,Integer.parseInt(courseID));
        return new ModelAndView("redirect:/course/topicspage/{userID}/{courseID}");
    }

}
