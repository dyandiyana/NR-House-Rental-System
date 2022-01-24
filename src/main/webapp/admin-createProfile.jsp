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
<%@ page import="com.Model.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-createProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>


<form action="" method="POST">
    <div class="container">
        <h2>CREATE ACCOUNT</h2>
        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="Username" placeholder="Enter your username" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>PASSWORD</label>
            </div>
            <div class="col-75">
                <input type="password" name="password" placeholder="Enter your password" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="fullName" placeholder="Enter your full name" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="email" placeholder="Enter your email" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">GENDER</label>
            </div>
            <div class="col-75">
                <input type="radio" id="male" name="Gender" placeholder="Male" >
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="Gender" placeholder="Female" >
                <label for="female">FEMALE</label>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">AGE</label>
            </div>
            <div class="col-75">
                <input type="text" name="age" placeholder="Enter your age" value="">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <input type="text" name="PhoneNumber" placeholder="Enter your phone number" value="">
                <input type="hidden" name="action"  value="add">
            </div>
        </div>

        <button type="submit" class="button button1" name="submit" ><a href ="admin-viewProfile.jsp">Submit</a></button><br><br>
    </div>
</form>
</body>
</html>

<%
    String username  =request.getParameter("username");
    String password  =request.getParameter("password");
    String fullname  =request.getParameter("fullname");
    String email  =request.getParameter("email");
    String gender  =request.getParameter("gender");
    String age  =request.getParameter("age");
    String phonenumber  =request.getParameter("PhoneNumber");

    String dbUrl = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa";
    String dbUname = "gpdkvocjaztxrw";
    String dbPassword = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5";
    String dbDriver = "org.postgresql.Driver";

    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName(dbDriver).newInstance();

    if( (username == null || password == null || fullname == null || email == null || gender == null || age == null || phonenumber == null) ||
            username.equals("") || password.equals("") || fullname.equals("") || email.equals("") || gender.equals("") || age.equals("") || phonenumber.equals("") )
    {
        System.out.println("Input empty");
        return;
    }else {
        conn = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
        String data = "insert into admin(adminid,adminusername,adminpassword,adminname,adminemail,adminage,admingender,adminphonenumber) " +
                "values(nextval('adminid_sec'),?,?,?,?,?,?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1,username);
        stat.setString(2,password);
        stat.setString(3,fullname);
        stat.setString(4,email);
        stat.setString(5,gender);
        stat.setString(6,age);
        stat.setString(7,phonenumber);
        stat.executeUpdate();

        String id = "select * from admin where adminid = (select max(adminid) from admin);";
        Admin admin = new Admin(id,username,password,fullname,email,gender,age,phonenumber);
        response.sendRedirect("Admin-listhouse.jsp");

    }





%>