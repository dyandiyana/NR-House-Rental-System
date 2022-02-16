<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 3/1/2022
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-login.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body >
<div class="header">
    <p>UiTM JASIN NON-RESIDENT HOUSE RENTAL SYSTEM</p>
</div>
<form action="AdminServlet" method="POST">
    <div class="container">
        <h2>ADMIN LOGIN</h2>
        <div class="row">

            <div class="col-25">
                <label style="">Username</label>
            </div>
            <div class="col-75">
                <input type="text" name="adminusername" placeholder="Enter your username" value="">
            </div></div>
        <div class="row">
            <div class="col-25">
                <label>Password</label>
            </div>
            <div class="col-75">
                <input type="password" name="adminpassword" placeholder="Your password" value="">
            </div>
        </div>
        <input type="hidden" name="action" value="login">


        <button type="submit" class="button button1" name="submit" >Login</button>

        <p>Not registered? <a href="admin-createProfile.jsp" style="color: #0e6d69; text-decoration: none; margin-top: 0%">Create an account</a></p>

    </div>
</form>
</body>
</html>
