<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/1/2022
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<style><%@include file="landlord-displayBookingList.css"%></style>
<head>
    <title>Tenancy Booking Application</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%@include file="admin-navbar.html"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("adminid")==null)
        response.sendRedirect("admin-login.jsp");

    int houseid= Integer.parseInt(session.getAttribute("houseid").toString());
%>
<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user = "gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    <c:set var="hid" value="<%=houseid%>"/>
    SELECT  H.HOUSENAME, B.BOOKINGID, B.BOOKINGSTATUS, B.BOOKINGTIME, B.BOOKINGDATE, B.BOOKINGDEPO, B.BOOKINGAGREEMENT, B.BOOKINGAPPROVALDATE, B.TENANTID, B.HOUSEID, h.housename, t.tenantid,t.tenantname,t.tenantage,t.tenantemail,t.tenantphoneno,t.tenantgender
    from TENANT t
    join BOOKINGDETAILS B
    on t.TENANTID = B.TENANTID
    join HOUSEDETAILS H
    on B.HOUSEID = H.HOUSEID
    WHERE H.houseid = ?
    <sql:param value="${hid}" />
</sql:query>
<sql:query dataSource="${ic}" var="ac">
    <c:set var="hid" value="<%=houseid%>"/>
    SELECT  * from housedetails
    WHERE houseid = ?
    <sql:param value="${hid}" />
</sql:query>

<div class="titlebg">
    <fieldset>
        <c:forEach var="result" items="${ac.rows}">
            <legend>${result.housename}</legend>
        </c:forEach>
        <div class="htopic">
            <h1>TENANCY BOOKING APPLICATION</h1>
        </div>
    </fieldset>
</div>

<br>

<div class="container">
    <div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:130px">
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'NewApp')">New Application</button>
        <button class="w3-bar-item w3-button tablink" onclick="opentab(event, 'Approv')">Approved</button>
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
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Name</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Age</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Email</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Phone Num</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Gender</td>
                </tr>
                <c:forEach var="result" items="${oc.rows}">
                    <c:set var="status" value="${result.bookingstatus}"/>
                    <c:if test="${status=='Pending'}">
                        <tr>
                            <td colspan="2">${result.bookingid}</td>
                            <td colspan="2">${result.bookingtime}</td>
                            <td colspan="2">${result.bookingdate}</td>
                            <td colspan="2">${result.tenantname}</td>
                            <td colspan="2">${result.tenantage}</td>
                            <td colspan="2">${result.tenantemail}</td>
                            <td colspan="2">${result.tenantphoneno}</td>
                            <td colspan="2">${result.tenantgender}</td>

                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

        <div id="Approv" class="w3-container mystatus" style="display:none">
            <h2>Approved</h2>
            <br>
            <table>
                <tr>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Name</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Age</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Email</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Phone Num</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Gender</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Agreement</td>

                </tr>
                <c:forEach var="result" items="${oc.rows}">
                    <c:set var="status" value="${result.bookingstatus}"/>
                    <c:if test="${status=='Approved'}">
                        <tr>
                            <td colspan="2">${result.bookingid}</td>
                            <td colspan="2">${result.bookingtime}</td>
                            <td colspan="2">${result.bookingdate}</td>
                            <td colspan="2">${result.tenantname}</td>
                            <td colspan="2">${result.tenantage}</td>
                            <td colspan="2">${result.tenantemail}</td>
                            <td colspan="2">${result.tenantphoneno}</td>
                            <td colspan="2">${result.tenantgender}</td>
                            <td colspan="2">${result.bookingapprovaldate}</td>
                            <td colspan="2"><a href="fileDoc/${result.bookingagreement}">${result.bookingagreement}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

        <div id="Inpro" class="w3-container mystatus" style="display:none">
            <h2>In Process</h2>
            <br>
            <table>
                <tr>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking ID</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Time</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Date</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Name</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Age</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Email</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Phone Num</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Gender</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Agreement</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Deposit</td>
                </tr>

                <c:forEach var="result" items="${oc.rows}">
                    <c:set var="status" value="${result.bookingstatus}"/>
                    <c:if test="${status=='In Process'}">
                        <tr>
                            <td colspan="2">${result.bookingid}</td>
                            <td colspan="2">${result.bookingtime}</td>
                            <td colspan="2">${result.bookingdate}</td>
                            <td colspan="2">${result.tenantname}</td>
                            <td colspan="2">${result.tenantage}</td>
                            <td colspan="2">${result.tenantemail}</td>
                            <td colspan="2">${result.tenantphoneno}</td>
                            <td colspan="2">${result.tenantgender}</td>
                            <td colspan="2">${result.bookingapprovaldate}</td>
                            <td colspan="2"><a href="fileDoc/${result.bookingagreement}">${result.bookingagreement}</a></td>
                            <td colspan="2"><a href="fileDoc/${result.bookingdepo}">${result.bookingdepo}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
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
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Name</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Age</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Email</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Phone Num</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Gender</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Approval Date</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Agreement</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Deposit</td>
                </tr>

                <c:forEach var="result" items="${oc.rows}">
                    <c:set var="status" value="${result.bookingstatus}"/>
                    <c:if test="${status=='Completed'}">
                        <tr>
                            <td colspan="2">${result.bookingid}</td>
                            <td colspan="2">${result.bookingtime}</td>
                            <td colspan="2">${result.bookingdate}</td>
                            <td colspan="2">${result.tenantname}</td>
                            <td colspan="2">${result.tenantage}</td>
                            <td colspan="2">${result.tenantemail}</td>
                            <td colspan="2">${result.tenantphoneno}</td>
                            <td colspan="2">${result.tenantgender}</td>
                            <td colspan="2">${result.bookingapprovaldate}</td>
                            <td colspan="2"><a href="fileDoc/${result.bookingagreement}">${result.bookingagreement}</a></td>
                            <td colspan="2"><a href="fileDoc/${result.bookingdepo}">${result.bookingdepo}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
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
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Name</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Age</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Email</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Phone Num</td>
                    <td colspan="2" style="background-color: black; color:#f44336;">Tenant  Gender</td>
                </tr>
                <c:forEach var="result" items="${oc.rows}">
                    <c:set var="status" value="${result.bookingstatus}"/>
                    <c:if test="${status=='Canceled'}">
                        <tr>
                            <td colspan="2">${result.bookingid}</td>
                            <td colspan="2">${result.bookingtime}</td>
                            <td colspan="2">${result.bookingdate}</td>
                            <td colspan="2">${result.tenantname}</td>
                            <td colspan="2">${result.tenantage}</td>
                            <td colspan="2">${result.tenantemail}</td>
                            <td colspan="2">${result.tenantphoneno}</td>
                            <td colspan="2">${result.tenantgender}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>


    </div>
