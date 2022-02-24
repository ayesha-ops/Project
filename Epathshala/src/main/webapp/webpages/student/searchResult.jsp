<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/17/2022
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"
            integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">
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
    <title>
        Custom Search Result
    </title>
</head>
<body style="background-color:lightyellow" >
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%--        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>--%>
<%--        <a class="nav-link active" aria-current="page" href="" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>--%>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}"><i
                        class="fa fa-fw fa-home"></i>Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-grav" aria-hidden="true"></i>Explore
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
                    <button type="button" class="btn"><i class="fa fa-user" aria-hidden="true"style="font-size:30px;"></i></button>
                    <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/student/homepage/my-course/${username}">My Courses</a></li>
                        <li><a class="dropdown-item" href="/student/${username}/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="/student/news-forum/view-all-topics/${username}">Forum</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/logout">LogOut</a></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</nav>
<br><br><br>
<section class="course">
    <h1><span class="badge bg-dark">${header_topic}</span></h1>
    <br>

    <c:forEach var="course" items="${CourseList}" varStatus="status">
        <div class="box">
            <img src="${course.course_pic}" class="d-block w-100" alt="" style=" border-color: #162636">
            <h3>${course.title}</h3>
            <p class="card-text">${course.subject}<br>Rating: ${course.rating}</p>
            <a href="/course/coursepage/${username}/${course.course_id}" class="btn btn-primary">View Course Page</a>
        </div>
    </c:forEach>
</section>
</body>
</html>
