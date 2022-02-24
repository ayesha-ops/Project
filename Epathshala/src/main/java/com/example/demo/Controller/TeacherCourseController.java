package com.example.demo.Controller;

import com.example.demo.DAO.CourseTopicsDAO;
import com.example.demo.DAO.QuizAndMarksDAO;
import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.DAO.TeacherCourseDAO;
import com.example.demo.Model.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.boot.Banner;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/teacher/TeacherProfile")
public class TeacherCourseController {
    @Autowired
    private TeacherCourseDAO teacherCourseDAO;
    @Autowired
    private CourseTopicsDAO courseTopicsDAO;
    @Autowired
    private StudentCourseDAO studentCourseDAO;
    @Autowired
    private QuizAndMarksDAO quizAndMarksDAO;

    @PostMapping(value = "/submit/{userID}", params = "action=saveCourse")
    public ModelAndView addCourse(@PathVariable String userID, HttpServletRequest request) {
        String subject = request.getParameter("subjectName");
        String Title = request.getParameter("Title");
        String crs_pic = "\\images\\" + request.getParameter("picture");
        String Course_Duration = String.valueOf(0);
        String rating = String.valueOf('3');
        try {
            teacherCourseDAO.addCourse(userID,crs_pic, subject, Title, Integer.parseInt(Course_Duration), Integer.parseInt(rating));
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}");
        } catch (DataIntegrityViolationException e) {
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}");
        }
    }


    @PostMapping(value = "/submit/{userID}/{course_id}/addTopic", params = "action=saveTopic")
    public ModelAndView addTopic(@PathVariable String userID, @PathVariable String course_id, HttpServletRequest request) {
        String topic_name = request.getParameter("topic");
        String TopicFile = request.getParameter("topicFile");
        try {
            teacherCourseDAO.addTopic(Integer.parseInt(course_id), topic_name, TopicFile);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_id}/addTopic");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_id}/addTopic");
        }
    }

    @PostMapping(value = "/submit/{userID}/{course_id}/DeleteCourse", params = "action=deleteCourse")
    public ModelAndView DeleteCourse(@PathVariable String userID, @PathVariable String course_id, HttpServletRequest request) {
        System.out.println(Integer.parseInt(course_id));
        try {
            teacherCourseDAO.deleteCourse(Integer.parseInt(course_id));
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}");
        }
    }

    @RequestMapping(value = "/{userID}/{courseID}/createQuiz", method = RequestMethod.GET)
    public ModelAndView addQuiz(@PathVariable String userID, @PathVariable String courseID) {
        ModelAndView model = new ModelAndView("webpages/teacher/QuizTaker");
        List<Quizes> quizes = teacherCourseDAO.getQUIZByCourseID(Integer.parseInt(courseID));
        model.addObject("quizes", quizes);
        model.addObject("username", userID);
        model.addObject("courseID", courseID);
        return model;
    }

    @PostMapping(value = "/submit/{userID}/{courseID}/createQuiz", params = "action=add")
    public ModelAndView setQues(@PathVariable String userID, @PathVariable String courseID, HttpServletRequest request) {
        System.out.println(courseID);
        System.out.println("hello     ");
        String Ques = request.getParameter("Ques");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String ans = request.getParameter("ans");

        try {
            teacherCourseDAO.addQuiz(Integer.parseInt(courseID), Ques, option1, option2, option3, option4, ans);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{courseID}/createQuiz");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{courseID}/createQuiz");
        }
    }

    @RequestMapping(value = "/submit/{userID}/{courseID}/{quizID}/createQuiz")
    public ModelAndView deleteQues(@PathVariable String userID, @PathVariable String courseID, @PathVariable String quizID, HttpServletRequest request) {
        System.out.println(quizID);
        System.out.println("hello   " + request.getParameter(quizID));

        try {
            teacherCourseDAO.deleteQuiz(Integer.parseInt(quizID));
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{courseID}/createQuiz");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{courseID}/createQuiz");
        }
    }

    @PostMapping(value = "/submit/{userID}/{course_id}/{topicID}/DeleteTopic", params = "action=deleteTopic")
    public ModelAndView DeleteTopic(@PathVariable String userID, @PathVariable String course_id, @PathVariable String topicID, HttpServletRequest request) {
        Courses courses = teacherCourseDAO.GetInfoCourse(Integer.parseInt(course_id));
        int d = courses.getCourse_duration();
        try {
            teacherCourseDAO.deleteTopic(Integer.parseInt(topicID));
            teacherCourseDAO.ReduceCourseDuration(Integer.parseInt(course_id), d);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_id}/addTopic");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_id}/addTopic");
        }
    }


    @RequestMapping(value = "/{username}/{course_id}/setCourse")
    public ModelAndView SetCoursePage(@PathVariable String username, @PathVariable String course_id) {
        ModelAndView model = new ModelAndView("webpages/teacher/setCourse");
        model.addObject("username", username);
        model.addObject("course_id", course_id);
        Courses courses = teacherCourseDAO.GetInfoCourse(Integer.parseInt(course_id));
        model.addObject("courses", courses);
        return model;
    }

    @RequestMapping(value = "/{username}/{course_id}/{topic_id}/setTopic")
    public ModelAndView SetTopicPage(@PathVariable String username, @PathVariable String course_id, @PathVariable String topic_id) {
        ModelAndView model = new ModelAndView("webpages/teacher/setTopic");
        model.addObject("username", username);
        model.addObject("course_id", course_id);
        Topics topics = teacherCourseDAO.TopicInfo(Integer.parseInt(topic_id));
        model.addObject("topic_ID", topic_id);
        model.addObject("topics", topics);

        Courses courses = teacherCourseDAO.GetInfoCourse(Integer.parseInt(course_id));
        model.addObject("courses", courses);
        return model;
    }

    @RequestMapping(value = "/submit/{username}/{course_id}/SetCourse")
    public ModelAndView SetCourse(@PathVariable String username, @PathVariable String course_id, HttpServletRequest request) {
        String SetTitle = request.getParameter("sett");
        try {
            teacherCourseDAO.setCourse(Integer.parseInt(course_id), SetTitle);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{username}/{course_id}/addTopic");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{username}/{course_id}/addTopic");
        }
    }

    @PostMapping(value = "/submit/{username}/{course_id}/{topic_ID}/SetTopic", params = "action=setTopic")
    public ModelAndView SetCourse(@PathVariable String username, @PathVariable String course_id, @PathVariable String topic_ID, HttpServletRequest request) {
        try {
            teacherCourseDAO.setTopic(Integer.parseInt(topic_ID), request.getParameter("setname"), request.getParameter("setfile"));
            return new ModelAndView("redirect:/teacher/TeacherProfile/{username}/{course_id}/addTopic");
        } catch (DataIntegrityViolationException e) {
            System.out.println("hello          " + e);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{username}/{course_ic}/addTopic");
        }
    }


    @RequestMapping(value = "/{userID}", method = RequestMethod.GET)
    public ModelAndView TeacherCourse(@PathVariable String userID) {
        ModelAndView model = new ModelAndView("webpages/teacher/TeacherProfile");
        model.addObject("username", userID);
        List<Courses> createdCourseList = teacherCourseDAO.CreatedCourseList(userID);
        model.addObject("createdCourseList", createdCourseList);
        Users users = teacherCourseDAO.GetInfoUser(userID);
        Teachers teachers = teacherCourseDAO.GetInfoTeacher(userID);
        model.addObject("users", users);
        model.addObject("teachers", teachers);
        System.out.println(users);
        return model;
    }

    @RequestMapping(value = "/{username}/{courseID}/viewCoursePage")
    public ModelAndView viewCoursePage(@PathVariable String username, @PathVariable String courseID) {
        ModelAndView model = new ModelAndView("webpages/teacher/showCoursePage");
        model.addObject("username", username);
        Courses course = studentCourseDAO.getCourseInfoByID(Integer.parseInt(courseID));
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        model.addObject("course_info", course);
        model.addObject("topics_list", topics);

        model.addObject("forum_id", courseTopicsDAO.getForumIdOfCourse(Integer.parseInt(courseID)));
        model.addObject("duration", topics.size());
        return model;
    }

    @RequestMapping(path = "/{username}/{course_id}/{topic_id}/viewTopic", method = RequestMethod.GET)
    public ModelAndView ShowTopic(@PathVariable String username, @PathVariable String course_id, @PathVariable String topic_id) {
        System.out.println(username);
        ModelAndView model = new ModelAndView("webpages/teacher/showTopics");
        model.addObject("username", username);
        model.addObject("courseID", course_id);
        model.addObject("coursetitle", studentCourseDAO.getCourseTitle(Integer.parseInt(course_id)));
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(course_id));
        if (topic_id == null) {
            model.addObject("currentTopic", topics.get(0));
        } else {
            for (Topics t : topics) {
                if (t.getTopic_id() == Integer.parseInt(topic_id)) {
                    model.addObject("currentTopic", t);
                    break;
                }
            }
        }
        model.addObject("topics_list", topics);
        return model;
    }

    @RequestMapping(value = "/{userID}/{courseID}/addTopic", method = RequestMethod.GET)
    public ModelAndView addTopic(@PathVariable String userID, @PathVariable String courseID) {
        ModelAndView model = new ModelAndView("webpages/teacher/add_topic");
        model.addObject("username", userID);
        model.addObject("course_id", courseID);
        Courses courses = teacherCourseDAO.GetInfoCourse(Integer.parseInt(courseID));
        List<Topics> topics = teacherCourseDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        model.addObject("topics_list", topics);
        model.addObject("duration", topics.size());
        model.addObject("courses", courses);
        return model;
    }

    @RequestMapping(value = "/{userID}/stat", method = RequestMethod.GET)
    public ModelAndView TeacherStat(@PathVariable String userID) {
        ModelAndView model = new ModelAndView("webpages/teacher/stat");
        model.addObject("username", userID);
        model.addObject("userID", userID);
        List<Courses> createdCourseList = teacherCourseDAO.CreatedCourseList(userID);
        model.addObject("createdCourseList", createdCourseList);
        //List<Courses> studentList = teacherCourseDAO.StudentList(userID);
        //model.addObject("studentList",studentList);
        //System.out.println(studentList);
        return model;
    }

    @RequestMapping(value = "/submit/{userID}/{course_ID}/{quiz_ID}/editQuiz", method = RequestMethod.GET)
    public ModelAndView editQuiz(@PathVariable String userID, @PathVariable String course_ID, @PathVariable String quiz_ID) {
        ModelAndView model = new ModelAndView("webpages/teacher/EditQuiz");
        Quizes quizes = teacherCourseDAO.QuizInfo(Integer.parseInt(quiz_ID));
        model.addObject("quiz", quizes);
        return model;
    }

    @RequestMapping(value = "/submit/{userID}/{course_ID}/{quiz_ID}/editQuiz")
    public ModelAndView editQuizSub(@PathVariable String userID, @PathVariable String course_ID, @PathVariable String quiz_ID, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("webpages/teacher/EditQuiz");
        String ques = request.getParameter("Ques");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String ans = request.getParameter("ans");
        try {
            teacherCourseDAO.editQuiz(Integer.parseInt(quiz_ID), ques, option1, option2, option3, option4, ans);
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_ID}/createQuiz");
        } catch (DataIntegrityViolationException e) {
            return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/{course_ID}/createQuiz");
        }

    }

    @RequestMapping(value = "/{userID}/contact")
    public ModelAndView contactus(@PathVariable String userID) {
        ModelAndView model = new ModelAndView("webpages/teacher/t_contacts_admin");
        model.addObject("userID", userID);
        return model;
    }

    @RequestMapping(value = "/{userID}/home")
    public ModelAndView home(@PathVariable String userID) {
        ModelAndView model = new ModelAndView("webpages/teacher/stat");
        model.addObject("userID", userID);
        model.addObject("username", userID);
        List<Courses> courses = teacherCourseDAO.CreatedCourseList(userID);
        model.addObject("createdCourseList", courses);
        model.addObject("stat", teacherCourseDAO.Statistics(userID));
        return model;
    }

    @RequestMapping(value = "/{tid}/SearchStudent")
    public ModelAndView searchStudent(@PathVariable String tid, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("webpages/teacher/stat");
        model.addObject("userID", tid);
        model.addObject("username", tid);
        System.out.println(request.getParameter("s"));
        try {
            model.addObject("stat", teacherCourseDAO.Search(tid, request.getParameter("s")));
        } catch (EmptyResultDataAccessException e) {
        }
        return model;
    }

    @GetMapping("/{userID}/profile/edit")
    public ModelAndView editProfileView(@PathVariable String userID) {
        ModelAndView modelAndView = new ModelAndView("webpages/teacher/editProfile");
        Users users = teacherCourseDAO.GetInfoUser(userID);
        modelAndView.addObject("user", users);
        Teachers teachers = teacherCourseDAO.GetInfoTeacher(userID);
        modelAndView.addObject("teacher", teachers);
        modelAndView.addObject("username", userID);
        modelAndView.addObject("userID", userID);
        String s = "You need to insert correctly to update";
        modelAndView.addObject("s", s);
        return modelAndView;
    }

    public static boolean checkEmail(String email) {
        String regexPattern = "^(.+)@(\\S+)$";
        return Pattern.compile(regexPattern)
                .matcher(email)
                .matches();
    }

    @PostMapping(path = "/{userID}/editProfile/submit")
    public ModelAndView ProfileEdited(@PathVariable String userID, HttpServletRequest request) {
        Users users = teacherCourseDAO.GetInfoUser(userID);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String old = request.getParameter("old");
        String nP = request.getParameter("new");
        String newCon = request.getParameter("con");
        String t = request.getParameter("s");
        String d = request.getParameter("d");
        String s = "\\images\\" + request.getParameter("picture");
        if(request.getParameter("picture").isEmpty()){
            s=users.getPicture();
        }
        if (checkEmail(email)) {
            if (nP.equals(newCon) && old.equals(users.getPassword())) {
                teacherCourseDAO.editProfile(userID, s, name, nP, email);
                teacherCourseDAO.TeacherSet(userID, t, d);
                return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}");
            }
        }
        //unsuccessful
        return new ModelAndView("redirect:/teacher/TeacherProfile/{userID}/profile/edit");
    }
}
