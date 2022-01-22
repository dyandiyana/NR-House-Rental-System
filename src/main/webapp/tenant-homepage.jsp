<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<title>NR RENTAL SYSYTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

    body,h1,h2,h3,h4,h5,h6
    {
        font-family: "Raleway", Arial, Helvetica, sans-serif
    }

    .custom-select
    {
        position: relative;
        font-family: Arial;
    }


    .dropdown
    {
        background-color: black;
        color: white;
        padding:10px;
        text-align: center;
        border-radius: 5px;
        margin-bottom:-70px;
    }



</style>
<body class="w3-light-grey">
<%@include file="tenant-navbar.html"%>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
    <img class="house.jpg" src="house.jpg"  width="1500" height="700">

    <div class="w3-display-middle" style="width:65%">

        <div class="w3-bar w3-black">
            <button class="w3-bar-item w3-black" ><i class="fa fa-home w3-margin-right"></i>Rent House</button>
        </div>

        <div class="w3-container w3-white w3-padding-48	 ">

            <div style="margin-top:-20px;">
                <h3>Book house with us</h3>

                <div class="w3-threequarter	">
                    <input class="w3-input w3-border" type="text" placeholder="Enter Location">
                </div>

                <button class="w3-button w3-dark-grey" style="width:150px;">Search</button>
            </div><br>

            <select  class="dropdown" style="width:140px; ">
                <option value=""disable selected>Locations</option>
                <option value="Kuala Lumpur">Taman Lipat Kajang</option>
                <option value="Selangor">Taman Merlimau</option>
                <option value="Perak">Taman Lipat Perdana</option>
                <option value="Perak">Seri Mendapat"</option>
            </select>

            <select class="dropdown" style="margin-bottom:-140px; ">>
                <option value=""disable selected>Price (min)</option>
                <option value="no min">No min</option>
                <option value="RM100">RM100</option>
                <option value="RM200">RM200</option>
                <option value="RM500">RM500</option>
                <option value="RM1000">RM1000</option>
            </select>

            <select class="dropdown">
                <option value=""disable selected>Price (max)</option>
                <option value="no min">No max</option>
                <option value="RM100">RM100</option>
                <option value="RM200">RM200</option>
                <option value="RM500">RM500</option>
                <option value="RM1000">RM1000</option>
            </select>

            <select class="dropdown">
                <option value=""disable selected>Rooms</option>
                <option value="no min">1</option>
                <option value="RM100">2</option>
                <option value="RM200">3</option>
                <option value="RM500">4</option>
                <option value="RM1000">5</option>
            </select>

            <select class="dropdown">
                <option value=""disable selected>Bathooms</option>
                <option value="no min">1</option>
                <option value="RM100">2</option>
                <option value="RM200">3</option>
                <option value="RM500">4</option>
                <option value="RM1000">5</option>
            </select>



        </div>
    </div>
</header>

<!-- Page content -->

<!-- End page content -->







</body>
</html>