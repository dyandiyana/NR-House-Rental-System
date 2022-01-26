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
<div class="mymenu"><%@include file="landlord-navbar.html"%></div>
<div class="TT">
     <p>YOUR HOUSE LIST</p>
</div>
<br>

<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-44-194-101-60.compute-1.amazonaws.com:5432/d2us57cbf117bh" user="rnscsqosqdtcmz" password="0b201fb2e59025b780ce0b4148e508b6747fbaf77f6e8cedc675ee4dbc44638a"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT houseid,housepicname,housename from housedetails;
</sql:query>

<div class="overflow-auto">
    <c:forEach var="result" items="${oc.rows}">
        <c:set var="houseid" scope="application" value="${result.houseid}"/>
    <div class="Hcont">
        <form action="LAdisplayMoreDetailsServlet" method="post">
            <input type="number" id="hid" name="hid" value="${result.houseid}" hidden/>
        <div class="housepic">
            <img src="images/${result.housepicname}"/>
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


    <div class="C" id="Chouse">
        <button onclick="z()">
	 <span class="button__icon">
	 <ion-icon name="add"></ion-icon>
	 </span>
            <br>
            <span class="button__text">Create</span>
        </button>
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
