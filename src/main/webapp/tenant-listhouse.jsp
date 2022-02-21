<%--  Created by IntelliJ IDEA.
  User: anis zamri
  Date: 2/1/2022
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<title>NR RENTAL SYSYTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="house.css">
<link rel="stylesheet" href="tenant-listhouse.css">


<body>

<%@include file="tenant-navbar.html"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("tenantid")==null)
        response.sendRedirect("tenant-login.jsp");
%>

<h3 style="margin-top: 30px" > LIST OF HOUSE</h3>
<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user="gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT * from HOUSEDETAILS
</sql:query>

<div class="container">

    <c:forEach var="result" items="${oc.rows}">
        <div class="Hcont" style="height: auto">

        <c:set var="houseid" scope="application" value="${result.houseid}"/>

                <form  method="post">

                <input type="number" id="hid" name="hid" value="${result.houseid}" hidden/>

                    <div class="housepic">
                        <img src="pic/${result.houseimagepic}"/>
                    </div>  <%--Nnti letak data sql using scrplet --%>

                    <div class="houseName">
                        <p style="margin-top: 0%;"><c:out value="${result.housename}"/></p>  <%--Nnti letak data sql using scrplet --%>
                    </div>

                    <div class="housePrice">
                        <p style="margin-left: 3%;" ><c:out value="RM${result.housemonthlyprice}.00"/></p>  <%--Nnti letak data sql using scrplet --%>
                    </div>

                    <c:set var="bed" value="${result.housefurniture}"/>
                    <c:if test ="${bed > 0}">
                    <p style="margin-left: 3%;" ><i class="fa fa-bed"></i>
                        </c:if>

                    <c:set var="toilet" value="${result.housenotoilet}"/>
                    <c:if test ="${toilet > 0}">
                    <i class="fa fa-bath"></i>
                    </c:if>

                    <c:set var="wifi" value="${result.housewifi}"/>
                    <c:if test ="${wifi == 'Available'}">
                    <i class="fa fa-wifi"></i>
                    </c:if>


                    <c:set var="status" value="${result.houseavailability}"/>
                    <c:if test ="${status == 'Available'}">
                    <p class="status">Available</p>
                    </c:if>

                    <c:if test ="${status == 'Not Available'}">
                        <p class="status" style="color: red; margin-bottom: 0%; padding-bottom: 0%;">Not Available</p>
                    </c:if>


                <div class="MyLink">
                    <button type="submit" formaction="tenant-listhousedetails.jsp">View More</button>
                </div>
            </form>
        </div>
    </c:forEach>

</div>


<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>





<script type="text/javascript">
    function x() {
        location.href = "MoreInfoHouse.jsp";
    }
    function z() {
        location.href = "HouseDetails.jsp";
    }
</script>

</body>
</html>



