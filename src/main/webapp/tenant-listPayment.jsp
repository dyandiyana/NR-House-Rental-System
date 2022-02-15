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
    int tenantid = Integer.parseInt(session.getAttribute("tenantid").toString());

%>
<sql:setDataSource var="ic"
                   driver="oracle.jdbc.driver.OracleDriver"
                   url="jdbc:oracle:thin:@localhost:1521:XE"
                   user = "RENTALSYSTEM"
                   password="system"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="clsid" value="<%=tenantid%>"/>
    SELECT  P.PAYID, P.PAYDUEDATE, P.PAYDATE, P.PAYRECEIPT, P.PAYSTATUS, P.BOOKINGID, P.PAYPRICE
from TENANT T
JOIN BOOKINGDETAILS B
    on T.TENANTID = B.TENANTID
    join MONTHLYPAYMENT P
    on B.BOOKINGID = P.BOOKINGID
WHERE T.TENANTID =?
    <sql:param value="${clsid}" />
</sql:query>

<div class="container">
    <table id = "myTable">
        <h3>LIST OF PAYMENT</h3>
        <tr>
            <th class="hello">NO.</th>
            <th>BOOKING ID</th>
            <th>DUE DATE</th>
            <th>TOTAL PRICE</th>
            <th>STATUS</th>
            <th>RECEIPT</th>
            <th>PAY DATE</th>
            <th>DATE PAYMENT</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
        <tr>
            <td class="hello">1.</td>
            <td>${result.bookingID}</td>
            <td>${result.payduedate}</td>
            <td>${result.payprice}</td>
            <td>${result.paystatus}</td>
            <td>${result.payreceipt}</td>
            <td>${result.paydate}</td>
            <input type="hidden" name="payid" value="${result.payID}">
            <td><button type="submit" class="button button1" name="submit" ><a href ="tenant-viewPayment.jsp">Pay now</a></button><br><br></td>
        </tr>
        </c:forEach>
    </table>
</div>



</body>
</html>