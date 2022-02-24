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
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <!-- Font Awesome CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
    <style>
        body {
            background: #67B26F;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            padding: 0;
            margin: 0;
            font-family: 'Lato', sans-serif;
            color: #000;
        }
        .student-profile .card {
            border-radius: 10px;
        }
        .student-profile .card .card-header .profile_img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin: 10px auto;
            border: 10px solid #ccc;
            border-radius: 50%;
        }
        .student-profile .card h3 {
            font-size: 20px;
            font-weight: 700;
        }
        .student-profile .card p {
            font-size: 16px;
            color: #000;
        }
        .student-profile .table th,
        .student-profile .table td {
            font-size: 14px;
            padding: 5px 10px;
            color: #000;
        }
    </style>
    <title>
        Student Profile
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
<div class="student-profile py-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-transparent text-center">
                        <img class="profile_img" src="${user.picture}" alt="student dp">
                        <h3>${user.user_id}</h3>
                    </div>
                    <div class="card-body">
                        <p class="mb-0"><strong class="pr-1">Full Name:</strong>${user.full_name}</p>
                        <p class="mb-0"><strong class="pr-1">Class:</strong>${s.s_class}</p>
<%--                        <p class="mb-0"><strong class="pr-1">Section:</strong>A</p>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-transparent border-0">
                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
                    </div>
                    <div class="card-body pt-0">
                        <table class="table table-bordered">
                            <tr>
                                <th width="30%">Date Of Birth</th>
                                <td width="2%">:</td>
                                <td>${user.date_of_birth}</td>
                            </tr>
                            <tr>
                                <th width="30%">Institution</th>
                                <td width="2%">:</td>
                                <td>${user.institution}</td>
                            </tr>
                            <tr>
                                <th width="30%">Email</th>
                                <td width="2%">:</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <th width="30%">Password</th>
                                <td width="2%">:</td>
                                <td>${user.password}</td>
                            </tr>

                        </table>
                    </div>
                </div>
                <div style="height: 26px"></div>
                <div class="card shadow-sm">
                    <div class="card-header bg-transparent border-0">
                        <h3 class="mb-0"><a href="/student/${username}/profile/edit" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Edit Profile</a></h3>
                    </div>
<%--                    <div class="card-body pt-0">--%>
<%--                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
