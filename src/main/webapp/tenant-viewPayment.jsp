<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 31/12/2021
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-viewPayment.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%@include file="tenant-navbar.html"%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("tenantid")==null)
        response.sendRedirect("tenant-login.jsp");


    int bookingid = Integer.parseInt(request.getParameter("bookingid"));
    int landlordid = Integer.parseInt(request.getParameter("landlordid"));
%>
<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user="gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT  row_number() over () "rank" ,P.PAYID, P.PAYDUEDATE, P.PAYDATE, P.PAYRECEIPT, P.PAYSTATUS, P.BOOKINGID, P.PAYPRICE, p.month, l.landlordid,l.landlordname, l.landlordphoneno, h.housename, h.houseaddress
    from landlord l
    JOIN housedetails h
        on l.landlordid = h.landlordid
    join bookingdetails b
        on h.houseid = b.houseid
    join monthlypayment p
        on b.bookingid = p.bookingid
    WHERE l.landlordid =?
    and b.bookingid = ?
    <sql:param value="<%=landlordid%>"/>
    <sql:param value="<%=bookingid%>"/>
</sql:query>


<sql:query dataSource="${ic}" var="ac">
    select h.housename, h.houseaddress, l.landlordname, l.landlordphoneno
    from bookingdetails b
        join housedetails h
            on h.houseid = b.houseid
        join landlord l
        on l.landlordid = h.landlordid
    where b.bookingid = ?
    <sql:param value="<%=bookingid%>"/>
</sql:query>


<c:forEach var="result" items="${ac.rows}">
<div class="container">
    <h3>MONTHLY PAYMENT</h3>

    <div class="row">
        <div class="col-25">
            <label>HOUSE NAME</label>
        </div>
        <div class="col-75">
            <label>${result.housename}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>HOUSE ADDRESS</label>
        </div>
        <div class="col-75">
            <label>${result.houseaddress}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>LANDLORD NAME</label>
        </div>
        <div class="col-75">
            <label>${result.landlordname}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>LANDLORD PHONE NO</label>
        </div>
        <div class="col-75">
            <label>${result.landlordphoneno}</label>
        </div>
    </div>
    </c:forEach>


    <br><br>
    <table id = "myTable" style="text-align: center">
        <tr>
            <th class="hello">NO.</th>
            <th>MONTH</th>
            <th>PRICE</th>
            <th>STATUS</th>
            <th>RECEIPT</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
        <tr>
            <td class="hello">${result.rank}</td>
            <td>${result.month}</td>
            <td>${result.payprice}</td>

            <c:if test="${result.paystatus=='Unpaid'}">
            <td style="color: red">${result.paystatus}</td>
            </c:if>
            <c:if test="${result.paystatus=='Pending'}">
                <td>${result.paystatus}</td>
            </c:if>
            <c:if test="${result.paystatus=='Paid'}">
            <td style="color: forestgreen">${result.paystatus}</td>
            </c:if>


            <form method="post" action="MonthlyPaymentServlet" enctype="multipart/form-data">
                <td>
                    <c:set var="status" value="${result.paystatus}"/>
                    <c:if test="${status=='Unpaid'}">
                    <input type="file" name="payreceipt"><a href="fileDoc/${result.payreceipt}">${result.payreceipt}</a>
                    </c:if>
                    <c:if test="${status=='Pending'}">
                        <a href="fileDoc/${result.payreceipt}">${result.payreceipt}</a>
                    </c:if>
                    <c:if test="${status=='Paid'}">
                        <a href="fileDoc/${result.payreceipt}">${result.payreceipt}</a>
                    </c:if>
                </td>
                <td>
                    <c:if test="${result.paystatus=='Unpaid'}">
                    <input type="hidden" name="payId" value="${result.payId}">
                    <input type="hidden" name="action" value="update">
                    <button type="submit"  class="button button1" name="submit" >Pay</button>
                    </c:if>
                </td>
            </form>
        </tr>
        </c:forEach>

    </table>

    <button type="submit" class="button button1" name="submit" style="float: left" ><a href="tenant-listPayment.jsp">Back</a></button>


</div>
</body>
</html>