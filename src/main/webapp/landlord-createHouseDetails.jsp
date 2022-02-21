<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/12/2021
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<style><%@include file="landlord-createHouseDetails.css"%></style>
<head>
    <%@include file="landlord-navbar.html"%>
</head>
<body>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");



    Date today = new Date();

    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    int landlordid = 0;
    if(request.getParameter("landlordid")==null){
        landlordid=  Integer.parseInt(session.getAttribute("landlordid").toString());
    }else{
        landlordid = Integer.parseInt(request.getParameter("landlordid"));
        session.setAttribute("landlordid",landlordid);
    }
    System.out.println(landlordid);
//    int tenantid = Integer.parseInt(request.getParameter("tenantid"));



%>
<div class="topic">
    <p>HOUSE INFORMATION APPLICATION</p>
</div>

<div class="tintedbg">
    <form name="HouseInfoForm" method="post" action="HouseDetailsServlet" enctype = "multipart/form-data">
        <br/>
        <br/>
        <div class="input-box">
            <div class="col">
                <label class="datepub" for="hName">Date Publish</label>
                <input type="text" id="PubDate" class="form-control" name="PubDate" value="<%= ddMMyyyyToday %>" readonly="readonly">
            </div>
        </div>

        <br>

        <div class="toinline">
            <div class="input-box">
                <label for="hName">House Name</label>
                <input type="text" id="hName" class="form-control" maxlength="25" name="hName" placeholder="eg: Bunglow 2 Tingkat" required>
            </div>

            <div class="input-box">
                <label for="hAddress">Address</label>
                <input type="text" id="hAddress" class="form-control" name="hAddress" placeholder="House Address" required>
            </div>
        </div>


        <div class="toinline">
            <div class="input-box">
                <label for="hloc">Location:</label>
                <select name="hloc" id="hloc">
                    <option value="Taman Lipat Kajang">Taman Lipat Kajang</option>
                    <option value="Taman Merlimau">Taman Merlimau</option>
                    <option value="Taman Lipat Perdana">Taman Lipat Perdana</option>
                    <option value="Seri Mendapat">Seri Mendapat</option>
                </select>
            </div>

            <div class="input-box">
                <label for="Pricepm">Price per month (RM)</label>
                <input type="number" id="Pricepm" class="form-control"  name="Pricepm" placeholder="eg: 300" required>
            </div>
        </div>

        <div class="toinline">
            <div class="thedetails">
                <div class="available-detail">
                    <span class="thetopic">Available?</span>
                    <div class="category">
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability" id="OYes" value="Available" checked>Available
                        </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability" id="ONo" value="Not Available" disabled>Not Available
                        </span>
                    </div>
                </div>
            </div>

            <div class="thedetails">
                <div class="wifi-detail">
                    <span class="thetopic">Wifi?</span>
                    <div class="category">
                         <span class="c2">
                            <input class="c1" type="radio" name="hWifi" id="WYes" value="Available">Available
                         </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hWifi" id="WNo" value="Not Available">Not Available
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <table style="width:100%">
            <tr>
                <td>
                    <label class="tenantnum" for="NumOfTenant">Total of Tenant</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnNOT disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfTenant" id="NumOfTenant" value="1">
                        <button class="btn plus-btnNOT" type="button" >+</button>
                    </div>
                </td>
            </tr>


            <tr>
                <td>
                    <label for="NumOfRooms">Number Of Room</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnhotel disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfRooms" id="NumOfRooms"  value="1">
                        <button class="btn plus-btnhotel" type="button">+</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <label for="NumOfToilet">Number Of Toilet</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnbath disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfToilet" id="NumOfToilet" value="1">
                        <button class="btn plus-btnbath" type="button">+</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="NumOfSofa">Number Of Furniture</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnsfa disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfSofa" id="NumOfSofa" value="1">
                        <button class="btn plus-btnsfa" type="button">+</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <label for="NumOfWM">Number Of Washing Machine</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnwm disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfWM" id="NumOfWM" value="1">
                        <button class="btn plus-btnwm" type="button">+</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <label for="NumOfAC">Number Of Air Conditioner</label>
                </td>
                <td>
                    <div class="quantity">
                        <button class="btn minus-btnac disabled" type="button">-</button>
                        <input  style="text-align: center" type="text" name="NumOfAC" id="NumOfAC" value="1">
                        <button class="btn plus-btnac" type="button">+</button>
                    </div>
                </td>
            </tr>
        </table>

        <br>
        <div class="form-group col-md">
            <label for="Desc" style="font-weight: bold">House description:</label>
            <br>
            <textarea id="Desc" maxlength="255" name="Desc" rows="4" cols="50"></textarea>
        </div>


        <br>

        <div class="file-upload-wrapper col-md">
            <label for="hPic" style="font-weight: bold">House Image :</label>
            <input type="file" accept="image/*" id="hPic" name="hPic" class="file-upload"
                   data-height="300" required="required"/>
        </div>


        <br>

        <br/>
        <div class="sbt">
            <input type="hidden" name="landlordid" value="<%=landlordid%>">
            <input type="hidden" name="action" value="create">
            <button type="submit" class="block">Submit</button>
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


</script>
</body>
</html>

