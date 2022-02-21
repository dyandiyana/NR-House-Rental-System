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
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="landlord-viewProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>


<body>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");


    int landlordid = (Integer) session.getAttribute("landlordid");
%>
<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa" user = "gpdkvocjaztxrw" password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="landid" value="<%=landlordid%>"/>
    SELECT * from landlord where landlordid = ?;
    <sql:param value="${landid}" />
</sql:query>


<%@include file="landlord-navbar.html"%>
<c:forEach var="result" items="${oc.rows}">
<form action="" method="post">

    <div class="container">
        <h3>MY PROFILE</h3>

        <input type="number" name="landlordid"  value="${result.landlordid}" hidden>

        <div class="row">
            <div class="col-25">
                <label>USERNAME</label>
            </div>
            <div class="col-75">
                <label>${result.landlordusername}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>FULL NAME</label>
            </div>
            <div class="col-75">
                <label>${result.landlordname}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>EMAIL</label>
            </div>
            <div class="col-75">
                <label>${result.landlordemail}</label>
            </div>
        </div>



        <div class="row">
            <div class="col-25">
                <label>AGE</label>
            </div>
            <div class="col-75">
                <label>${result.landlordage}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label>PHONE NUMBER</label>
            </div>
            <div class="col-75">
                <label>${result.landlordphoneno}</label>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label>GENDER</label>
            </div>
            <div class="col-75">
                <input type="text" name="landlordgender"  value="${result.landlordgender}" hidden>
                <label>${result.landlordgender}</label>
            </div>
        </div>
        <input type="hidden" name="action"  value="delete">
        <button type="submit"  class="button button1" name="submit" onclick="form.action='landlord-updateProfile.jsp'"  onclick="return confirm('Confirm update your profile?');">UPDATE</button>
        <button type="submit" class="button button1" name="submit" formaction="LandlordServlet" onclick="return confirm('Confirm delete your profile?');" >DELETE</button>


    </div>

<%--    <%--%>
<%--        String mytext = request.getParameter("landlordid");--%>

<%--        if(mytext == null){--%>

<%--        }--%>
<%--        else{--%>
<%--            session.setAttribute("LAid",request.getParameter("landlordid"));--%>

<%--        }--%>
<%--    %>--%>



</form>
</c:forEach>


</body>
</html>