package com.example.demo.util;

import com.example.demo.DAO.UsersDAO;
import com.example.demo.Model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    DataSource dataSource;
    @Autowired
    UsersDAO usersDAO;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        System.out.println("Hi there");
        auth.jdbcAuthentication()
                .dataSource(dataSource).usersByUsernameQuery("select user_id as username ,password ,enabled from users where user_id = ?")
                .authoritiesByUsernameQuery("select user_id as username, authority from users where user_id=?");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable().authorizeRequests()
                .antMatchers("/admin","/admin/**").hasRole("ADMIN")
                .antMatchers("/teacher", "/teacher/**").hasRole("TEACHER")
                .antMatchers("/student", "/student/**","/course","/course/**").hasRole("STUDENT")
                .antMatchers("/","/EPATHSHALA","/register","/epathshala").permitAll()
                .and().formLogin().loginPage("/login")
                .usernameParameter("user_id")
                .passwordParameter("password")
                .successHandler((request, response, authentication) -> {
                    // run custom logics upon successful login

                    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                    String username = userDetails.getUsername();
                    Users user = usersDAO.getUserInfo(username);
                    //String authority = user.getAuthority();
                    String redirectURL = request.getContextPath();
                    if(usersDAO.isAdmin(username)){
                        redirectURL = "/admin/"+username;
                    }else if(usersDAO.isTeacher(username)){
                        redirectURL = "/teacher/TeacherProfile/"+username+"/home";
                    }else if(usersDAO.isStudent(username)){
                        redirectURL = "/student/homepage/"+username;
                    }
                    System.out.println(redirectURL);
                    response.sendRedirect(redirectURL);
                }).and().exceptionHandling().accessDeniedPage("/login");
        http.formLogin().failureHandler(new AuthenticationFailureHandler() {

            @Override
            public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                                AuthenticationException exception) throws IOException, ServletException {
                System.out.println("Login failed");
                System.out.println(exception);
                System.out.println(request.getParameter("user_id")+" "+request.getParameter("password"));
                response.sendRedirect("/login");
            }
        });

    }
    /*
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder()
    {
        return new BCryptPasswordEncoder();
    }*/
    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }
}
