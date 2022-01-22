<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 31/12/2021
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Landlord List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-list.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<%@include file="admin-navbar.html"%>

<div class="container">

    <h3>LIST OF LANDLORD</h3>

    <form class="example" action="#">
        <input type="text" placeholder="Enter landlord name" name="search2">
        <button type="submit"><i class="fa fa-search"></i></button>
    </form>

    <table id = "myTable">


        <tr>
            <th class="no">NO.</th>
            <th class="id"> ID</th>
            <th class="name"> NAME</th>

        </tr>

        <tr>
            <td class="no">1.</td>
            <td class="id"> </td>
            <td class="name"></td>

            </td>
        </tr>
    </table>
</div>
</body>
</html>
