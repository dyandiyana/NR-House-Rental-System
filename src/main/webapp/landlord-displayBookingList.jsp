<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/1/2022
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<style><%@include file="landlord-displayBookingList.css"%></style>
<head>
    <title>Tenancy Booking Application</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%@include file="landlord-navbar.html"%>
<div class="titlebg">
   <fieldset>
    <legend>RUMAH BANGLO TAMAN PERMAI INDAH</legend>
    <div class="htopic">
        <h1>TENANCY BOOKING APPLICATION</h1>
    </div>
   </fieldset>
</div>

<br>

<div class="container">
    <div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:130px">
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'NewApp')">New Application</button>
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'Inpro')">In process</button>
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'Completed')">Completed</button>
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'Canceled')">Canceled</button>
    </div>

   <div style="margin-left:130px">

       <div id="NewApp" class="w3-container mystatus" style="display:none">
           <h2>New Application</h2>
           <br>
        <table>
            <tr>
                <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                <td colspan="2" style="background-color: black; color:#f44336;">Tenancy Details</td>
                <td colspan="2" style="background-color: black; color:#f44336;">Action <i onclick="popnote1()"  class="fa fa-question-circle"></i>
                    <span class="popuptext" id="note">A Simple Popup!</span></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">
                    <button id="btnVM1">View More</button>
                </td>
                <td colspan="2">
                    <button id="btnAprv">Approved</button>
                </td>
            </tr>
        </table>
       </div>

      <div id="Inpro" class="w3-container mystatus" style="display:none">
          <h2>In process</h2>
          <br>
          <table>
              <tr>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Tenancy Details</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Action <i onclick="popnote2()"  class="fa fa-question-circle"></i>
                      <span class="popuptext" id="note2">A Simple Popup!</span></td>
              </tr>
              <tr>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">
                      <button id="btnVM2">View More</button>
                  </td>
                  <td colspan="2">
                      <button id="btnComplete">Completed</button>
                      <br>
                      <button id="btnCancel"> Canceled </button>
                  </td>
              </tr>
          </table>
      </div>

      <div id="Completed" class="w3-container mystatus" style="display:none">
          <h2>Completed</h2>
          <br>
          <table>
              <tr>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                  <td colspan="2" style="background-color: black; color:#f44336;">Tenancy Details</td>
              </tr>
              <tr>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td colspan="2">
                      <button id="btnVM3">View More</button>
                  </td>
              </tr>
          </table>
      </div>

       <div id="Canceled" class="w3-container mystatus" style="display:none">
           <h2>Canceled</h2>
           <br>
           <table>
               <tr>
                   <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                   <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                   <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                   <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                   <td colspan="2" style="background-color: black; color:#f44336;">Tenancy Details</td>
               </tr>
               <tr>
                   <td colspan="2">&nbsp;</td>
                   <td colspan="2">&nbsp;</td>
                   <td colspan="2">&nbsp;</td>
                   <td colspan="2">&nbsp;</td>
                   <td colspan="2">
                       <button id="btnVM4">View More</button>
                   </td>
               </tr>
           </table>
       </div>

</div>

    <div id="popDH" class="overlay">
        <div class="popup">
            <h2>Tenancy Details</h2>
            <br>
            <div class="content">
                <label for="tID">Tenant ID</label>
                <input type="text" id="tID" name="tID">
                <br>
                <label for="tName">Name</label>
                <input type="text" id="tName" name="tName">
                <br>
                <label for="tAge">Age</label>
                <input type="text" id="tAge" name="tAge">
                <br>
                <label for="temail">Email</label>
                <input type="text" id="temail" name="temail">
                <br>
                <label for="tPhone">Phone Number</label>
                <input type="text" id="tPhone" name="tPhone">
                <br>
                <label for="tgender">Gender</label>
                <input type="text" id="tgender" name="tgender">
                <br>
                <label>Booking Deposit</label>
                <p>-</p>
                <br>
                <label>Booking Agreement</label>
                <p>-</p>
                <br>
            </div>

            <button class="close">Close</button>
        </div>
</div>


    <div id="popAppr" class="overlay">
        <span class="close2">&times;</span>
        <div class="popup2">
            <div class="cont">
               <h2>Are you sure?</h2>
               <div class="content">
               <p>Are you sure you want to accept this application? <br> Your action cannot be undone!</p>
                  <div class="clearfix">
                   <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                   <button type="button" onclick="document.getElementById('id01').style.display='none'" class="deletebtn">Delete</button>
                  </div>
               </div>
            </div>
        </div>
    </div>
</div>

<script>

    //each tab of booking status
    function opentab(evt, statusName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("mystatus");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
        }
        document.getElementById(statusName).style.display = "block";
        evt.currentTarget.className += " w3-red";
    }

    //pop up Tenant Details
    var modal = document.getElementById("popDH");
    var btnVM1 = document.getElementById("btnVM1");
    var btnVM2 = document.getElementById("btnVM2");
    var btnVM3 = document.getElementById("btnVM3");
    var btnVM4 = document.getElementById("btnVM4");
    var a = document.getElementsByClassName("close")[0];

    btnVM1.onclick = function() {
        modal.style.display = "block";
    }

    btnVM2.onclick = function() {
        modal.style.display = "block";
    }
    btnVM3.onclick = function() {
        modal.style.display = "block";
    }
    btnVM4.onclick = function() {
        modal.style.display = "block";
    }

    a.onclick = function() {
        modal.style.display = "none";
    }

    //hover question mark on action table
    function popnote1() {
        var note1 = document.getElementById("note");
        note1.classList.toggle("show");
    }

    //popApproval
    var appr = document.getElementById("popAppr");
    var apprbtn = document.getElementById("btnAprv");
    var apprclose = document.getElementsByClassName("close2")[0];

    apprbtn.onclick = function() {
        appr.style.display = "block";
    }

    apprclose.onclick = function() {
        appr.style.display = "none";
    }



</script>
</body>
</html>
