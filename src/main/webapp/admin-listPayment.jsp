<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 31/12/2021
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-listPayment.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>
<%@include file="tenant-navbar.html"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("adminid")==null)
        response.sendRedirect("admin-login.jsp");

    int houseid = Integer.parseInt(request.getParameter("houseid"));

%>
<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user="gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="clsid" value="<%=houseid%>"/>
    SELECT  row_number() over () "rank", B.bookingid,b.landlordid, b.rentalstatus, t.tenantname, t.tenantid, h.houseid
    from TENANT T
    JOIN BOOKINGDETAILS B
    on T.TENANTID = B.TENANTID
    join housedetails h
    on b.houseid = h.houseid
    WHERE h.houseid =?
    and b.rentalstatus in ('On Going','Completed')
    <sql:param value="${clsid}" />
</sql:query>

<div class="container">
    <table id = "myTable" style="text-align: center">
        <h3>List of tenant</h3>
        <tr>
            <th class="hello">NO.</th>
            <th>Tenant name</th>
            <th>RENTAL STATUS</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
            <tr>
                <td class="hello">${result.rank}</td>
                <td>${result.tenantname}</td>

                <c:set var="status" value="${result.rentalstatus}"/>
                <c:if test="${status=='On Going'}">
                    <td style="color: forestgreen">${result.rentalstatus}</td>
                </c:if>
                <c:if test="${status=='Completed'}">
                    <td style="color: dodgerblue">${result.rentalstatus}</td>
                </c:if>
                <form method="post">
                    <input type="hidden" name="bookingid" value="${result.bookingid}">
                    <input type="hidden" name="tenantid" value="${result.tenantid}">
                    <td><button type="submit" class="button button1" name="submit" formaction="admin-viewPayment.jsp" >View More</button></td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>



</body>
</html>