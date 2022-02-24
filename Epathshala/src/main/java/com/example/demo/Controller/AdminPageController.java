package com.example.demo.Controller;

import com.example.demo.DAO.AdminPageDAO;
import com.example.demo.DAO.CourseTopicsDAO;
import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.DAO.TeacherCourseDAO;
import com.example.demo.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/admin")
public class AdminPageController {
    @Autowired
    private AdminPageDAO adminPageDAO;
    @Autowired
    private TeacherCourseDAO teacherCourseDAO;
    @Autowired
    private StudentCourseDAO studentCourseDAO;

    @Autowired
    private CourseTopicsDAO courseTopicsDAO;

    @RequestMapping(value = "/{adminID}", method = RequestMethod.GET)
    public ModelAndView adminPage(@PathVariable String adminID) {
        ModelAndView model = new ModelAndView("webpages/admin/adminHomePage");
        model.addObject("adminID", adminID);
        return model;
    }
    @RequestMapping(value = "/{userID}/contact")
    public ModelAndView contactus(@PathVariable String userID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/contact");
        model.addObject("adminID",userID);
        return model;
    }

    @RequestMapping(value = "/{adminID}/showCourses",method = RequestMethod.GET)
    public ModelAndView showCourse(@PathVariable String adminID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/showCourses");
        List<Courses> CourseList = adminPageDAO.CourseList();
        model.addObject("CourseList", CourseList);
        model.addObject("adminID",adminID);
        return model;
    }

    @RequestMapping(value = "/{adminID}/showTeachers",method = RequestMethod.GET)
    public ModelAndView showTeachers(@PathVariable String adminID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/showTeachers");
        model.addObject("teachers",adminPageDAO.TeacherList());
        model.addObject("adminID",adminID);
        return model;
    }


    @RequestMapping(value="/{adminID}/{courseID}/showCoursePage")
    public ModelAndView showCoursePage(@PathVariable String adminID,@PathVariable String courseID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/ShowCoursePage");
        model.addObject("adminID", adminID);
        Courses course = studentCourseDAO.getCourseInfoByID(Integer.parseInt(courseID));
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        model.addObject("course_info",course);
        model.addObject("topics_list",topics);
        System.out.println(course);
        model.addObject("duration",topics.size());
        return model;
    }

    @RequestMapping(value="/{adminID}/{userID}/showTeacherPage")
    public ModelAndView showTeacherPage(@PathVariable String adminID,@PathVariable String userID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/TeacherProfile");
        model.addObject("adminID",adminID);
        model.addObject("username",userID);
        List<Courses> createdCourseList = teacherCourseDAO.CreatedCourseList(userID);
        model.addObject("createdCourseList",createdCourseList);
        Users users=teacherCourseDAO.GetInfoUser(userID);
        Teachers teachers=teacherCourseDAO.GetInfoTeacher(userID);
        model.addObject("users",users);
        model.addObject("teachers",teachers);
        System.out.println(users);
        return model;
    }

    @RequestMapping(value="/{adminID}/{userID}/showStudentPage")
    public ModelAndView showStudentPage(@PathVariable String adminID,@PathVariable String userID)
    {
        ModelAndView model = new ModelAndView("webpages/admin/StudentProfile");
        System.out.println("hello  " +userID);
        model.addObject("adminID",adminID);
        Users users = adminPageDAO.GetInfoUser(userID);
        System.out.println(users);
        Students students = adminPageDAO.GetInfoStudent(userID);
        System.out.println(students);
        model.addObject("users",users);
        model.addObject("students",students);
        System.out.println(users);
        return model;
    }
    @RequestMapping(value = "/{adminID}/showStudents")
    public ModelAndView showStudent(@PathVariable String adminID) throws NoSuchMethodException {
        ModelAndView model = new ModelAndView("webpages/admin/showStudents");
        List<Map<String, Object>> students = adminPageDAO.StudentsList();
        model.addObject("adminID",adminID);
        model.addObject("students",students);
        return model;
    }

    @RequestMapping(value = "/{adminID}/showProfile")
    public ModelAndView showProfile(@PathVariable String adminID) {
        ModelAndView model = new ModelAndView("webpages/admin/AdminProfile");
        Admin admin = adminPageDAO.InfoByAdminID(adminID);
        model.addObject("admin",admin);
        return model;
    }

    @PostMapping(value="/submit/{adminID}/{userID}/DeleteStudents",params= "action=deleteStudents")
    public ModelAndView DeleteStud(@PathVariable String adminID,@PathVariable String userID, HttpServletRequest request) {
        try {
            adminPageDAO.deleteStudent(userID);
            return new ModelAndView("redirect:/admin/{adminID}/showStudents");
        }
        catch (DataIntegrityViolationException e)
        {
            System.out.println("hello          "+ e);
            return new ModelAndView("redirect:/admin/{adminID}/showStudents");
        }
    }

    @PostMapping(value="/submit/{adminID}/{userID}/DeleteTeachers",params= "action=deleteTeachers")
    public ModelAndView DeleteTeacher(@PathVariable String adminID,@PathVariable String userID, HttpServletRequest request) {
        try {
            adminPageDAO.deleteTeacher(userID);
            return new ModelAndView("redirect:/admin/{adminID}/showTeachers");
        }
        catch (DataIntegrityViolationException e)
        {
            System.out.println("hello          "+ e);
            return new ModelAndView("redirect:/admin/{adminID}/showTeachers");
        }
    }
    @PostMapping(value="/submit/{adminID}/{courseID}/DeleteCourse",params= "action=deleteCourse")
    public ModelAndView DeleteCourse(@PathVariable String adminID,@PathVariable String courseID, HttpServletRequest request) {
        try {
            adminPageDAO.deleteCourse(Integer.parseInt(courseID));
            return new ModelAndView("redirect:/admin/{adminID}/showCourses");
        }
        catch (DataIntegrityViolationException e)
        {
            System.out.println("hello          "+ e);
            return new ModelAndView("redirect:/admin/{adminID}/showCourses");
        }
    }

    @RequestMapping(value = "/{adminID}/SearchCourse")
    public ModelAndView searchCourse(@PathVariable String adminID, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("webpages/admin/showCourses");
        model.addObject("adminID",adminID);
        try
        {
            model.addObject("CourseList",adminPageDAO.SearchCoursebyName(request.getParameter("s")));
        }
        catch (EmptyResultDataAccessException e)
        {
        }
        return model;
    }

    @RequestMapping(value = "/{adminID}/SearchTeacher")
    public ModelAndView searchTeacher(@PathVariable String adminID, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("webpages/admin/showTeachers");
        model.addObject("adminID",adminID);
        try
        {
            model.addObject("teachers",adminPageDAO.SearchTeacherbyName(request.getParameter("s")));
        }
        catch (EmptyResultDataAccessException e)
        {
        }
        return model;
    }

    @RequestMapping(value = "/{adminID}/SearchStudent")
    public ModelAndView searchStudent(@PathVariable String adminID, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("webpages/admin/showStudents");
        model.addObject("adminID",adminID);
        try
        {
            model.addObject("students",adminPageDAO.SearchStudentbyName(request.getParameter("s")));
        }
        catch (EmptyResultDataAccessException e)
        {
        }
        return model;
    }

    @RequestMapping(value={"/{userID}/{courseID}/{topicID}/topicPage"})
    public ModelAndView topicsPage(@PathVariable String userID, @PathVariable String courseID,@PathVariable String topicID) {
        ModelAndView model = new ModelAndView("webpages/admin/topicPage");
        model.addObject("adminID", userID);
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
        return model;
    }
}
