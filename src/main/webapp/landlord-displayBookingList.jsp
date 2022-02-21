<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/1/2022
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="static javax.swing.JOptionPane.showInternalMessageDialog" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<style><%@include file="landlord-displayBookingList.css"%></style>
<head>
    <title>Tenancy Booking Application</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%@include file="landlord-navbar.html"%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");



    int landlordid = Integer.parseInt(session.getAttribute("landlordid").toString());
    int houseid= 0;

    if(request.getParameter("hid")==null){
        houseid = (Integer) session.getAttribute("hid");
    }
    else{
        houseid  = Integer.parseInt(request.getParameter("hid"));
        session.setAttribute("hid", houseid);
    }

    try{
        String status = "Canceled";
        String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"; //ni url dri heroku database
        String user = "gpdkvocjaztxrw";
        String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        int idbooking =0;

        PreparedStatement ps3 = conn.prepareStatement("select bookingid,bookingdate+3 from BOOKINGDETAILS where bookingstatus='Pending' AND houseid=? AND bookingdate+3 = CURRENT_DATE");
        ps3.setInt(1, houseid);
        ResultSet rs = ps3.executeQuery();
        while(rs.next()){
            idbooking = rs.getInt(1);
            System.out.println(idbooking);
            PreparedStatement statement = conn.prepareStatement("UPDATE BOOKINGDETAILS SET BOOKINGSTATUS=? WHERE BOOKINGID=?");
            statement.setString(1, status);
            statement.setInt(2, idbooking);
            int row = statement.executeUpdate();


            if (row > 0){

            }
            else{
                break;
            }
        }

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

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
            <h5 style="color: red"> * Reminder : Please approve booking within 3 days after booking date. After 3 days the booking form will be canceled automatically.</h5>
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

                    <td colspan="2" style="background-color: black; color:#f44336;">Booking Agreement</td>
                    <td colspan="2" style="background-color: black; color:#f44336;" class="actions">Action <button onclick="popnote()"><i class="fa fa-question-circle"></i></button></td>
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
                            <form action="BookingServlet" method="post" enctype = "multipart/form-data">
                                <td colspan="2"><input type="file" name="agreedoc" data-height="300" required="required"></td>
                                <td colspan="2">
                                    <input type="hidden" name="bookingid" value="${result.bookingid}">
                                    <input type="hidden" name="houseid" value="<%=houseid%>">
                                    <input type="hidden" name="action" value="approvedbooking">
                                    <button id="btnAprv" onclick="return confirm('Are you sure you wish to approved this application? Your action cannot be undone!');">Approved</button>
                                </td>
                            </form>
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
            <h5 style="color: red"> * Reminder : Please make sure the deposit and agreement are already confirm before proceed.</h5>
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
                    <td colspan="2" style="background-color: black; color:#f44336;" class="actions">Action <button onclick="popnote1()"><i class="fa fa-question-circle"></i></button></td>
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
                            <td colspan="2">
                                <form action="BookingServlet" method="post">
                                    <input type="hidden" name="bookingid" value="${result.bookingid}">
                                    <input type="hidden" name="action" value="verifybooking">
                                    <button id="btnComplete" onclick="return confirm('Are you sure you wish to verify this booking form?');">Verify</button>
                                </form>
                                <br>
                                <form action="BookingServlet"  method="post">
                                    <input type="hidden" name="bookingid" value="${result.bookingid}">
                                    <input type="hidden" name="action" value="rejectbooking">
                                    <button id="btnCancel" onclick="return confirm('Are you sure you wish to reject this booking form? Your action cannot be undone!');">Rejected</button>
                                </form>
                            </td>
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

