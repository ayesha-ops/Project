<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">

    <title><i class="fa fa-telegram" aria-hidden="true">Coursera</i></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>.checked {
        color: orange;
    }</style>
    <title>Epathshala Teacher</title>
</head>
<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
<%--        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>--%>
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
    <img src="${courses.course_pic}" class="rounded float-left" style="padding-right: 50px; padding-left: 20px;" width="550" height="300"
         align="right">
    <div class="rounded float-left">
        <h1 class="card-title" style="align: center"><i class="fa fa-wpexplorer" aria-hidden="true"></i>${courses.title}
        </h1><!-write the course_ID->
        <p class="card-text">${courses.subject}</p>
        <p class="card-text">COURSE DURATION : ${courses.course_duration}hr</p>
    </div>
    <br><br>
    <a href="/teacher/TeacherProfile/${username}/${course_id}/setCourse">
        <button type="button" class="btn btn-outline-success" style="padding-right: 10px;">
            Edit
        </button>
    </a>
    <br><br>

    <a href="/teacher/TeacherProfile/${username}/${course_id}/createQuiz">
        <button type="button" class="btn btn-outline-success" style="padding-right: 10px;">
            Add Quiz
        </button>
    </a>
    <br><br>
    <form action="/teacher/TeacherProfile/submit/${username}/${course_id}/DeleteCourse" method="post">
        <button type="submit" name="action" value="deleteCourse" class="btn btn-lg btn-danger">Delete this course
        </button>
    </form>

    <br>
    <br>
    <h4>Add Topic</h4>

    <form class="form-inline" action="/teacher/TeacherProfile/submit/${username}/${course_id}/addTopic" method="post">
        <div class="form-group mb-2">
            <input type="text" name="topic" class="form-inline" id="exampleFormControlInput1" placeholder="Topic Title" size="100px">
        </div>
        <div class="form-group mb-2">
            <input cols="10" type="text" name="topicFile" class="form-inline" id="exampleFormControlInput2"
                   placeholder="embeddedVideo" size="100px">
        </div>
        <button type="submit" class="btn btn-primary mb-2" name="action" value="saveTopic">Save this Topic</button>
    </form>

    <hr>
    <h1>Topics</h1><br><br>
    <c:forEach var="i" begin="1" end="${topics_list.size()}">
        <h5><i class="fa fa-graduation-cap" style="font-size:20px;color:red"></i> ${topics_list.get(i-1).topic_name}
        </h5>
        <br>
        <a href="/teacher/TeacherProfile/${username}/${courses.course_id}/${topics_list.get(i-1).topic_id}/viewTopic">
            <button class="btn btn-primary">viewTopicFile</button>
        </a>
        <a href="/teacher/TeacherProfile/${username}/${courses.course_id}/${topics_list.get(i-1).topic_id}/setTopic">
            <button class="btn btn-primary">Edit</button>
        </a>
        <br> <br>
        <form action="/teacher/TeacherProfile/submit/${username}/${course_id}/${topics_list.get(i-1).topic_id}/DeleteTopic"
              method="post">
            <button type="submit" name="action" value="deleteTopic" class="btn btn-lg btn-danger">Delete</button>
        </form>
        <hr>
    </c:forEach>
    <br><br>
</div>
</body>
</html>