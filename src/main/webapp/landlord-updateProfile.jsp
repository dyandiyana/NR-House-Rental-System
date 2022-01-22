<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 4:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="landlord-updateProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>
<div class="navbar">
    <%@include file="landlord-navbar.html"%>
    </div>
</div>


<form action="" method="POST">
    <div class="container">
        <h2>UPDATE MY ACCOUNT</h2>
        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="Username" placeholder="Enter your username" value="Zaitul_Farhana00">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>PASSWORD</label>
            </div>
            <div class="col-75">
                <input type="password" name="password" placeholder="Enter your password" value="Farhana_0911">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="FullName" placeholder="Enter your full name" value="Zaitul Farhna Md Esa">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="email" placeholder="Enter your email" value="z.farhana21@gamil.com">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">GENDER</label>
            </div>
            <div class="col-75">
                <input type="radio" id="male" name="Gender" placeholder="Male" value="">
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="Gender" placeholder="Female" value="">
                <label for="female">FEMALE</label>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">AGE</label>
            </div>
            <div class="col-75">
                <input type="text" name="age" placeholder="Enter your age" value="38">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <input type="text" name="PhoneNumber" placeholder="Enter your phone number" value="0114567654">
            </div>
        </div>

        <button type="submit" class="button button1" name="submit" ><a href ="#">Submit</a></button><br><br>
    </div>
</form>
</body>
</html>