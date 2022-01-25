<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: anis
  Date: 1/2/2022
  Time: 4:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEMM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="landlord-viewProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>
<%@include file="landlord-navbar.html"%>
<form action="" method="post">

    <div class="container">
        <h3>MY PROFILE</h3>

        <input type="number" name="landlordid" hidden>

        <div class="row">
            <div class="col-25">
                <label>USERNAME</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordusername")%></label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>FULL NAME</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordname")%></label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordemail")%></label>
            </div>
        </div>



        <div class="row">
            <div class="col-25">
                <label>AGE</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordage")%></label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordphonenumber")%></label>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>GENDER</label>
            </div>
            <div class="col-75">
                <label><%= (String)request.getAttribute("landlordgender")%></label>
            </div>
        </div>

        <button type="submit" class="button button1" name="submit" onclick="document.getElementById('id01').style.display='block'"><a href="landlord-deleteProfile.jsp">DELETE</a></button>
        <button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" ><a href="landlord-updateProfile.jsp">UPDATE</a></button>


    </div>
</form>
</body>
</html>