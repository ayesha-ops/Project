package com.example.demo.Controller;

import com.example.demo.DAO.UsersDAO;
import com.example.demo.Model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {
    @Autowired
    UsersDAO usersDAO;

    @RequestMapping(value={"/","/EPATHSHALA","/login","/epathshala"},method= RequestMethod.GET)
    public ModelAndView login(ModelMap model,String error, String logout, String verified) {
        System.out.println(model.getAttribute("user_id"));
        System.out.println(model.getAttribute("password"));
        ModelAndView mv = new ModelAndView("webpages/user/login");
        mv.addObject("verified", verified);
        mv.addObject("users",new Users());
        if (error != null) {
            //System.out.println(error);
            mv.addObject("error", "Your username or password is invalid.");
        }

        if (logout != null) {
           mv.addObject("logout", "You have been logged out successfully.");
        }
        return mv;
    }
    @GetMapping("/register")
    public ModelAndView register(ModelMap modelMap, String error){
        modelMap.put("users", new Users());

        ModelAndView mv = new ModelAndView("webpages/user/registerpage");
        mv.addObject("users",new Users());
        if(error != null) {
            modelMap.put("error", "This username is already taken");
        }
        return mv;
    }
    @PostMapping("/register")
    public String register(@Validated @ModelAttribute("users") Users users, BindingResult bindingResult, ModelMap modelMap){
        if (usersDAO.isDuplicatedUserID(users.getUser_id())) {
            bindingResult.rejectValue("username", "", "This username has already been taken!");
        }

        if (bindingResult.hasErrors()) {
            return "redirect:/register?error=error";
        }
        if(users.getEmail()==null||users.getUser_id()==null||users.getPassword()==null) return "redirect:/register?error=error";
        Users user=new Users();
        user.setEmail(users.getEmail());
        user.setUser_id(users.getUser_id());
        user.setAuthority(users.getAuthority());
        user.setPassword(users.getPassword());
        user.setPicture("\\images\\"+users.getPicture());
        user.setFull_name(users.getFull_name());
        user.setDate_of_birth(users.getDate_of_birth());
        user.setInstitution(users.getInstitution());
        user.setEnabled('Y');
        usersDAO.saveUser(user);
        System.out.println(user);
        if(user.getAuthority().equals("ROLE_TEACHER")) return "redirect:"+"/teacher/TeacherProfile/"+user.getUser_id()+"/home";
        else if(user.getAuthority().equals("ROLE_STUDENT")) return "redirect:"+"/student/homepage/"+user.getUser_id();
        //else if(user.getAuthority().equals("ROLE_ADMIN")) return "redirect:"+"/admin/"+user.getUser_id();
        else return "redirect:/register?error=error";
    }
}
