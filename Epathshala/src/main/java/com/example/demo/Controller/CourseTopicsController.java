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
@RequestMapping(value="/course/topicspage")
public class CourseTopicsController {
    @Autowired
    private CourseTopicsDAO courseTopicsDAO;
    @Autowired
    private StudentCourseDAO studentCourseDAO;

    @RequestMapping(value={"/{userID}/{courseID}","/{userID}/{courseID}/{topicID}"},method= RequestMethod.GET)
    public ModelAndView topicsPage(@PathVariable String userID, @PathVariable String courseID,@PathVariable(required = false) String topicID) {
        ModelAndView model = new ModelAndView("webpages/course/topicspage");
        model.addObject("username", userID);
        model.addObject("courseID",courseID);
        model.addObject("coursetitle",studentCourseDAO.getCourseTitle(Integer.parseInt(courseID)));
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        if(topicID == null){
            model.addObject("currentTopic",topics.get(0));
        }else{
            for(Topics t:topics) {
                if(t.getTopic_id() == Integer.parseInt(topicID))
                {
                    model.addObject("currentTopic",t);
                    break;
                }
            }
        }
        model.addObject("topics_list",topics);
        model.addObject("forum_id",courseTopicsDAO.getForumIdOfCourse(Integer.parseInt(courseID)));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
}
