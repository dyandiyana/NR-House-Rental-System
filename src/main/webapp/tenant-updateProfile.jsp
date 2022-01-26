<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 12:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-updateProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>
<%@include file="tenant-navbar.html"%>


<form action="" method="POST">
    <div class="container">
        <h2>UPDATE MY PROFILE</h2>
        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="tenantusernamew"  value="${tenantusername}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>PASSWORD</label>
            </div>
            <div class="col-75">
                <input type="password" name="tenantpassword" value="${tenantpassword}" >
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="tenantname" value="${tenantname}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="tenantemail"  value="${tenantemail}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">GENDER</label>
            </div>
            <div class="col-75">
                <%
                    String gender = request.getParameter("tenantgender");
                    if (gender.equals("Male")){
                %>
                <input type="radio" id="male" name="tenantgender" value="Male" checked>
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="tenantgender" value="Female">
                <label for="female">FEMALE</label>

                <%
                }
                else if(gender.equals("Female")){
                %>
                <input type="radio" id="male" name="tenantgender" value="Male">
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="tenantgender" value="Female" checked>
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
                <input type="text" name="tenantage" value="${tenantage}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <input type="text" name="tenantphoneno" value="${tenantphoneno}">
            </div>
        </div>
      
        <button type="button" class="button button2" onclick="form.action='tenant-viewProfile.jsp'">Back</button>
        <button type="submit" class="button button1" name="submit" onclick="form.action='TenantUpdateServlet'">Update</button><br><br>

    </div>
</form>
</body>
</html>
