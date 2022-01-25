<%--
  Created by IntelliJ IDEA.
  User: anis zamri
  Date: 2/1/2022
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<title>NR RENTAL SYSYTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="house.css">
<style>
    *{
    font-family: 'Poppins', sans-serif;

    }

    body {
    background-color: #c7dde0;
    background-size: cover;
    justify-content: center;
    height: 100%;
    font-size: 100%;

    }



    .dropdown option
    {
    border: none;
    }


    a:link { color: black; text-decoration: none; }
    a:visited { color: black; text-decoration: none; }
    a:hover { color: black; text-decoration: none; }
    a:active { color: black; text-decoration: none; }

    .custom-select
    {
    position: relative;
    }




    .dropdown
    {
    padding:5px;
    text-align: center;
    border-radius: 5px;
    margin-bottom:-70px;
    }




    .container{
    border-radius: 10px;
    padding-top: 25%;
    background-color: aliceblue;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        width: 39cm;
        min-height: 100%;
        text-align:justify;
        margin-top:5%;
        margin-left: 19px;
    padding:20px;


    display: flex;
    align-items:baseline;
    justify-content: center;
    flex-wrap: wrap;

    }



    .Hcont {
    background-color: white;
    height: 380px;
    width: 300px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px;
    padding: 0px 0px 10px 0px;
    margin: 20px 20px 20px 20px;
    text-decoration: none;
    }



    .housepic{
    background-color: grey;
    width: 100%;
    height: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px 10px 0px 0px;

    }

    .houseName{

    padding-left: 10px;
    padding-top: 20px;
    font-size: 15px;
    }

    .status
    {
    color: rgb(27, 189, 27);
    }

    .fa-bed, .fa-bath, .fa-wifi
    {
    opacity: 0.5;
    }



    .MyLink{
    text-align: center;
    }

    .MyLink button{
    background-color: white;
    border:none;
    border-radius: 5px;
    cursor: pointer;
    color: cornflowerblue;
    width: 5cm;
    height:1cm;
    }

    .MyLink button:hover{
    background-color: #007bff;
    color: white;
    border: none;
    width: 5cm;
    height:1cm;
    }

    .MyLink button:active{
    background-color: #007bff;
    color: white;
    border: none;
    width: 5cm;
    height:1cm;
    }




    .C button{
    bottom: 20px;
    position: fixed;
    right: 10px;
    font-family: "Inter", sans-serif;
    font-size: 15px;
    width: 90px;
    height: 90px;
    color: #000000;
    border:none;
    border-radius: 49px;
    box-shadow: 8px 8px 7px 0px rgba(0, 0, 0, 0.25);
    cursor:pointer;
    overflow: hidden;
    z-index: 3;
    }

    .C button:hover{
    background : #E1D7D7;
    }

    .C button:active {
    background : #C1C1C1;
    }

    .C button__text,.C button__icon {
    align-items:center;
    padding : 1px 10px;
    height:100%;
    }

</style>
<body>

<%@include file="tenant-navbar.html"%>


<!-- Search -->


<div class="search " style="width:60%">

    <div class="w3-bar w3-black">
        <button class="w3-bar-item w3-black " ><i class="fa fa-home w3-margin-right"></i>Rent House</button>
    </div>

    <div class="w3-container w3-white w3-padding-16">

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

<!-- House -->



<!-- End page content -->

<div class="container">



    <div class="Hcont" >
        <a href="tenant-houseMerlimau.jsp">
            <div class="housepic"></div>
            <div class="houseName">
                <p class="name">Rumah Sewa Taman Merlimau</p>
                <p class="price">RM800</p>
                <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
                <p class="status">Available</p>

            </div>
        </a>
    </div>

    <div class="Hcont">
        <a href="tenant-houseLipatKajang.jsp">
            <div class="housepic"></div>
            <div class="houseName">
                <p class="name">Rumah Sewa Taman Lipat Kajang</p>
                <p class="price">RM800</p>
                <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
                <p class="status">Available</p>

            </div>
        </a>
    </div>

    <div class="Hcont">
        <a href="">
            <div class="housepic"></div>
            <div class="houseName">
                <p class="name">Rumah Minangkabau</p>
                <p class="price">RM800</p>
                <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
                <p class="status">Available</p>

            </div>
        </a>
    </div>

    <div class="Hcont">
        <a href="">
            <div class="housepic"></div>
            <div class="houseName">
                <p class="name">Rumah Pangsa</p>
                <p class="price">RM800</p>
                <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
                <p class="status">Available</p>

            </div>
        </a>
    </div>








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



