package com.example.demo.Controller;

import com.example.demo.DAO.*;
import com.example.demo.Model.Students;
import com.example.demo.Model.Users;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value="/student")
public class StudentProfileController {
    @Autowired
    private StudentPageDAO studentPageDAO;
    @Autowired
    private StudentCourseDAO studentCourseDAO;
    @Autowired
    private TeacherCourseDAO teacherCourseDAO;
    @Autowired
    private StudentProfileDAO studentProfileDAO;
    @Autowired
    private AdminPageDAO adminPageDAO;

    @GetMapping("/{userID}/profile")
    public ModelAndView ProfileView(@PathVariable String userID){
        ModelAndView modelAndView = new ModelAndView("webpages/student/StudentProfile");
        modelAndView.addObject("username",userID);
        Students students = adminPageDAO.GetInfoStudent(userID);
        modelAndView.addObject("s",students);
        Users users = studentProfileDAO.getUserInfo(userID);
        modelAndView.addObject("user",users);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        modelAndView.addObject("all_subjects",allSubs);
        return modelAndView;
    }
    @GetMapping("/{userID}/profile/edit")
    public ModelAndView editProfileView(@PathVariable String userID){
        ModelAndView modelAndView = new ModelAndView("webpages/student/Studentedit");
        modelAndView.addObject("username",userID);
        Students students = adminPageDAO.GetInfoStudent(userID);
        modelAndView.addObject("s",students);
        Users users = studentProfileDAO.getUserInfo(userID);
        modelAndView.addObject("user",users);
        System.out.println(users);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        modelAndView.addObject("all_subjects",allSubs);
        return modelAndView;
    }
    public static boolean checkEmail(String email){
        String regexPattern = "^(.+)@(\\S+)$";
        return Pattern.compile(regexPattern)
                .matcher(email)
                .matches();
    }

    @RequestMapping(path = "/{userID}/editProfile/submit")
    public ModelAndView  ProfileEdited(@PathVariable String userID, HttpServletRequest request) {
        Users users = studentProfileDAO.getUserInfo(userID);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String old = request.getParameter("old");
        String nP = request.getParameter("new");
        String newCon = request.getParameter("con");
        String t = request.getParameter("s");
        String inst=request.getParameter("institution");
        String s = "\\images\\" + request.getParameter("picture");

        if(request.getParameter("picture").isEmpty()){
            s=users.getPicture();
        }
        if (checkEmail(email)) {
            if (nP.equals(newCon) && old.equals(users.getPassword())) {
                studentProfileDAO.editProfile(userID,inst,s,name,nP,email);//String userID,String inst,String p, String name,String Pass, String email
               studentProfileDAO.setStudent(userID,t);
                return new ModelAndView("redirect:/student/{userID}/profile");
            }
        }
        //unsuccessful
        return new ModelAndView("redirect:/student/{userID}/profile/edit");
    }
}
