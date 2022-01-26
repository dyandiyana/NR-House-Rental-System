<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-updateProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>
<%@include file="admin-navbar.html"%>
<form action="AdminUpdateServlet" method="POST">
    <div class="container">
        <h2>UPDATE MY ACCOUNT</h2>

        <input type="number" name="adminid"  value="${adminid}" hidden>

        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminusername" value="${adminusername}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">Password</label>
            </div>
            <div class="col-75">
                <input type="password" name="adminpassword" value="${adminpassword}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminname" value="${adminname}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminemail" value="${adminemail}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">GENDER</label>
            </div>
            <div class="col-75">
                <%
                    if (request.getAttribute("admingender").equals("Male")){
                %>
                <input type="radio" id="male" name="admingender" value="Male" checked>
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="admingender" value="Female">
                <label for="female">FEMALE</label>

                <%
                    }
                    else{
                %>
                <input type="radio" id="male" name="admingender" value="Male">
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="admingender" value="Female" checked>
                <label for="female">FEMALE</label>
                <%
                    }
                %>

            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">AGE</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminage" value="${adminage}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminphonenumber" value="${adminphonenumber}">
            </div>
        </div>

        <button type="submit" class="button button1" name="submit" >Submit</button><br><br>
    </div>
</form>
</body>
</html>