package com.example.demo.Controller;

import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.DAO.StudentPageDAO;
import com.example.demo.Model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value="/student/homepage")
public class StudentPageController {
    @Autowired
    private StudentPageDAO studentPageDAO;
    @Autowired
    private StudentCourseDAO studentCourseDAO;

    @RequestMapping(value="/{userID}",method= RequestMethod.GET)
    public ModelAndView studentPage(@PathVariable String userID){
        List<Courses> mostRatedCourseList = studentPageDAO.MostRatedCourseList();
        //for(Courses c:mostRatedCourseList) System.out.println(c);
        ModelAndView model = new ModelAndView("webpages/student/homepage");
        model.addObject("username",userID);
        model.addObject("mostRatedCourseList",mostRatedCourseList);
        model.addObject("popularCourseList",studentPageDAO.PopularCourseList());
        //System.out.println(userID+" ******************************************8");
        List<Courses> completedCourseList = studentPageDAO.CompletedCourseList(userID);
        model.addObject("completedCourseList",completedCourseList);
        List<Courses> inProgressCourseList = studentPageDAO.InProgressCourseList(userID);
        model.addObject("inProgressCourseList",inProgressCourseList);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        //for(Courses c:completedCourseList) System.out.println(c.getTitle()+" "+c.getSubject());
        return model;
    }
    @RequestMapping(value="/courses-of-subject/{userID}/{subject}",method= RequestMethod.GET)
    public ModelAndView CoursesOfSubject(@PathVariable String userID,@PathVariable String subject) {
        ModelAndView model = new ModelAndView("webpages/student/searchResult");
        model.addObject("username",userID);
        model.addObject("header_topic","Search For "+subject);
        model.addObject("CourseList",studentCourseDAO.getCoursesOfSubject(subject));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }

    @RequestMapping(value="/courses-of-searching/{userID}",method = RequestMethod.POST)
    public ModelAndView CourseOfSearch(@PathVariable String userID,HttpServletRequest req){
        ModelAndView model = new ModelAndView("webpages/student/searchResult");
        model.addObject("username",userID);
        model.addObject("header_topic","Search For "+req.getParameter("search_key"));
        model.addObject("CourseList",studentCourseDAO.getCoursesOfKeyword(req.getParameter("search_key")));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
    @RequestMapping(value="/my-course/{userID}",method = RequestMethod.GET)
    public ModelAndView MyCourses(@PathVariable String userID){
        ModelAndView model = new ModelAndView("webpages/student/searchResult");
        model.addObject("username",userID);
        model.addObject("header_topic","My Courses");
        model.addObject("CourseList",studentCourseDAO.getMyCourse(userID));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
    @RequestMapping(value = "/{userID}/contact")
    public ModelAndView contactus(@PathVariable String userID)
    {
        ModelAndView model = new ModelAndView("webpages/student/s_contacts_admin");
        model.addObject("username",userID);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
}

