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

<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("adminid")==null)
        response.sendRedirect("admin-login.jsp");

%>
<form action="AdminServlet" method="post">

<div class="container" style="height: auto">
    <h3>MY PROFILE</h3>

    <input type="number" name="adminid"  value="${adminid}" hidden>

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



    <input type="hidden" name="action" value="delete">


    <button type="submit"  class="button button1" name="submit" onclick="form.action='admin-updateProfile.jsp'">UPDATE</button>
    <button type="submit" class="button button1" name="submit" formaction="AdminServlet" onclick="return confirm('Confirm delete your profile?');">DELETE</button>


</div>
</form>
</body>
</html>