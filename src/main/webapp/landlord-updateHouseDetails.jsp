<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/12/2021
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<style><%@include file="landlord-updateHouseDetails.css"%></style>
<head>
    <%@include file="landlord-navbar.html"%>
</head>
<body>
<%
   Date today = new Date();

    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);


%>
<div class="topic">
    <p>UPDATE HOUSE INFORMATION</p>
</div>

<div class="tintedbg">
    <form name="HouseInfoForm" method="post" action="HouseDetails.jsp"  enctype = "multipart/form-data">
    <br/>
<%--        <input type="hidden" name="houseid" value="<%=resultSet.getString("id") %>">--%>
<%--        <input type="text" name="houseid" value="<%=resultSet.getString("id") %>">--%>
    <br/>
        <div class="form-row">
            <div class="col-7"></div>
            <div class="col"></div>
            <div class="col">
                <label for="hName">Date Publish</label>
                <input type="text" id="PubDate" class="form-control" name="PubDate" value="<%= ddMMyyyyToday %>" readonly="readonly">
            </div>
        </div>

        <br>

        <div class="form-group col-md">
                <label for="hName">House Name</label>
                <input type="text" id="hName" class="form-control" name="hName" placeholder="Your House Name">
        </div>

        <div class="form-group col-md">
                <label for="hAddress">Address</label>
                <input type="text" id="hAddress" class="form-control" name="hAddress" placeholder="eg: Taman Sentosa Jaya">
        </div>

        <div class="form-row col-md">
            <div class="form-group col-md-6">
                <label for="Pricepm">Price per month (RM)</label>
                <input type="number" id="Pricepm" class="form-control"  name="Pricepm" placeholder="eg: 300">
            </div>
            <div class="form-group col-md-3">
                <p>Available?</p>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="hAvailability" id="OYes" value="Yes">
                    <label class="form-check-label" for="OYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="hAvailability" id="ONo" value="No">
                    <label class="form-check-label" for="ONo">No</label>
                </div>
            </div>
            <div class="form-group col-md-3">
                <p>Wifi?</p>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="hWifi" id="WYes" value="Yes">
                    <label class="form-check-label" for="OYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="hWifi" id="WNo" value="No">
                    <label class="form-check-label" for="ONo">No</label>
                </div>
            </div>
        </div>

        <br>
        <div class="form-group col-md-3">
                <label for="NumOfTenant">Number of Tenant</label>
                <div class="quantity">
                    <img src="pic/group-512.png"  width="40" height="35">
                    <button class="btn minus-btnNOT disabled" type="button">-</button>
                    <input type="text" id="NumOfTenant" value="1">
                    <button class="btn plus-btnNOT" type="button" >+</button>
                </div>
        </div>

        <br>
        <div class="form-row">
            <div class="bgd">
        <p>More Details</p>
            </div>
        </div>
        <br>
        <br>

        <div class="form-row col-md">
            <div class="col-3">
                <div class="quantity">
                    <img src="pic/hotel-512.png"  width="40" height="40">
                    <button class="btn minus-btnhotel disabled" type="button">-</button>
                    <input type="text" id="NumOfRooms"  value="1">
                    <button class="btn plus-btnhotel" type="button">+</button>
                </div>
            </div>

            <div class="col-3">
                    <div class="quantity">
                       <img src="pic/bathroom.png"  width="40" height="40">
                      <button class="btn minus-btnbath disabled" type="button">-</button>
                      <input type="text" id="NumOfToilet" value="1">
                      <button class="btn plus-btnbath" type="button">+</button>
                    </div>
            </div>

            <div class="col-3">
                <div class="quantity">
                    <img src="pic/air-conditioner.png"  width="40" height="40">
                    <button class="btn minus-btnac disabled" type="button">-</button>
                    <input type="text" id="NumOfAC" value="1">
                    <button class="btn plus-btnac" type="button">+</button>
                </div>
            </div>
        </div>

        <br>
        <div class="form-row col-md">
            <div class="col-3">
                <div class="quantity">
                    <img src="pic/sofa-512.png"  width="40" height="40">
                    <button class="btn minus-btnsfa disabled" type="button">-</button>
                    <input type="text" id="NumOfSofa" value="1">
                    <button class="btn plus-btnsfa" type="button">+</button>
                </div>
            </div>


           <div class="col-3">
                <div class="quantity">
                    <img src="pic/washing-machine-512.png"  width="36" height="40">
                    <button class="btn minus-btnwm disabled" type="button">-</button>
                    <input type="text" id="NumOfWM" value="1">
                    <button class="btn plus-btnwm" type="button">+</button>
                </div>
           </div>
        </div>

        <br>
            <div class="form-group col-md">
                <label for="Desc">House description:</label>
                <br>
                <textarea id="Desc" name="Desc" rows="4" cols="50"></textarea>
            </div>


        <br>
        <div class="file-upload-wrapper col-md">
            <label for="hPic">House Image :</label>
                <input type="file" id="hPic" name="hPic" class="file-upload"
                       data-height="300" required="required"/>
        </div>

        <br>
        <div class="mb-3 col-md">
            <label for="hAgree" class="form-label">House Agreement</label>
            <input class="form-control form-control-sm" id="hAgree" type="file" multiple="">
        </div>

    <br/>
        <div class="sbt mx-auto col-md">
            <button type="button" class="Cancelbtn btn-md" onclick="cn()">Cancel</button>
            <button type="button" class="btn btn-primary btn-md">Update</button>
        </div>
    <br/>
    </form>
</div>


