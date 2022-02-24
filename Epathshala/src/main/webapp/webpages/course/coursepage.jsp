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

    <title> EPathshala Course (Student View) </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>.checked {
        color: orange;
    }</style>
</head>

<body style="background-color:white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!--
        <a class="nav-link active" aria-current="page" href="course_content.html" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
        <a class="nav-link active" aria-current="page" href="Week1.html" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>
        -->

        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}"><i
                        class="fa fa-fw fa-home"></i>Home</a>

            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-atom"></i><i class="fa fa-grav" aria-hidden="true"></i></i>Explore
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach var="subject" items="${all_subjects}" varStatus="status">
                        <li><a class="dropdown-item" href="/student/homepage/courses-of-subject/${username}/${subject}">${subject}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>

        <form action="/student/homepage/courses-of-searching/${username}" method="post">
            <div class="input-group">
                <input class="form-control" name="search_key" type="search" placeholder="Search" aria-label="Search">
                <button class="btn" type="submit">
                    <i class="fa fa-search" style="font-size:24px;"></i></button>
            </div>
        </form>


        <form class="d-flex" style="float:left">

            <button type="button" class="btn">
                <i class="fa fa-bell" style="font-size:23px;"></i>
            </button>
            &nbsp &nbsp

            <div class="dropdown">
                <!-- Example split danger button -->
                <div class="btn-group" style="padding-right: 50px;">
                    <button type="button" class="btn"><i class="fa fa-user" aria-hidden="true"
                                                         style="font-size:30px;"></i></button>
                    <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/student/homepage/my-course/${userID}">My Courses</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><a class="dropdown-item" href="/student/news-forum/view-all-topics/${username}">Forum</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/logout">LogOut</a></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</nav>
<br><br><br><br>
<div class="mx-auto" style="width: 1200px;">
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
        </p><!-write rating using loop->
    </div>
    <br><br>
    <!--enroll , in prgress , finished-->
    <c:if test="${isEnrolled == true}">
        <h4>You Have Already Enrolled In This Course</h4>
        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <a href="/course/topicspage/${username}/${course_info.course_id}"><b>Pick Where You Left Off</b></a>
        </button>
    </c:if>

    <c:if test="${isEnrolled == false}">
        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <b>Enroll Now</b>
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        DO YOU WANT TO ENROLL IN THIS COURSE?
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-outline-warning"
                           href="/course/coursepage/enrollCourse/${username}/${course_info.course_id}" role="button">
                            Confirm</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                    </div>
                </div>
            </div>
        </div>
    </c:if>

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
                    <c:if test="${isEnrolled == true}">
                        <div class="card card-body">
                            <a href="/course/topicspage/${username}/${course_info.course_id}/${topics_list.get(i-1).topic_id}"><i
                                    class="fa fa-book" aria-hidden="true">
                                    ${topics_list.get(i-1).topic_name}
                            </i></a>
                        </div>
                    </c:if>
                    <c:if test="${isEnrolled == false}">
                        <div class="card card-body">
                            <a href=""><i class="fa fa-book" aria-hidden="true">${topics_list.get(i-1).topic_name} </i></a>
                        </div>
                    </c:if>
                   <!-- <div class="collapse" id="collapseExample1">

                    </div>-->
                    <br>
                </c:forEach>
                <c:if test="${isEnrolled == true}">
                    <div class="card card-body">
                        <a href="/course/quiz-page/show-quiz/${username}/${course_info.course_id}"><i class="fa fa-book" aria-hidden="true"> Quiz </i></a>
                    </div>
                    <div class="card card-body">
                        <a href="/course/quiz-page/marks/${username}/${courseID}"><i class="fa fa-book" aria-hidden="true"> Marks </i></a>
                    </div>
                    <div class="card card-body">
                        <a href="/student/news-forum/view-specific-forum/${username}/${forum_id}"><i class="fa fa-book" aria-hidden="true"> Discussion Forum </i></a>
                    </div>
                </c:if>
                <c:if test="${isEnrolled == false}">
                    <div class="card card-body">
                        <a href=""><i class="fa fa-book" aria-hidden="true"> Quiz </i></a>
                    </div>
                    <div class="card card-body">
                        <a href=""><i class="fa fa-book" aria-hidden="true"> Discussion Forum </i></a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <br><br>
</div>

</body>
</html>
