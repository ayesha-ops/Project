<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons@2.0.0-beta.3/css/all.min.css">

    <title>Edit Profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    </style>
</head>
<body style="background: white">
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
    &nbsp &nbsp &nbsp &nbsp
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}" role="button"
           style="color: black;"><i class="cil-arrow-circle-left"></i></a>
<%--        <a class="nav-link active" aria-current="page" href="/teacher/TeacherProfile/${username}" role="button" style="color: black;"><i class="cil-arrow-circle-right"></i></a>--%>
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

<div class="mx-auto" style="width: 500px; padding-left:60px">

    <h4>Edit Profile</h4>
    <br>
    <div class="content">
        <form action="/teacher/TeacherProfile/${username}/editProfile/submit" method="post">

            <div class="container">
                <div class="mb-3">
                    <label for="1" class="form-label">User name</label>
                    <input type="text" name="name" class="form-control" id="1" value="${user.full_name}">
                </div>
                <div class="mb-3">
                    <label for="7" class="form-label">Email Address</label>
                    <input type="text" name="email" class="form-control" id="7" value="${user.email}">
                </div>
                <div class="mb-3">
                    <label for="8" class="form-label">Designation</label>
                    <input type="text" name="d" class="form-control" id="8" value="${teacher.t_designation}">
                </div>
                <div class="mb-3">
                    <label for="2" class="form-label">Speciality</label>
                    <input type="text" name="s" class="form-control" id="2" value="${teacher.t_speciality}">
                </div>
                <div class="mb-3">
                    <input type="file" class="form-control" name="picture" id="picture" value="${user.picture.substring(8)}">
                </div>
                <div class="mb-4 row">
                    <label for="3" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-5">
                        <input type="password" name="old" class="form-control" id="3" value="${user.password}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="4" class="col-sm-3 col-form-label">New Password</label>
                    <div class="col-sm-5">
                        <input type="text" name="new" class="form-control" id="4" value="${user.password}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="5" class="col-sm-10 col-form-label">Confirm Password</label>
                    <div class="col-sm-5">
                        <input type="text" name="con" class="form-control" id="5" value="${user.password}">
                    </div>
                </div>
                <button type="submit" class="btn btn-success mb-3" style="">update profile</button>
            </div>
        </form>
    </div>
</div>
</body>


</html>