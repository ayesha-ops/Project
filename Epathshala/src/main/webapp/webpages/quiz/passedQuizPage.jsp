<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/9/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/9/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
        Quiz Page
    </title>
</head>
<body style="background-color:white">
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
<br><br><br>
<!- eituku diye uporer ongsho->

<div class="mx-auto" style="width: 1200px;">
    <div class="rounded float-left" style="padding-right: 50px; padding-left: 20px;" width="550" height="300" align="right">
        Total Marks: ${totalMarks}
        <br>
        <h6 style= "color:green">Highest Marks: ${highestMarks}</h6>
        <br>
        <h6 style= "color:darkblue">Obtained Marks: ${obtainedMarks}</h6>
    </div>

    <div class="rounded float-left">
        <h1 class="card-title" style="align: center"><i class="fa fa-wpexplorer" aria-hidden="true"></i>${courseTitle}</h1><!-write the course_ID->
    </div>
    <br><br>
<div class="mx-auto" style="width: 1000px;  padding-left:60px">
    <div class="container" style="width: 1000px; color:black">
        <c:forEach var="i" begin="1" end="${quizes.size()}">
            <div class="row">
                <div class="col">
                        <h5>${i}.${quizes.get(i-1).quiz_ques}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${ok[i-1]==true}"> <i class="fa fa-check" aria-hidden="true" style="color:green"></i></c:if>
                            <c:if test="${ok[i-1]==false}"> <i class="fa fa-times" aria-hidden="true" style="color:red"></i></c:if>
                        </h5>
                </div>
                <hr>
                <div class="row">
                    <div class="col">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                            <label class="form-check-label" for="inlineRadio1">${quizes.get(i-1).option1}</label>
                        </div></div>
                    <div class="col">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">${quizes.get(i-1).option2}</label>
                    </div></div>
                    <div class="col">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                            <label class="form-check-label" for="inlineRadio3">${quizes.get(i-1).option3}</label>
                        </div></div>
                    <div class="col">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4">
                        <label class="form-check-label" for="inlineRadio4">${quizes.get(i-1).option4}</label>
                    </div>
                </div><hr>

                </div>
                <div style="text-decoration-color: firebrick">
                        Given Answer : ${givenAns[i-1]}<br>
                        Correct Answer : ${quizes.get(i-1).ques_ans}<br>
                </div>

        </div>

        </c:forEach>
    </div>
</div>

    <button class="btn btn-primary" type="submit" style="float:right ">
        <a href="/course/quiz-page/marks/${username}/${courseID}" class="btn btn-primary">Return To Course</a></button>
</div>

</body>
</html>