</div>


<c:forEach var="result" items="${oc.rows}">
    <div id="popDH" class="overlay">
        <div class="popup">
            <h2>Tenancy Details</h2>
            <br>
            <div class="content">
                <label for="tID">Tenant ID</label>
                <input type="text" id="tID" name="tID" value="${result.tenantid}">
                <br>
                <label for="tName">Name</label>
                <input type="text" id="tName" name="tName" value="${result.tenantname}">
                <br>
                <label for="tAge">Age</label>
                <input type="text" id="tAge" name="tAge" value="${result.tenantage}">
                <br>
                <label for="temail">Email</label>
                <input type="text" id="temail" name="temail" value="${result.tenantemail}">
                <br>
                <label for="tPhone">Phone Number</label>
                <input type="text" id="tPhone" name="tPhone" value="${result.tenantphoneno}">
                <br>
                <label for="tgender">Gender</label>
                <input type="text" id="tgender" name="tgender" value="${result.tenantgender}">
                <br>
                <label>Booking Deposit</label>
                <p>${result.bookingdepo}</p>
                <br>
            </div>
            <button class="close">Close</button>
        </div>
    </div>
</c:forEach>



<%--    <div id="popAppr" class="overlay">--%>
<%--        <span class="close2">&times;</span>--%>
<%--        <div class="popup2">--%>
<%--            <div class="cont">--%>
<%--               <h2>Are you sure?</h2>--%>
<%--               <div class="content">--%>
<%--               <p>Are you sure you want to accept this application? <br> Your action cannot be undone!</p>--%>
<%--                  <div class="clearfix">--%>
<%--                   <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>--%>
<%--                   <button type="button" onclick="document.getElementById('id01').style.display='none'" class="deletebtn">Delete</button>--%>
<%--                  </div>--%>
<%--               </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>


<c:forEach var="result" items="${oc.rows}">
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


        //hover question mark on action table
        function popnote() {
            alert("PLEASE READ : \n1. You can choose only one booking form to approved.  \n2. The rest of booking will be canceled automatically.  \n3. Your house status will automatically be 'Not Available'!");
        }

        function popnote1() {
            alert("PLEASE READ : \n1. Your tenant will include this booking form with agreement and deposit within a week. \n2.You can choose either to verify or reject the booking after confirm the deposit and booking agreement.");
        }



    </script>
</c:forEach>
</body>
</html>
