package com.example.demo.Controller;

import com.example.demo.DAO.CourseTopicsDAO;
import com.example.demo.DAO.QuizAndMarksDAO;
import com.example.demo.DAO.StudentCourseDAO;
import com.example.demo.Model.Courses;
import com.example.demo.Model.Quizes;
import com.example.demo.Model.Takes_exam;
import com.example.demo.Model.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value="/course/quiz-page")
public class CourseQuizController {
    @Autowired
    QuizAndMarksDAO quizAndMarksDAO;
    @Autowired
    StudentCourseDAO studentCourseDAO;
    @Autowired
    CourseTopicsDAO courseTopicsDAO;

    @RequestMapping(value="/submit-quiz/{userID}/{courseID}",method= RequestMethod.POST)
    public ModelAndView checkedQuiz(@PathVariable String userID, @PathVariable String courseID,HttpServletRequest request) {
        ModelAndView model = new ModelAndView("webpages/quiz/passedQuizPage");
        model.addObject("username",userID);
        model.addObject("courseID",courseID);
        model.addObject("courseTitle",studentCourseDAO.getCourseTitle(Integer.parseInt(courseID)));
        model.addObject("totalMarks",quizAndMarksDAO.get_fullMarks(Integer.parseInt(courseID)));
        List<Quizes> quizes = quizAndMarksDAO.get_QuizQuesAns(Integer.parseInt(courseID));
        model.addObject("quizes",quizes);
        boolean[] ok = new boolean[quizes.size()];
        String[] givenAns=new String[quizes.size()];
        int cnt=0;
        for(int i=0;i<quizes.size();i++){ //2 bar ii same order e ques ashtse , tai jsp theke ques abr pathacchi na
            if(request.getParameter("ans"+i)==null) {
                ok[i] = false;
                continue;
            }
            givenAns[i]=request.getParameter("ans"+i);
            ok[i]=(quizes.get(i).getQues_ans().equals(givenAns[i]));
            System.out.println(quizes.get(i).getQues_ans()+"/ /"+givenAns[i]+ok[i]);
            if(ok[i]) cnt++;
        }

        if(cnt > quizAndMarksDAO.get_obtainedMarks(userID,Integer.parseInt(courseID))){
            for(int i=0;i<quizes.size();i++){
                //if(quizes.get(i).getQuiz_ans().equals(request.getParameter("ans"+i))){
                if(ok[i]){
                    quizAndMarksDAO.updateMarks(userID,quizes.get(i).getQuiz_id(),1);
                }else{
                    quizAndMarksDAO.updateMarks(userID,quizes.get(i).getQuiz_id(),0);
                }
            }
        }
        //System.out.println(request.getParameter("question0"));
        model.addObject("givenAns",givenAns);
        model.addObject("highestMarks",quizAndMarksDAO.get_obtainedMarks(userID,Integer.parseInt(courseID)));
        model.addObject("obtainedMarks",cnt);
        model.addObject("ok",ok);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
    @RequestMapping(value="/marks/{userID}/{courseID}",method= RequestMethod.GET)
    public ModelAndView marks(@PathVariable String userID, @PathVariable String courseID) {
        ModelAndView model = new ModelAndView("webpages/course/marks");
        model.addObject("username", userID);
        model.addObject("courseID",courseID);
        model.addObject("courseTitle",studentCourseDAO.getCourseTitle(Integer.parseInt(courseID)));
        List<Topics> topics = courseTopicsDAO.getTopicsByCourseID(Integer.parseInt(courseID));
        model.addObject("topics_list",topics);
        int obtained_marks = quizAndMarksDAO.get_obtainedMarks(userID,Integer.parseInt(courseID));
        int full_mark = quizAndMarksDAO.get_fullMarks(Integer.parseInt(courseID));
        model.addObject("obtained_mark",obtained_marks);
        model.addObject("full_mark",full_mark);
        model.addObject("percentage",(obtained_marks*100)/full_mark);
        model.addObject("is_passed",quizAndMarksDAO.is_passed_course(userID,Integer.parseInt(courseID)));
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        model.addObject("forum_id",courseTopicsDAO.getForumIdOfCourse(Integer.parseInt(courseID)));
        return model;
    }
    @RequestMapping(value="/show-quiz/{userID}/{courseID}",method= RequestMethod.GET)
    public ModelAndView showQuiz(@PathVariable String userID, @PathVariable String courseID) {
        List<Quizes> quizes = quizAndMarksDAO.get_QuizQuesAns(Integer.parseInt(courseID));
        ModelAndView model = new ModelAndView("webpages/quiz/unpassedQuizPage");
        model.addObject("username",userID);
        model.addObject("courseID",courseID);
        model.addObject("courseTitle",studentCourseDAO.getCourseTitle(Integer.parseInt(courseID)));
        model.addObject("totalMarks",quizAndMarksDAO.get_fullMarks(Integer.parseInt(courseID)));
        model.addObject("obtainedMarks",quizAndMarksDAO.get_obtainedMarks(userID,Integer.parseInt(courseID)));
        model.addObject("quizes",quizes);
        List<String> allSubs = studentCourseDAO.getAllSubjects();
        model.addObject("all_subjects",allSubs);
        return model;
    }
}