<script>

    //upload file

    //$('.file-upload').file_upload();

    //price under 1 button disabled

    //value increment and decrement
    var valueCountNOT;
    var valueCounthotel;
    var valueCountbath;
    var valueCountAC;
    var valueCountsfa;
    var valueCountWM;

    //Count Number of tenant
    document.querySelector(".minus-btnNOT").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnNOT").addEventListener("click", function () {
        //getting value input
        valueCountNOT = document.getElementById("NumOfTenant").value;


        //input value increment by 1
        valueCountNOT++;

        //setting increment input value
        document.getElementById("NumOfTenant").value = valueCountNOT

        if (valueCountNOT > 1) {
            document.querySelector(".minus-btnNOT").removeAttribute("disabled");
            document.querySelector(".minus-btnNOT").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnNOT").addEventListener("click",function()
    {
        //getting value input
        valueCountNOT = document.getElementById("NumOfTenant").value;

        //input value increment by 1
        valueCountNOT --;

        //setting increment input value
        document.getElementById("NumOfTenant").value = valueCountNOT

        if(valueCountNOT == 1){
            document.querySelector(".minus-btnNOT").setAttribute("disabled","disabled")
        }
    })


    //Count Number of bedroom
    document.querySelector(".minus-btnhotel").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnhotel").addEventListener("click", function () {
        //getting value input
        valueCounthotel = document.getElementById("NumOfRooms").value;


        //input value increment by 1
        valueCounthotel++;

        //setting increment input value
        document.getElementById("NumOfRooms").value = valueCounthotel

        if (valueCounthotel > 1) {
            document.querySelector(".minus-btnhotel").removeAttribute("disabled");
            document.querySelector(".minus-btnhotel").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnhotel").addEventListener("click",function()
    {
        //getting value input
        valueCounthotel = document.getElementById("NumOfRooms").value;

        //input value increment by 1
        valueCounthotel --;

        //setting increment input value
        document.getElementById("NumOfRooms").value = valueCounthotel

        if(valueCounthotel == 1){
            document.querySelector(".minus-btnhotel").setAttribute("disabled","disabled")
        }
    })



    //Count Number of bathroom
    document.querySelector(".minus-btnbath").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnbath").addEventListener("click", function () {
        //getting value input
        valueCountbath = document.getElementById("NumOfToilet").value;


        //input value increment by 1
        valueCountbath++;

        //setting increment input value
        document.getElementById("NumOfToilet").value = valueCountbath

        if (valueCountbath > 1) {
            document.querySelector(".minus-btnbath").removeAttribute("disabled");
            document.querySelector(".minus-btnbath").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnbath").addEventListener("click",function()
    {
        //getting value input
        valueCountbath = document.getElementById("NumOfToilet").value;

        //input value increment by 1
        valueCountbath --;

        //setting increment input value
        document.getElementById("NumOfToilet").value = valueCountbath

        if(valueCountbath == 1){
            document.querySelector(".minus-btnbath").setAttribute("disabled","disabled")
        }
    })



    //Count Number of AC
    document.querySelector(".minus-btnac").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnac").addEventListener("click", function () {
        //getting value input
        valueCountAC = document.getElementById("NumOfAC").value;


        //input value increment by 1
        valueCountAC++;

        //setting increment input value
        document.getElementById("NumOfAC").value = valueCountAC

        if (valueCountAC > 1) {
            document.querySelector(".minus-btnac").removeAttribute("disabled");
            document.querySelector(".minus-btnac").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnac").addEventListener("click",function()
    {
        //getting value input
        valueCountAC = document.getElementById("NumOfAC").value;

        //input value increment by 1
        valueCountAC --;

        //setting increment input value
        document.getElementById("NumOfAC").value = valueCountAC

        if(valueCountAC == 1){
            document.querySelector(".minus-btnac").setAttribute("disabled","disabled")
        }
    })


    //Count Number of furniture
    document.querySelector(".minus-btnsfa").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnsfa").addEventListener("click", function () {
        //getting value input
        valueCountsfa = document.getElementById("NumOfSofa").value;


        //input value increment by 1
        valueCountsfa++;

        //setting increment input value
        document.getElementById("NumOfSofa").value = valueCountsfa

        if (valueCountsfa > 1) {
            document.querySelector(".minus-btnsfa").removeAttribute("disabled");
            document.querySelector(".minus-btnsfa").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnsfa").addEventListener("click",function()
    {
        //getting value input
        valueCountsfa= document.getElementById("NumOfSofa").value;

        //input value increment by 1
        valueCountsfa--;

        //setting increment input value
        document.getElementById("NumOfSofa").value = valueCountsfa

        if(valueCountsfa == 1){
            document.querySelector(".minus-btnsfa").setAttribute("disabled","disabled")
        }
    })


    //Count Number of Washing Machine
    document.querySelector(".minus-btnwm").setAttribute("disabled", "disabled");
    //plus button
    document.querySelector(".plus-btnwm").addEventListener("click", function () {
        //getting value input
        valueCountWM = document.getElementById("NumOfWM").value;


        //input value increment by 1
        valueCountWM++;

        //setting increment input value
        document.getElementById("NumOfWM").value = valueCountWM

        if (valueCountWM > 1) {
            document.querySelector(".minus-btnwm").removeAttribute("disabled");
            document.querySelector(".minus-btnwm").classList.remove("disabled");

        }
    })


    //minus button
    document.querySelector(".minus-btnwm").addEventListener("click",function()
    {
        //getting value input
        valueCountWM = document.getElementById("NumOfWM").value;

        //input value increment by 1
        valueCountWM --;

        //setting increment input value
        document.getElementById("NumOfWM").value = valueCountWM

        if(valueCountWM == 1){
            document.querySelector(".minus-btnwm").setAttribute("disabled","disabled")
        }
    })

    function cn(){
        confirm("Do you really want to go back? Your update will not be saved.");
        location.href = "MoreInfoHouse.jsp";
    }

</script>

</body>
</html>
