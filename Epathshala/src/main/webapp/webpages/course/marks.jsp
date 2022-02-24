<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/6/2022
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">
    <style>
        #nav1 {
            position:fixed;
            width: 200px;
            z-index: 1000;
            left: 0;
            top: 0;
            border-right: 1px solid #162636;
            height: 100%;
        }</style>
    <title>
        Course Topics
    </title>
</head>

<body style="background-color: lavenderblush ">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!--<a class="nav-link active" aria-current="page" href="course_content.html" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
        <a class="nav-link active" aria-current="page" href="Week1.html" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>
        -->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}"><i class="fa fa-fw fa-home"></i>Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/student/homepage/${username}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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

<!- eituku diye uporer ongsho->
<!- eituku diye sidebar ongsho->
<div class="wrapper d-flex align-items-stretch" style="width: 18%; border-width: thick; border-color: darkblue">
    <nav class="navbar navbar-dark navbar-full bg-inverse">
        <div class="p-4 pt-5" style="background-color:#e3f2fd; color:darkblue">
            <a href="#" class="img logo rounded-circle mb-5"></a>
            <ul class="list-unstyled components mb-5">
                <c:forEach var="i" begin="1" end="${topics_list.size()}">
                    <li>
                        <a href="/course/topicspage/${username}/${courseID}/${topics_list.get(i-1).topic_id}"><i class="fa fa-grav" aria-hidden="true"></i>
                            Topic ${i}
                        </a>
                        <hr>
                    </li>
                </c:forEach>
                <li>
                    <a href="/course/quiz-page/show-quiz/${username}/${courseID}"><i class="fa fa-grav" aria-hidden="true"></i>
                        Quiz
                    </a>
                    <hr>
                </li>
                <li>
                    <a href="/course/quiz-page/marks/${username}/${courseID}"><i class="fa fa-grav" aria-hidden="true"></i>
                        Marks
                    </a>
                    <hr>
                </li>
                <li>
                    <a href="/student/news-forum/view-specific-forum/${username}/${forum_id}"><i class="fa fa-grav" aria-hidden="true"></i>
                        Discussion Forum
                    </a>
                    <hr>
                </li>
            </ul>
        </div>
    </nav>
    <div id="content" class="p-4 p-md-5">
        <!-- Vertically centered modal -->
        <!-- Button trigger modal -->
        <div class="mx-auto" style="width: 800px;  padding-left:60px; background-color:white;">
            <c:if test="${is_passed == true}">
                <h1 style="color:red"><i class="fa fa-trophy" aria-hidden="true" style="color:red"></i>Congratulations
                <i class="fa fa-trophy" aria-hidden="true" style="color:red"></i>
            </h1>
            </c:if>
            <c:if test="${is_passed == false}">
                <h1 style="color:darkmagenta"><i class="fa fa-thumbs-o-down" aria-hidden="true" style="color:deeppink"></i>
                    You Haven't Yet Passed The Course
                    <i class="fa fa-thumbs-o-down" aria-hidden="true" style="color:deeppink"></i>
                </h1>
            </c:if>

            <br><br>
            <div class="container" style="width: 800px;color:black">
                <div class="row">
                    <div class="col">
                        Course Name
                    </div>
                    <div class="col">
                        ${courseTitle}
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col">
                        Total Marks
                    </div>
                    <div class="col">
                        ${full_mark}
                    </div>
                </div><hr>
                <div class="row">
                    <div class="col">
                        Obtained marks
                    </div>
                    <div class="col">
                        ${obtained_mark}
                    </div>
                </div><hr>
                <div class="row">
                    <div class="col">
                        Achieved Percentage
                    </div>
                    <div class="col">
                        ${percentage}%
                    </div><hr>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
