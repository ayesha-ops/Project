<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"
            integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">

    <title> EPathshala Admin View </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

    </style>
</head>
<body style="background-color:white" >
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showCourses" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
        <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showStudents" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>
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
<br><br><br>

<div class="mx-auto" style="width: 1100px;">
    <nav class="navbar" style="background-color: white">
        <div class="container-fluid">
            <form class="d-flex" action="/admin/${adminID}/SearchTeacher">
                <input class="form-control me-2" name="s" type="search" placeholder="Search for Teacher" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </nav>
<div>
    <h4>Registered Teachers</h4>
        <c:forEach var="course" items="${teachers}" varStatus="status">
            <div class="container" style="border-bottom: blue ;border-width: medium">
                <div class="row">
                    <div class="col" style="background-color:white;color:black"><br><br><br>
                        <a  aria-current="page" href="/admin/${adminID}/${course.get("ID")}/showTeacherPage">
                            <h3><i class="fa fa-user" aria-hidden="true"></i> ${course.get("NAME")}
                                <br></h3>
                        </a>
                        <span></span></div>
                    <hr>
                </div>
            </div>
            <br>
        </c:forEach>
</div>
</div>
</body>
</html>