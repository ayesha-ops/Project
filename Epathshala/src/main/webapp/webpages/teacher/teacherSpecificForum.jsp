<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/12/2022
  Time: 6:05 PM
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
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/news-forum/view-all-topics/${username}" role="button"style="color: black;"><i class="cil-arrow-circle-left"></i></a>
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
<br><br><br>
<!- eituku diye uporer ongsho->
<div class="mx-auto" style="width: 1300px;">
    <h1><i class="fa fa-wpexplorer" aria-hidden="true"></i>${discussion_topic}
        <img src="${decoration_pic}" class="rounded float-left" style="padding-right: 20px; padding-left: 30px;" width="520" height="300" align="right" alt="" border="5px solid #555"></h1>
</div>
<div class="container" style=" float:left; padding-left:60px">
    <div class="row">
        <div class="col-sm-5 col-md-6 col-12 pb-4" >
            <h1>Comments</h1>
            <c:forEach var="i" begin="1" end="${comments_list.size()}">
                <div class="text-justify darker mt-4 float-right" style="background-color: bisque; width: 700px; border-color: #162636; border: 2px" >
                    <h4><img src="${commenters_pic_array[i-1]}" alt="\images\img_1.jpg" class="rounded-circle" width="50" height="50" border="5px solid #555">

                            ${comments_list.get(i-1).user_id}</h4>
                    &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;

                    <span> ${comments_list.get(i-1).comment_date}</span>
                    &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <c:if test="${!username.equals(comments_list.get(i-1).user_id)}">
                        &nbsp;&nbsp;
                        <a href="/teacher/TeacherProfile/news-forum/like-comment/${username}/${comments_list.get(i-1).forum_id}/${comments_list.get(i-1).comment_id}"><i
                                class="fa fa-thumbs-o-up" aria-hidden="true" style="size: 80px"></i></a>Likes : ${comments_list.get(i-1).likes}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/teacher/TeacherProfile/news-forum/dislike-comment/${username}/${comments_list.get(i-1).forum_id}/${comments_list.get(i-1).comment_id}"><i
                                class="fa fa-thumbs-o-down" aria-hidden="true" style="size: 80px"></i></a>Dislikes : ${comments_list.get(i-1).dislikes}
                    </c:if>

                    <c:if test="${username.equals(comments_list.get(i-1).user_id)}">
                        &nbsp;&nbsp;
                        <a href="/teacher/TeacherProfile/news-forum/delete-comment/${username}/${comments_list.get(i-1).forum_id}/${comments_list.get(i-1).comment_id}">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" >
                                <i class="fa fa-trash-o" aria-hidden="true" style="size: 80px"></i>Delete
                            </button></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- for editing a commnet-->
                        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="fa fa-edit" aria-hidden="true" style="size: 80px"></i>Edit
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Edit your comment ->
                                        <br>
                                        <form:form action="/teacher/TeacherProfile/news-forum/edit-comment/${username}/${comments_list.get(i-1).forum_id}/${comments_list.get(i-1).comment_id}" method="post">
                                            <label>
                                                <input type="text" name="updated_comment" style="width: 400px ; height: 100px" value="${comments_list.get(i-1).user_comment}">
                                            </label>

                                            <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Submit
                                            </button>
                                        </form:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- editing commnet end-->
                    </c:if>

                    <hr>
                    <p>${comments_list.get(i-1).user_comment}</p>
                    <hr>
                </div><br>

            </c:forEach>

        </div>
    </div>
    <form:form action="/teacher/TeacherProfile/news-forum/post-comment/${username}/${forumID}" method="post">
        <label>
            <input type="text" name="new_comment" style="width: 600px ; height: 100px" value="">
        </label>
        <button type="submit" class="btn btn-primary" data-bs-toggle="modal" >
            Submit
        </button>
    </form:form>
</div>

</body>
</html>
