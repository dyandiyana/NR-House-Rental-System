<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 4:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="landlord-updateProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");
%>

    <%@include file="landlord-navbar.html"%>
    <sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa" user = "gpdkvocjaztxrw" password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

    <sql:query dataSource="${ic}" var="oc">
        <%
            int landlordid = (Integer) session.getAttribute("landlordid");
        %>
        <c:set var="landid" value="<%=landlordid%>"/>
        SELECT * from landlord where landlordid = ?;
        <sql:param value="${landid}" />
    </sql:query>
<form action="LandlordServlet" method="POST">
    <c:forEach var="result" items="${oc.rows}">
    <div class="container">
        <h2>UPDATE MY ACCOUNT</h2>
        <div class="row">
            <div class="col-25">
                <label style=""></label>
            </div>
            <div class="col-75">
                <input type="number" name="landlordid"  value="${result.landlordid}" hidden>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">USERNAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordusername"  value="${result.landlordusername}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>PASSWORD</label>
            </div>
            <div class="col-75">
                <input type="password" name="landlordpassword"  value="${result.landlordpassword}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">FULL NAME</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordname"  value="${result.landlordname}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordemail"  value="${result.landlordemail}">
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label style="">AGE</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordage" value="${result.landlordage}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordPhoneNo"  value="${result.landlordphoneno}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label style="">GENDER</label>
            </div>
            <div class="col-75">
                <c:set var = "gender" scope = "session" value = "${result.landlordgender}"/>
                <c:if test = "${gender == 'Male'}">
                <input type="radio" id="male" name="landlordgender" value="Male" checked>
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="landlordgender" value="Female">
                <label for="female">FEMALE</label>
                </c:if>
                <c:set var = "gender" scope = "session" value = "${result.landlordgender}"/>
                <c:if test = "${gender == 'Female'}">
                <input type="radio" id="male" name="landlordgender" value="Male">
                <label for="male">MALE</label><br>
                <input type="radio" id="female" name="landlordgender" value="Female" checked>
                <label for="female">FEMALE</label>
                </c:if>
            </div>
        </div>
        <input type="hidden" name="action"  value="update">
        <button type="button" class="button button2" onclick="form.action='landlord-viewProfile.jsp'">Back</button>
        <button type="submit" class="button button1" name="submit" >Submit</button><br><br>
    </div>
    </c:forEach>
</form>
</body>
</html>