<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 6:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-viewProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%@include file="admin-navbar.html"%>

<div class="container">
    <h3>MY PROFILE</h3>
    <div class="row">
        <div class="col-25">
            <label>USERNAME</label>
        </div>
        <div class="col-75">
            <label>${adminusername}</label>
        </div>
    </div>
    <div class="row">
        <div class="col-25">
            <label>FULL NAME</label>
        </div>
        <div class="col-75">
            <label>${adminname}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>EMAIL</label>
        </div>
        <div class="col-75">
            <label>${adminemail}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>GENDER</label>
        </div>
        <div class="col-75">
            <label>${admingender}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>AGE</label>
        </div>
        <div class="col-75">
            <label>${adminage}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>PHONE NUMBER</label>
        </div>
        <div class="col-75">
            <label>${adminphonenumber}</label>
        </div>
    </div>


    <button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" ><a href="admin-updateProfile.jsp">UPDATE</a></button>
    <button type="submit" class="button button1" name="submit" onclick="document.getElementById('id01').style.display='block'"><a href="#">DELETE</a></button>


</div>
</body>
</html>