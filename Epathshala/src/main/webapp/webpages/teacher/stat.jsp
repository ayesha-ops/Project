<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">
    <title>Teacher Home</title>
</head>
<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%--        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>--%>
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${userID}/contact" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${userID}/home">
                    <i class="fa fa-fw fa-home"></i>Home</a>

            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${userID}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
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
<br><br><br>


<div class="wrapper d-flex align-items-stretch">


    <div id="content" class="p-4 p-md-5">
        <!-- Vertically centered modal -->
        <!-- Button trigger modal -->
        <div class="mx-auto" style="width: 800px;align-content: center; background-color:white;">

            <nav class="navbar" style="background-color: white">
                <div class="container-fluid">
                    <form class="d-flex" action="/teacher/TeacherProfile/${userID}/SearchStudent" method="post">
                        <input class="form-control me-2" name="s" type="search" placeholder="Search for any Student" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>
            <div>

            <br><br>
            <div class="container" style="width: 800px;color:black">
                <div class="row">
                    <div class="col">
                        Student Name
                    </div>
                    <div class="col">
                        Student email ID
                    </div>
                    <div class="col">
                        Course
                    </div>
                    <div class="col">
                        Student ID
                    </div>
                    <div class="col">
                        Student Class
                    </div>
                </div>
                <c:forEach var="course" items="${stat}" varStatus="status">
                <hr>
                <div class="row">
                    <div class="col">
                    ${course.get("NAME")}
                    </div>
                    <div class="col">
                            ${course.get("EMAIL")}
                    </div>
                    <div class="col">
                            ${course.get("Course")}
                    </div>
                    <div class="col">
                            ${course.get("Student")}
                    </div>
                    <div class="col">
                            ${course.get("CLASS")}
                    </div>
                </div>

                </c:forEach><hr>
            </div>
            <br><br>
                <br><br>
        </div>
    </div>
</div>
</div>
</body>
</html>