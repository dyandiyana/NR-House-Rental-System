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
<style><%@include file="landlord-updateHouseDetails.css"%></style>
<head>
    <%@include file="landlord-navbar.html"%>
</head>
<body>
<%

    String houseidJ= (String)request.getAttribute("hids");
    String housenameJ= (String)request.getAttribute("hnames");
    String housemonth= (String)request.getAttribute("hpaymonth");
    String houseadd= (String)request.getAttribute("haddress");
    String houseloc= (String)request.getAttribute("houseloc");
    Date d= (Date) request.getAttribute("hpdate");
    String available= (String)request.getAttribute("hava");
    String hnotenant= (String)request.getAttribute("hnoT");
    String hnoroom= (String)request.getAttribute("hnoR");
    String hnotoilet= (String)request.getAttribute("hnoToil");
    String hnoac= (String)request.getAttribute("hnoAC");
    String wifi= (String)request.getAttribute("hnoWifi");
    String furnish= (String)request.getAttribute("hnoFur");
    String washing= (String)request.getAttribute("hnoWM");
    String housedesc= (String)request.getAttribute("hdec");
    String housepic= (String)request.getAttribute("hpic");


%>
<div class="topic">
    <p>HOUSE INFORMATION APPLICATION</p>
</div>

<div class="tintedbg">
    <form name="HouseInfoForm" method="post" action="LAupdateHouseDetailsServlet" onsubmit="return confirm('Are you really wish to update?');"  enctype = "multipart/form-data">
        <br/>
        <input type="number" name="hid" value="<%=houseidJ%>" hidden>
        <%--        <input type="text" name="houseid" value="<%=resultSet.getString("id") %>">--%>
        <br/>
        <div class="input-box">
            <div class="col">
                <label class="datepub" for="hName">Date Publish</label>
                <input type="text" id="PubDate" class="form-control" name="PubDate" value="<%=d%>" readonly="readonly">
            </div>
        </div>

        <br>

        <div class="toinline">
            <div class="input-box">
                <label for="hName">House Name</label>
                <input type="text" id="hName" class="form-control" maxlength="25" name="hName" value="<%=housenameJ%>" required>
            </div>

            <div class="input-box">
                <label for="hAddress">Address</label>
                <input type="text" id="hAddress" class="form-control" name="hAddress" value="<%=houseadd%>" required>
            </div>
        </div>



        <div class="toinline">
            <div class="input-box">
                <label for="hloc">Location:</label>
                <%
                    if (houseloc.equals("Taman Lipat Kajang")){
                %>
                <select name="hloc" id="hloc">
                    <option value="<%=houseloc%>"><%=houseloc%></option>
                    <option value="Taman Merlimau">Taman Merlimau</option>
                    <option value="Taman Lipat Perdana">Taman Lipat Perdana</option>
                    <option value="Seri Mendapat">Seri Mendapat</option>
                </select>
                <%
                    }
                    else if (houseloc.equals("Taman Merlimau")){
                %>
                <select name="hloc" id="hloc">
                    <option value="<%=houseloc%>"><%=houseloc%></option>
                    <option value="Taman Lipat Kajang">Taman Lipat Kajang</option>
                    <option value="Taman Lipat Perdana">Taman Lipat Perdana</option>
                    <option value="Seri Mendapat">Seri Mendapat</option>
                </select>
                <%
                    }
                    else if (houseloc.equals("Taman Lipat Perdana")){
                %>
                <select name="hloc" id="hloc">
                    <option value="<%=houseloc%>"><%=houseloc%></option>
                    <option value="Taman Merlimau">Taman Merlimau</option>
                    <option value="Taman Lipat Kajang">Taman Lipat Kajang</option>
                    <option value="Seri Mendapat">Seri Mendapat</option>
                </select>
                <%
                }
                else if (houseloc.equals("Seri Mendapat")){
                %>
                <select name="hloc" id="hloc">
                    <option value="<%=houseloc%>"><%=houseloc%></option>
                    <option value="Taman Merlimau">Taman Merlimau</option>
                    <option value="Taman Lipat Kajang">Taman Lipat Kajang</option>
                    <option value="Taman Lipat Perdana">Taman Lipat Perdana</option>
                </select>
                <%
                    }
                %>
            </div>

            <div class="input-box">
                <label for="Pricepm">Price per month (RM)</label>
                <input type="number" id="Pricepm" class="form-control"  name="Pricepm" placeholder="eg: 300" value="<%=housemonth%>" required>
            </div>
        </div>

        <div class="toinline">
            <div class="thedetails">
                <div class="available-detail">
                    <span class="thetopic">Available?</span>
                    <%
                        if (available.equals("Available")){
                    %>
                    <div class="category">
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability"  value="Available" checked>Available
                        </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability"  value="Not Available">Not Available
                        </span>
                    </div>
                    <%
                        }

                        else if((available.equals("Not Available"))){
                    %>
                    <div class="category">
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability"  value="Available" checked>Available
                        </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hAvailability"  value="Not Available">Not Available
                        </span>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="thedetails">
                <div class="wifi-detail">
                    <span class="thetopic">Wifi?</span>
                    <%
                        if (wifi.equals("true")){
                    %>
                    <div class="category">
                         <span class="c2">
                            <input class="c1" type="radio" name="hWifi" value=true checked>Available
                         </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hWifi">Not Available
                        </span>
                    </div>
                    <%
                    }

                    else if((wifi.equals("false"))){
                    %>
                    <div class="category">
                         <span class="c2">
                            <input class="c1" type="radio" name="hWifi"  value="Available">Available
                         </span>
                        <span class="c2">
                            <input class="c1" type="radio" name="hWifi" value="Not Available" checked>Not Available
                        </span>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>


        <br>
        <div class="toinline">
            <div class="thedetails">
                <label class="tenantnum" for="NumOfTenant">Total of Tenant</label>
                <div class="quantity">
                    <button class="btn minus-btnNOT disabled" type="button">-</button>
                    <input style="text-align: center" type="text" name="NumOfTenant" id="NumOfTenant" value="<%=hnotenant%>">
                    <button class="btn plus-btnNOT" type="button">+</button>
                </div>
            </div>
        </div>


        <div class="toinline">
            <div class="thedetails">
                <div class="quantity">
                    <img src="https://img.icons8.com/ios-glyphs/40/000000/sleeping-in-bed.png"/>
                    <button class="btn minus-btnhotel disabled" type="button">-</button>
                    <input style="text-align: center" type="text" name="NumOfRooms" id="NumOfRooms"  value="<%=hnoroom%>">
                    <button class="btn plus-btnhotel" type="button">+</button>
                </div>
            </div>

            <div class="thedetails">
                <div class="quantity">
                    <img src="https://img.icons8.com/ios-glyphs/40/000000/shower-and-tub.png"/>
                    <button class="btn minus-btnbath disabled" type="button">-</button>
                    <input style="text-align: center" type="text" name="NumOfToilet" id="NumOfToilet" value="<%=hnotoilet%>">
                    <button class="btn plus-btnbath" type="button">+</button>
                </div>
            </div>
        </div>

        <div class="toinline">
            <div class="thedetails">
                <div class="quantity">
                    <img src="https://img.icons8.com/ios-filled/40/000000/furniture.png"/>
                    <button class="btn minus-btnsfa disabled" type="button">-</button>
                    <input style="text-align: center" type="text" name="NumOfSofa" id="NumOfSofa" value="<%=furnish%>"/>
                    <button class="btn plus-btnsfa" type="button">+</button>
                </div>
            </div>

            <div class="thedetails">
                <div class="quantity">
                    <td style="text-align: center"><img src="https://img.icons8.com/ios-glyphs/40/000000/washing-machine.png"/>
                        <button class="btn minus-btnwm disabled" type="button">-</button>
                        <input style="text-align: center" type="text" name="NumOfWM" id="NumOfWM"  value="<%=washing%>"/>
                        <button class="btn plus-btnwm" type="button">+</button>
                </div>
            </div>
        </div>

        <div class="toinline">
            <div class="thedetails">
                <div class="quantity">
                    <img src="https://img.icons8.com/fluency-systems-filled/40/000000/air-conditioner.png"/>
                    <button class="btn minus-btnac disabled" type="button">-</button>
                    <input  style="text-align: center" type="text" name="NumOfAC" id="NumOfAC" value="<%=hnoac%>"/>
                    <button class="btn plus-btnac" type="button">+</button>
                </div>
            </div>
        </div>

        <br>
        <div class="form-group col-md">
            <label for="Desc">House description:</label>
            <br>
            <textarea id="Desc" maxlength="255" name="Desc" rows="4" cols="50"><%=housedesc%></textarea>
        </div>


        <br>

        <div class="file-upload-wrapper col-md">
            <label for="hPic">House Image :</label>
            <input type="file" accept="image/*" id="hPic" name="hPic" class="file-upload"
                   data-height="300" required="required"/>
        </div>


        <br>

        <br/>
        <div class="sbt">
            <button type="submit" class="block">Update</button>
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

<%--<%--%>
<%--    String mytext = request.getParameter("PubDate");--%>

<%--    if(mytext == null){--%>

<%--    }--%>
<%--    else{--%>
<%--        session.setAttribute("sdid",request.getParameter("hid"));--%>
<%--        session.setAttribute("sdid",request.getParameter("hName"));--%>
<%--        session.setAttribute("sdid",request.getParameter("PubDate"));--%>
<%--        session.setAttribute("sdName",request.getParameter("hAddress"));--%>
<%--        session.setAttribute("sdEmail",request.getParameter("Pricepm"));--%>
<%--        session.setAttribute("sdPnum",request.getParameter("hAvailability"));--%>
<%--        session.setAttribute("sdid",request.getParameter("hWifi"));--%>
<%--        session.setAttribute("sdName",request.getParameter("NumOfTenant"));--%>
<%--        session.setAttribute("sdEmail",request.getParameter("NumOfRooms"));--%>
<%--        session.setAttribute("sdPnum",request.getParameter("NumOfToilet"));--%>
<%--        session.setAttribute("sdid",request.getParameter("NumOfAC"));--%>
<%--        session.setAttribute("sdName",request.getParameter("NumOfSofa"));--%>
<%--        session.setAttribute("sdEmail",request.getParameter("NumOfWM"));--%>
<%--        session.setAttribute("sdPnum",request.getParameter("Desc"));--%>
<%--        session.setAttribute("sdid",request.getParameter("hPic"));--%>
<%--        session.setAttribute("sdName",request.getParameter("hAgree"));--%>

<%--        out.println("session created");--%>
<%--    }--%>
<%--%>--%>
</body>
</html>
