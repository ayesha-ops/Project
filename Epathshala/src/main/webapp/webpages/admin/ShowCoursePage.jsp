<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/6/2022
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
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


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>.checked {
        color: orange;
    }</style>
    <title>Admin</title>
</head>

<body style="background-color:white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showCourses" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
<%--        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>--%>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/${adminID}">
                    <i class="fa fa-fw fa-home"></i>Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/${adminID}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showCourses"><i class="fa fa-book" aria-hidden="true"></i>Course</a>
            </li>

            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showTeachers">
                    <i class="fa fa-user" aria-hidden="true"></i></i>Teacher
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showStudents">
                    <i class="fa fa-user" aria-hidden="true"></i></i>Students
                </a>
            </li>

        </ul>

        <form class="d-flex" style="float:left">
            <div class="container-fluid">
                <form class="d-flex">

                    <a href="/admin/${adminID}/showProfile" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Profile</a>
                    <a href="/logout" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Log Out</a>

                </form>
            </div>
        </form>

    </div>
</nav>
<br><br><br><br>

<div class="mx-auto" style="width: 1100px;">
    <img src="${course_info.course_pic}" class="rounded float-left" style="padding-right: 50px; padding-left: 20px;"
         width="500" height="300" align="right" border="5px solid #555" alt="">
    <div class="rounded float-left">
        <h1 class="card-title" style="align: center"><i class="fa fa-wpexplorer"
                                                        aria-hidden="true"></i>${course_info.title}</h1>
        <!--<p class="card-text"><br>
            for First year</p>-->
        <!--write the name of Course_TITLE-->
        <p class="card-text"><h6> Subject : ${course_info.subject} </h6> </p><!-write the name of Subject->
        <p class="card-text"><h6> Duration : ${duration} Hour </h6></p><!-write the name of duration->
        <p class="card-text">
            <c:forEach var="i" begin="1" end="${course_info.rating}">
                <span class="fa fa-star checked">
                </span>
            </c:forEach>
            <c:forEach var="i" begin="${course_info.rating+1}" end="5">
                <span class="fa fa-star">
                </span>
            </c:forEach>
        </p>

    </div>
    <br><br>
    <form action="/admin/submit/${adminID}/${courseID}/DeleteCourse" method="post">
        <button type="submit" name="action" value = "deleteCourse" class="btn btn-lg btn-danger" >
            Delete this course</button>
    </form>
    <br><br>

</div>
<br><br><br><br>
<div class="mx-auto" style="width: 800px; float:left; padding-left:60px">
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne">
                    <i class="fa fa-grav" aria-hidden="true"></i>Topics
                </button>
            </h2>

            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                 data-bs-parent="#accordionExample">
                <c:forEach var="i" begin="1" end="${topics_list.size()}">
                    <h3>
                    <a class="btn" data-bs-toggle="collapse" href="" role="button" aria-expanded="false"
                       aria-controls="collapseExample">
                        <i class="fa fa-puzzle-piece" aria-hidden="true"></i> Topic ${i}
                    </a>
                    </h3>
                    <br>

                        <div class="card card-body">
                            <a href="/admin/${adminID}/${course_info.course_id}/${topics_list.get(i-1).topic_id}/topicPage"><i
                                    class="fa fa-book" aria-hidden="true">
                                    ${topics_list.get(i-1).topic_name}
                            </i></a>
                        </div>

                   <!-- <div class="collapse" id="collapseExample1">

                    </div>-->
                    <br>
                </c:forEach>



            </div>
        </div>
    </div>
    <br><br>
</div>

</body>
</html>
