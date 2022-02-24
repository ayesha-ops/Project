<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2/21/2022
  Time: 6:44 PM
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
        Into The Forum Post
    </title>
</head>
<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%--        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}/${c}/addTopic" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>--%>
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
<!- eituku diye uporer ongsho->

<div class="mx-auto" style="width: 1300px;">
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <button style="font-size:24px; align-content: center "><a href="/teacher/TeacherProfile/news-forum/view-all-topics/${username}"><i class="fa fa-refresh"></i></a></button>
    <br>
    <h1><i class="fa fa-wpexplorer" aria-hidden="true" style="align-content: center"></i>All Forum Posts</h1>
    <img src="${pageContext.request.contextPath}/images/cartoon.jpg" alt="" class="rounded float-left" style="padding-right: 50px; padding-left: 20px;" width="550" height="300"; align="right" border="5px solid #555">
</div>
<div class="mx-auto" style="width: 750px; float:left; padding-left:60px">

    <form:form action="/teacher/TeacherProfile/news-forum/add-topic/${username}" method="post">
        <label>
            <input type="text" name="keyword" style="width: 500px ; height: 100px">
        </label>

        <br>
        <br>
        <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Create a new Post
        </button>
        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <button type="submit" class="btn btn-outline-success" formaction="/teacher/TeacherProfile/news-forum/search-topic/${username}">
            Search
        </button>
    </form:form>

    <br><br>

    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <i class="fa fa-comments" aria-hidden="true"></i>Discussion
                </button>
            </h2>
            <ul class="list-group">
                <c:forEach var="topic" items="${all_topics}" varStatus="status">
                    <li class="list-group-item">
                        <p>
                            <br>
                            <a href="/teacher/TeacherProfile/news-forum/view-specific-forum/${username}/${topic.forum_id}">
                                <i class="fa fa-book" aria-hidden="true">
                                    ${topic.discussion_topic} </i>
                                <br>
                            </a>
                            <br>
                            No Of Comments : ${no_of_comment.get(topic.forum_id)}
                        </p>
                    </li>
                </c:forEach>

            </ul>
        </div>


    </div>
</div>

</body>
</html>
