<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

    </style>
    <title>Admin Contact</title>
</head>
<body style="background-color:white" >

<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${userID}/home">
                    <i class="fa fa-fw fa-home"></i>Home</a>

            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${userID}/contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
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
<div class="mx-auto" style="width: 500px;">
<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/images/admin1.jpg" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Admin</h5>
        <p class="card-text">Ayesha Binte Mostofa</p>
          <p class="card-text">Hello I am Ayesha Binte Mostofa. I am a 2nd year sophomor. If any problems occurs, let me know.</p>
        <p class="card-text"><small class="text-muted">email me at : ayeshaathoi62@gmail.com</small></p>
      </div>
    </div>
  </div>
</div>
<br><br>
    <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="/images/admin2.jpg" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">Admin</h5>
                    <p class="card-text">Sumaiya Sultana Any</p>
                    <p class="card-text">Hello I am Sumaiya Sultana Any. I am a 2nd year sophomor. If any problems occurs, let me know.</p>
                    <p class="card-text"><small class="text-muted">email me at : sumaiyaany863@gmail.com</small></p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>