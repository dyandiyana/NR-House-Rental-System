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

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("adminid")==null)
        response.sendRedirect("admin-login.jsp");
%>
<form action="AdminServlet" method="POST">
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


        <input type="hidden" name="action" value="update">

        <button type="submit" class="button button1" name="submit" >Submit</button><br><br>
    </div>
</form>
</body>
</html>