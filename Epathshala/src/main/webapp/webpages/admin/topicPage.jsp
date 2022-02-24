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
<body style="background-color:white" >
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/admin/${adminID}/${courseID}/showCoursePage" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
        <a class="nav-link active" aria-current="page" href="/admin/${adminID}/showTeachers" role="button"style="color: black;"><i class="cil-arrow-circle-right"></i></a>
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


<!- eituku diye uporer ongsho->
<!- eituku diye sidebar ongsho->
<div class="wrapper d-flex align-items-stretch" style="width: 18%; border-width: thick; border-color: darkblue">
    <nav class="navbar navbar-dark navbar-full bg-inverse">
        <div class="p-4 pt-5" style="background-color:#e3f2fd; color:darkblue">
            <a href="#" class="img logo rounded-circle mb-5"></a>
            <ul class="list-unstyled components mb-5">
                <c:forEach var="i" begin="1" end="${topics_list.size()}">
                    <li>
                        <a href="/admin/${adminID}/${courseID}/${topics_list.get(i-1).topic_id}/topicPage"><i class="fa fa-grav" aria-hidden="true"></i>
                            Topic ${i}
                        </a>
                        <hr>
                    </li>
                </c:forEach>
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
                    <a href="/admin/${adminID}/${courseID}/${topics_list.get(i-2).topic_id}/topicPage" role="button"style="color: black;"><i class="cil-arrow-circle-left">PREV</i></a>
                </c:if>
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                <c:if test="${i==topics_list.size()}">
                    <a href="" role="button"style="color: black;"><i class="cil-arrow-circle-right">NEXT</i></a>
                </c:if>
                <c:if test="${i!=topics_list.size()}">
                    <a href="/admin/${adminID}/${courseID}/${topics_list.get(i).topic_id}/topicPage" role="button"style="color: black;"><i class="cil-arrow-circle-right">NEXT</i></a>
                </c:if>
            </c:if>
        </c:forEach>
    </div>
</div>


</body>
</html>
