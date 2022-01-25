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

        <input type="number" name="landlordid"  value="${landlordid}" hidden>

        <div class="row">
            <div class="col-25">
                <label>USERNAME</label>
            </div>
            <div class="col-75">
                <label>${landlordusername}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>FULL NAME</label>
            </div>
            <div class="col-75">
                <label>${landlordname}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <label>${landlordemail}</label>
            </div>
        </div>



        <div class="row">
            <div class="col-25">
                <label>AGE</label>
            </div>
            <div class="col-75">
                <label>${landlordage}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <label>${landlordphoneno}</label>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>GENDER</label>
            </div>
            <div class="col-75">
                <label>${landlordgender}</label>
            </div>
        </div>

        <button type="submit" class="button button1" name="submit" onclick="document.getElementById('id01').style.display='block'" value="deleteservlet"><a href="landlord-deleteProfile.jsp">DELETE</a> </button>
        <button type="submit" onclick="myFunction(); return false" class="button button1" name="submit"  ><a href="landlord-updateProfile.jsp">UPDATE</a></button>


    </div>

    <%
        request.setAttribute("landlordid", request.getParameter("landlordid"));
        request.setAttribute("landlordusername", request.getParameter("landlordusername"));
        request.setAttribute("landlordpassword", request.getParameter("landlordpassword"));
        request.setAttribute("landlordname", request.getParameter("landlordname"));
        request.setAttribute("landlordemail", request.getParameter("landlordemail"));
        request.setAttribute("landlordage", request.getParameter("landlordage"));
        request.setAttribute("landlordphoneno", request.getParameter("landlordphoneno"));
        request.setAttribute("landlordgender", request.getParameter("landlordgender"));

    %>

</form>
</body>
</html>