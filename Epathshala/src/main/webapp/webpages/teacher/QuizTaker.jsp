<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2/17/2022
  Time: 5:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">

    <title><i class="fa fa-telegram" aria-hidden="true">Coursera</i></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>.checked {
        color: orange;
    }</style>
    <TITLE>Epathshsala Teacher</TITLE>
</head>

<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}/${courseID}/addTopic" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
<%--        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>--%>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}/home">
                    <i class="fa fa-fw fa-home"></i>Home</a>

            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>


        </ul>

        <form class="d-flex" style="float:left">
            <div class="container-fluid">
                <form class="d-flex">

                    <a href="/teacher/TeacherProfile/${userID}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Profile</a>
                    <a href="/teacher/TeacherProfile/news-forum/view-all-topics/${userID}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Forum</a>
                    <a href="/logout" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Log Out</a>

                </form>
            </div>
        </form>
    </div>

</nav>
<br><br><br><br>
<div class="mx-auto" style="width: 1100px;">
    <form action="/teacher/TeacherProfile/submit/${userID}/${courseID}/createQuiz" method ="post">
        <label for="0" class="form-label">WRITE THE QUESTION</label>
        <input type="text" name="Ques" class="form-control" id="0" placeholder="Matrix">
        <br>
        <label for="1" class="form-label">Option1</label>
        <input type="text" name="option1" class="form-control" id="1" placeholder="Matrix">
        <br>
        <label for="2" class="form-label">Option2</label>
        <input type="text" name="option2" class="form-control" id="2" placeholder="Matrix">
        <br>
        <label for="3" class="form-label">Option3</label>
        <input type="text" name="option3" class="form-control" id="3" placeholder="Matrix">
        <br>
        <label for="4" class="form-label">Option4</label>
        <input type="text" name="option4" class="form-control" id="4" placeholder="Matrix">
        <br>
        <label for="5" class="form-label">ANS</label>
        <input type="text" name="ans" class="form-control" id="5" placeholder="Matrix">
        <br>
        <button type="submit" class="btn btn-primary" name="action" value="add">Save changes</button>
    </form>

    <br><br>
    <h2>Questions : </h2> <br><br>
<c:forEach var="i" begin="1" end="${quizes.size()}">
    <div class="question-panel" style="margin-left: 50px">
    <div class="question" >
    <h1>${i}.${quizes.get(i-1).quiz_ques}</h1><br>
    </div>

    <div class="answer">
    <%--   ans${i-1} ki kaaj kore na?              --%>
    a) ${quizes.get(i-1).option1}&nbsp;&nbsp;&nbsp;&nbsp;b) ${quizes.get(i-1).option2}&nbsp;&nbsp;&nbsp;&nbsp;c)${quizes.get(i-1).option3}&nbsp;&nbsp;&nbsp;&nbsp;d)${quizes.get(i-1).option4}&nbsp;&nbsp;&nbsp;&nbsp;
        <br><br>
        Ans: ${quizes.get(i-1).ques_ans}<br><br>
    </div>
        <a href="/teacher/TeacherProfile/submit/${username}/${courseID}/${quizes.get(i-1).quiz_id}/editQuiz">
            <button class="btn btn-lg btn-success" >
                Edit</button><br><br>
        </a>
        <form action="/teacher/TeacherProfile/submit/${username}/${courseID}/${quizes.get(i-1).quiz_id}/createQuiz" value="post">
            <button type="submit" name="action" value = "deleteQUES" class="btn btn-lg btn-danger" >
                Delete</button>
        </form>
        <hr>
</div>
    </c:forEach>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

