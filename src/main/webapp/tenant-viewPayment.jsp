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

<div class="container">
    <h3>MONTHLY PAYMENT</h3>
    <div class="row">
        <div class="col-25">
            <label>BOOKING ID</label>
        </div>
        <div class="col-75">
            <label>TN001</label>
        </div>
    </div>
    <div class="row">
        <div class="col-25">
            <label>HOUSE ID</label>
        </div>
        <div class="col-75">
            <label>HS112</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>DUE DATE</label>
        </div>
        <div class="col-75">
            <!--<input type="password" name="lecturerPassword" placeholder="Your email" value=""> -->
            <label>4 JAN 2021</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>TOTAL PRICE</label>
        </div>
        <div class="col-75">
            <label>RM 740</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>STATUS</label>
        </div>
        <div class="col-75">
            <label>Pending</label>
        </div>
    </div>
    <br><br>
    <table id = "myTable">
        <tr>
            <th class="hello">NO.</th>
            <th>TENANT ID</th>
            <th>TENANT NAME</th>
            <th>RECEIPT</th>
            <th>DATE PAYMENT</th>
        </tr>

        <tr>
            <td class="hello">1.</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <button type="submit" onclick="myFunction(); return false" class="button button1" name="submit" ><a href="tenant-uploadPayment.jsp">Update</a></button>
    <button type="submit" class="button button1" name="submit" ><a href="tenant-listPayment.jsp">Back</a></button>
</div>
</body>
</html>