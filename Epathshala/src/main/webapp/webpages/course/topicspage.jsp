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
        <h1>
            ${coursetitle}
        </h1>
        <br>
        <c:if test="${topics_list.size() == 0}">
            <div class="embed-responsive embed-responsive-16by9">
                <h2>
                    No Topic Yet :(
                </h2>
                <br>
            </div>
        </c:if>

        <br>

        <c:forEach var="i" begin="1" end="${topics_list.size()}">
            <c:if test="${topics_list.get(i-1).topic_id == currentTopic.topic_id}">
                <div class="embed-responsive embed-responsive-16by9">
                    <h2>
                        Topic ${i} : ${currentTopic.topic_name}</h2>
                    <br>
                    <iframe class="embed-responsive-item" width="650" height="350" src="${currentTopic.topic_file}" allowfullscreen></iframe>
                    <!-src e youtube link dibi->
                </div>
                <br>
                <c:if test="${i==1}">
                    <a href="" role="button"style="color: black;"><i class="cil-arrow-circle-left">PREV</i></a>
                </c:if>
                <c:if test="${i>1}">
                    <a href="/course/topicspage/${username}/${courseID}/${topics_list.get(i-2).topic_id}" role="button"style="color: black;"><i class="cil-arrow-circle-left">PREV</i></a>
                </c:if>
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                <c:if test="${i==topics_list.size()}">
                    <a href="" role="button"style="color: black;"><i class="cil-arrow-circle-right">NEXT</i></a>
                </c:if>
                <c:if test="${i!=topics_list.size()}">
                    <a href="/course/topicspage/${username}/${courseID}/${topics_list.get(i).topic_id}" role="button"style="color: black;"><i class="cil-arrow-circle-right">NEXT</i></a>
                </c:if>
            </c:if>
        </c:forEach>
    </div>
</div>
<!--<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"6d64d37cec2646bb","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2021.12.0","si":100}' crossorigin="anonymous"></script>
-->
</body>
</html>
