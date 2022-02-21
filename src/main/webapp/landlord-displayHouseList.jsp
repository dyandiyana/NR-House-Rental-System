<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 31/12/2021
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style><%@include file="landlord-displayHouseList.css"%></style>
<head>
    <title>House List Page</title>
</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");
%>
<div class="mymenu"><%@include file="landlord-navbar.html"%></div>
<div class="TT">
    <p>YOUR HOUSE LIST</p>
</div>
<br>

<div class="C" id="Chouse">
    <button onclick="z()">
	 <span class="button__icon">
	 <ion-icon name="add"></ion-icon>
	 </span>
        <br>
        <span class="button__text">Create</span>
    </button>
</div>

<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user = "gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>
<%
    int landlordid = 0;
    if(request.getParameter("landlordid")==null){
        landlordid=  Integer.parseInt(session.getAttribute("landlordid").toString());
    }else{
        landlordid = Integer.parseInt(request.getParameter("landlordid"));
        session.setAttribute("landlordid",landlordid);
    }
    System.out.println(landlordid);
%>
<sql:query dataSource="${ic}" var="oc">
    <c:set var="houseid" value="<%=landlordid%>"/>
    select * from housedetails where landlordid=?
    <sql:param value="<%=landlordid%>" />
</sql:query>

<div class="overflow-auto">
    <c:forEach var="result" items="${oc.rows}">
        <c:set var="houseid" scope="application" value="${result.houseid}"/>
        <div class="Hcont">
            <form action="landlord-displayMoreInfo.jsp" method="post">
                <input type="number" id="hid" name="hid" value="${result.houseid}" hidden/>
                <div class="housepic">
                    <img src="pic/${result.houseimagepic}"/>
                </div>  <%--Nnti letak data sql using scrplet --%>
                <div class="houseName">
                    <p><c:out value="${result.housename}"/></p>  <%--Nnti letak data sql using scrplet --%>
                </div>
                <div class="myLink">
                    <button type="submit">View More</button>
                </div>
            </form>
        </div>
    </c:forEach>
</div>


</div>
<br>
<br>




<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>





<script type="text/javascript">
    <%--kene ada sql untuk specifickan id rumah mana nak display dalam page ni--%>
    function x() {
        location.href = "landlord-displayMoreInfo.jsp";
    }

    function z() {
        location.href = "landlord-createHouseDetails.jsp";
    }
</script>

</body>
</html>
