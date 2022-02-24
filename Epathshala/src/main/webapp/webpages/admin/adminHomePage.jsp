<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
        <meta charset = "utf-8" />

        <title>
            Admin
        </title>

        <!-- add icon link -->
        <link rel = "icon" href =
                "webpages/images/favicon-16x16.png"
              type = "image/x-icon">
    </head>
<body background="/images/group.png" style="background-repeat: no-repeat;background-attachment: fixed;
  background-position: center;background-size: 1500px 650px;">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%--        <a class="nav-link active" aria-current="page" href="" role="button" style="color: black;" aria-disabled="true"><i class="cil-arrow-circle-left"></i></a>--%>
        <h2><a class="nav-link active" aria-current="page" href="/admin/${adminID}/showCourses" role="button"style="color: black;"></a></h2>

            <i class="cil-arrow-circle-right"></i></a>
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
<div style="background-color: white"></div>
</body>
</html>