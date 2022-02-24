<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/18/2022
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <title> EPathshala Student View </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .course {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .course .box {
            flex: 1 1 15rem;
            border-radius: .5rem;
            border: .1rem solid rgba(0, 0, 0, .1);
            padding: 1rem;
            position: relative;
            color: greenyellow;
        }

        .course .box img {
            height: 7rem;
            width: 50%;
        }

        .course .box .amount {
            position: absolute;
            top: 1rem;
            left: 1rem;
            font-size: 2rem;
            padding: .5rem 1rem;
            background: pink;
            color: #fff;
            border-radius: .5rem;
        }

        .course .box .stars i {
            color: violet;
            font-size: 1.5rem;
            padding: 1rem 0;
        }

        .course .box h3 {
            color: navy;
            font-size: 2.5rem;
        }

        .course .box p {
            color: #666;
            font-size: 1.5rem;
            padding: .5rem 0;
        }
    </style>
</head>
<body style="background-color:lightyellow">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!--<a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>-->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}"><i
                        class="fa fa-fw fa-home"></i>Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}/contact"><i
                        class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-grav" aria-hidden="true"></i>Explore
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach var="subject" items="${all_subjects}" varStatus="status">
                        <li><a class="dropdown-item"
                               href="/student/homepage/courses-of-subject/${username}/${subject}">${subject}</a></li>
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
                        <button type="button" class="btn dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">
                            <span class="visually-hidden">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/student/homepage/my-course/${username}">My Courses</a>
                            </li>
                            <li><a class="dropdown-item" href="/student/${username}/profile">Profile</a></li>
                            <li><a class="dropdown-item"
                                   href="/student/news-forum/view-all-topics/${username}">Forum</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/logout">LogOut</a></li>
                        </ul>
                    </div>
                </div>
            </form>
    </div>
</nav>
<br><br><br>

<ul class="nav nav-tabs" id="myTab" role="tablist" style="background-color: lightcyan">
    <li class="nav-item" role="presentation">
        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                role="tab" aria-controls="home" aria-selected="true"><b>Home</b>
        </button>
    </li>
    <li class="nav-item" role="presentation">
        <button class="nav-link" id="progress-tab" data-bs-toggle="tab" data-bs-target="#progress" type="button"
                role="tab" aria-controls="progress" aria-selected="false"><b>In progress</b>
        </button>
    </li>
    <li class="nav-item" role="presentation">
        <button class="nav-link" id="completed-tab" data-bs-toggle="tab" data-bs-target="#completed" type="button"
                role="tab" aria-controls="completed" aria-selected="false"><b>Completed</b>
        </button>
    </li>
</ul>
<section class="tab-content" id="myTabContent">
    <!-- home tab -->
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        <p>
            <section class="course">
                <h1><span class="badge bg-dark">Most rated Courses</span></h1>
                <br>

                <c:forEach var="course" items="${mostRatedCourseList}" varStatus="status">
                <div class="box">
                    <img src="${course.course_pic}" class="d-block w-100" alt="" style=" border-color: #162636">
                    <h3>${course.title}</h3>
        <p class="card-text">${course.subject}<br>Rating: ${course.rating}</p>
        <a href="/course/coursepage/${username}/${course.course_id}" class="btn btn-primary">View Course Page</a>
    </div>
    </c:forEach>
</section>

<section class="tab-content" id="myTabContent2">
    <!-- home tab -->
    <div class="tab-pane fade show active" id="home2" role="tabpanel" aria-labelledby="home-tab">
        <p>
            <section class="course">
                <h1><span class="badge bg-dark">Most Popular Courses</span></h1>
                <br>

                <c:forEach var="course" items="${popularCourseList}" varStatus="status">
                <div class="box">
                    <img src="${course.course_pic}" class="d-block w-100" alt="" style=" border-color: #162636">
                    <h3>${course.title}</h3>
        <p class="card-text">${course.subject}<br>Rating: ${course.rating}</p>
        <a href="/course/coursepage/${username}/${course.course_id}" class="btn btn-primary">View Course Page</a>
    </div>
    </c:forEach>
</section>

</div>

</div>
<!-- end of home tab -->
<!-- in progress tab-->
<div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab"><br><br><br>
    <c:forEach var="course" items="${inProgressCourseList}" varStatus="status">
        <div class="container" style="border-bottom: blue ;border-width: medium">
            <div class="row">
                <div class="col" style="background-color:#000080;color:white">
                    courses in progress
                    <button type="button" class="btn btn-outline-primary"
                            style="float:right;background-color:#000080;color:white;border:none">...
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col" style="background-color:white;color:black"><br><br><br>
                    <h1>${course.title}
                        <button class="btn btn-primary" type="submit" style="float:right">
                            <a href="/course/coursepage/${username}/${course.course_id}" class="btn btn-primary">View
                                Course Page</a>
                        </button>
                    </h1>
                    <p>${course.subject}</p>
                    <span class="badge bg-success">in progress</span><br><br></div>
            </div>
        </div>
        <br>
    </c:forEach>
</div>
<!-- end of progress-->
<!-- completed course-->

<div class="tab-pane fade" id="completed" role="tabpanel" aria-labelledby="completed-tab"><br><br><br>
    <c:forEach var="course" items="${completedCourseList}" varStatus="status">
        <div class="container" style="border-bottom: blue ;border-width: medium">
            <div class="row">
                <div class="col" style="background-color:#000080;color:white">
                    You have completed this course
                    <button type="button" class="btn btn-outline-primary"
                            style="float:right;background-color:#000080;color:white;border:none">...
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col" style="background-color:white;color:black"><br><br><br>
                    <h1>${course.title}
                        <button class="btn btn-primary" type="submit" style="float:right ">
                            <a href="/course/quiz-page/marks/${username}/${course.course_id}" class="btn btn-primary">View
                                Marks</a></button>
                    </h1>
                    <p>${course.subject}</p>
                    <span class="badge bg-danger">Completed</span><br><br></div>
            </div>
        </div>
        <br>
    </c:forEach>
</div>
<!-- end of completed -->

</div>
</body>
</html>
