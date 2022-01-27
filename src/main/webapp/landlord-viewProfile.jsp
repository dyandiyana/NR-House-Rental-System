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
                <input type="text" name="landlordgender"  value="${landlordgender}" hidden>
                <label>${landlordgender}</label>
            </div>
        </div>

        <%
            request.setAttribute("landlordid", request.getParameter("landlordid"));
        %>

        <button type="submit" class="button button1" name="submit" onclick="form.action='LandlordDeleteServlet'">DELETE</button>
        <button type="submit"  class="button button1" name="submit" onclick="form.action='landlord-updateProfile.jsp'"  >UPDATE</button>


    </div>

    <%
        String mytext = request.getParameter("landlordid");

        if(mytext == null){

        }
        else{
            session.setAttribute("LAid",request.getParameter("landlordid"));

        }
    %>



</form>


</body>
</html>