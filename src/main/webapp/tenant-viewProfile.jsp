<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-viewProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%@include file="tenant-navbar.html"%>

<div class="container">
    <h3>MY PROFILE</h3>
    <div class="row">
        <div class="col-25">
            <label>USERNAME</label>
        </div>
        <div class="col-75">
            <label>2021125745</label>
        </div>
    </div>
    <div class="row">
        <div class="col-25">
            <label>PASSWORD</label>
        </div>
        <div class="col-75">
            <label>123456</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>FULL NAME</label>
        </div>
        <div class="col-75">
            <label>NUR WALIUDDIN MD SHAARI</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>EMAIL</label>
        </div>
        <div class="col-75">
            <label>nurwaliuddin0719@gmail.com</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>GENDER</label>
        </div>
        <div class="col-75">
            <label>MALE</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>AGE</label>
        </div>
        <div class="col-75">
            <label>21</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>PHONE NUMBER</label>
        </div>
        <div class="col-75">
            <label>0106612401</label>
        </div>
    </div>


    <button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" ><a href="tenant-updateProfile.jsp">UPDATE</a></button>
    <button type="submit" onclick="myFunction2(); return false" class="button button1" name="submit" >DELETE</a></button>

  
    <script type="text/javaScript">
						function myFunction2()
						{	
							confirm("Are you sure you want to delete your profile?");
						}
					</script>	
</div>
</body>
</html>
