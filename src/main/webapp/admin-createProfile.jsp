<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 6:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-createProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>


<form action="AdminServlet" method="POST">
    <div class="container">
        <h2>ADMIN SIGN UP</h2>
        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminusername" placeholder="Enter your username" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>PASSWORD</label>
            </div>
            <div class="col-75">
                <input type="password" name="adminpassword" placeholder="Enter your password" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminname" placeholder="Enter your full name" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminemail" placeholder="Enter your email" value="">
            </div>
        </div>

        <input type="hidden" name="action"  value="signup">

        <button type="submit" class="button button1" name="submit" >Sign Up</button><br><br>
    </div>
</form>
</body>
</html>

