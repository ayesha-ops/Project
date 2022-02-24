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

    <title><i class="fa fa-telegram" aria-hidden="true"></i>Coursera</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>.checked {
        color: orange;
    }</style>
    <title>Teacher Profile & Add Course</title>
</head>

<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}/home" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
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
<div class="mx-auto" style="width: 1100px">
    <img src="${users.picture}" class="rounded float-left" style="padding-right: 50px; padding-left: 20px;" width="400" height="300"
         align="right">
    <div class="rounded float-left">
        <h1 class="card-title" style="align: center;color:blue"><i class="fa fa-user" aria-hidden="true"
                                                                   style="font-size:30px; color:blue"></i> ${users.full_name}
        </h1><!-write the course_ID->
        <p class="card-text">${teachers.t_designation}</p>
        <p class="card-text">Speciality:${teachers.t_speciality}</p>
        <p class="card-text">Email:${users.email}</p>
        <a href="/teacher/TeacherProfile/${username}/profile/edit" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Edit Profile</a>
    </div>
    <br><br> <br><br> <br><br> <br><br>
    <h3>My courses</h3>
    <button type="button" class="btn btn-outline-success" style="padding-right: 10px; padding-left: 50px; float:right"
            data-bs-toggle="modal" data-bs-target="#exampleModal">
        Add a new Course
    </button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">Add Course
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>
            <div class="modal-body">
                <form action="/teacher/TeacherProfile/submit/${username}" method="post">
                    <label for="exampleFormControlInput1" class="form-label">Name of the Subject</label>
                    <input type="text" name="subjectName" class="form-control" id="exampleFormControlInput1"
                           placeholder="Math">
                    <label for="exampleFormControlInput3" class="form-label">Title of Course</label>
                    <input type="text" name="Title" class="form-control" id="exampleFormControlInput3"
                           placeholder="Matrix">
                    <br>
                    <br>
                    <input type="file" class="form-control" name="picture" id="picture"><br>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="action" value="saveCourse">Save changes</button>
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>
<hr>
<c:forEach var="course" items="${createdCourseList}" varStatus="status">

    <h5>&nbsp;&nbsp;<i class="fa fa-graduation-cap" style="font-size:20px;color:red"></i>
            ${course.title}</h5>
    &nbsp;&nbsp;
    <a href="${username}/${course.course_id}/viewCoursePage">
        <button class="btn btn-primary">View</button>
    </a>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="${username}/${course.course_id}/addTopic">
        <button class="btn btn-primary">Add Contents</button>
    </a>
    </form>
    <hr>
</c:forEach>
</div>
<hr>
<br><br>
</div>
</body>

</html>