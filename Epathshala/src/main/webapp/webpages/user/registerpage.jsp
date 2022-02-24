<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
        }
        /*
        /* Add padding to containers */
        .container {
            padding: 50px;
            alignment: center;
            align-content: center;
            opacity: 100%;
        }
        legend {
            font-size: 32px;
            padding-bottom: 20px;
        }
        /* Full-width input fields */
        input[type=text], input[type=email], input[type=password] {
            width: 50%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
            font-family: Monaco, monospace;
        }
        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
            font-family: Monaco, monospace;
        }
        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }
        .navbar-nav .actv{
            border-bottom: 3px solid white;
        }
        /* Set a style for the submit/register button */
        .registerbtn {
            background-color: #262626;
            opacity: 70%;
            color: white;
            font-size: 22px;
            padding: 12px 20px;
            /*margin: 8px 0;*/
            border-radius: 8px;
            cursor: pointer;
            width: 50%;
            height: auto;
            opacity: 0.9;
            alignment: center;
            font-family: Monaco, monospace;
        }
        .registerbtn:hover {
            opacity:1;
        }
        .temp a{
            text-decoration: underline;
            color: #f2f2f2;
        }
        .temp a:hover{
            text-decoration: none;
        }
        body{
            font-family: Monaco, monospace;
            margin: 0 auto;
            position: relative;
        }
        body::after {
            content: '';
            display: block;
            height: 80px; /* Set same as footer's height */
        }
        .footer {
            background-color: #262626;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 80px;
        }
    </style>
</head>
<body style="background-color: #f2f2f2; font-family: Monaco, monospace">

<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-education"></span> Epathshala </a>
        </div>
        <!--<div class="navbar-2">
            <ul class="nav navbar-nav">
                <li><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace">Home</a></li>
            </ul>
        </div>-->
        <ul class="nav navbar-nav navbar-right">
            <li class="actv"><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>

            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center">
    <div class="row">
        <legend style="color: #262626; font-family: Monaco, monospace"> Create New Account</legend>

        <form:form method="POST" modelAttribute="users" class="form-signin" id="form">

        <div class="mb-3">
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                        ${error} <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>
            </c:if>
        </div>

        <div class="mb-3">
            <div>
                <form:input type="text"
                            path="user_id"
                            id="username"
                            class="form-control"
                            placeholder="Enter User Name*"
                            autofocus="true"/>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <form:input type="password"
                            path="password"
                            id="password"
                            class="form-control"
                            placeholder="Enter Password*"/>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <form:input type="text"
                            path="full_name"
                            id="full_name"
                            class="form-control"
                            placeholder="Enter First Name*"
                            autofocus="true"/>
            </div>
        </div>

        <div style="height: 70px;
             width: 50%;">
            <div >
                <form:input type="date"
                        placeholder="Select date" path="date_of_birth"
                       id="date_of_birth"
                            value="01/01/2000"
                            min="01/01/1960"
                            max="01/01/2022"
                       class="form-control"
                />

                <i class="fas fa-calendar input-prefix" tabindex=0></i>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <form:input type="email"
                            path="email"
                            id="email"
                            class="form-control"
                            placeholder="Enter Email Address*"
                            autofocus="true"/>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <form:input type="text"
                            path="institution"
                            id="institution"
                            class="form-control"
                            placeholder="Enter Institution*"
                            autofocus="true"/>
            </div>
        </div>

        <div style="height: 70px;
             width: 50%;">
            <div>
                <form:input type="file"
                            path="picture"
                            id="picture"
                            class="form-control"
                            placeholder="Select Picture*"
                            autofocus="true"/>
            </div>
        </div>

        <div style="height: 70px;
             width: 50%;">
            <div>
                <form:select path="authority"
                class="form-control"
                id="authority"
                >
                    <option selected>Select Role</option>
                    <option value="ROLE_STUDENT">Student</option>
                    <option value="ROLE_TEACHER">Teacher</option>
                </form:select>


            </div>
        </div>

    </div>
    <div class="mb-3">
        <div id="error" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto; padding-bottom: 10px"></div>
    </div>

    <button class="registerbtn" type="submit">Register</button>
    </form:form>
    <div class="mb-3" style="margin-top: 10px">
        <a href="/login">Already have an account? Sign in here!</a>
    </div>
</div>
</div>

<script>
    // Data Picker Initialization
    $('.datepicker').datepicker();
    //form validation
    const password = document.getElementById("password");
    const pic = document.getElementById("picture");
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error");
    form.addEventListener('submit', (e)=>{
        let message=""
        let datas=""
        var valid = true;
        $('.form-control').each(function () {
            if ($(this).val() === '') {
                valid = false;

            }else datas+=$(this).val()
        });
        if(valid === false){
            message = "*Please fill up all input fields!"
        }
        if(password.value.length <= 4 && valid === true) {
            message= "*Password must be 4 characters long"
        }
        if(!pic.value.endsWith("jpg")||!pic.value.endsWith("jpeg")||!pic.value.endsWith("png")){
            message = pic.value
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message
        }
    })
</script>

</body>
</html>
