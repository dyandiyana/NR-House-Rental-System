<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<title>NR RENTAL SYSYTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="tenant-homepage.css">


<body class="w3-light-grey">
<%@include file="tenant-navbar.html"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("tenantid")==null)
        response.sendRedirect("tenant-login.jsp");
%>
<!-- Header -->

<div class="search ">
    <header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
        <img class="house.jpg" src="house.jpg"  width="1500" height="700">

        <div class="w3-display-middle" style="width:65%">

            <div class="w3-bar w3-black">
                <button class="w3-bar-item w3-black" ><i class="fa fa-home w3-margin-right"></i>Rent House</button>
            </div>

            <div class="w3-container w3-white w3-padding-48	 ">

                <div style="margin-top:-20px;">
                    <h3>Book house with us</h3>

                    <form action="tenant-listhousesearch.jsp" method="post">

                        <div class="w3-threequarter" style="margin-top: 20px;">
                            <input class="w3-input w3-border" type="text" name="location" placeholder="Enter Location">
                        </div>

                        <button type="submit" class="searchbutton">Search</button>

                    </form>



                </div><br>

            </div>
        </div></header>
</div>

<!-- Page content -->

<!-- End page content -->







</body>
</html>