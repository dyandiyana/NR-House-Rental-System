<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 31/12/2021
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-viewPayment.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%@include file="landlord-navbar.html"%>
<style>
<%@include file="landlord-viewPayment.css"%>
</style>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("landlordid")==null)
        response.sendRedirect("landlord-login.jsp");

    Date today = new Date();

    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String Today = DATE_FORMAT.format(today);

    int bookingid = 0;
    if(request.getParameter("bookingid")==null){
        bookingid=  Integer.parseInt(session.getAttribute("bookingid").toString());
    }else{
        bookingid = Integer.parseInt(request.getParameter("bookingid"));
        session.setAttribute("bookingid",bookingid);
    }
    System.out.println(bookingid);
//    int tenantid = Integer.parseInt(request.getParameter("tenantid"));
%>
<sql:setDataSource var="ic"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user="gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT  row_number() over () "rank" ,P.PAYID, P.PAYDUEDATE, P.PAYDATE, P.PAYRECEIPT, P.PAYSTATUS, P.BOOKINGID, P.PAYPRICE, p.month
    from landlord l
    JOIN housedetails h
    on l.landlordid = h.landlordid
    join bookingdetails b
    on h.houseid = b.houseid
    join monthlypayment p
    on b.bookingid = p.bookingid
    WHERE b.bookingid = ?
    <sql:param value="<%=bookingid%>"/>
</sql:query>


<sql:query dataSource="${ic}" var="ac">
    select t.tenantname, b.bookingid, h.housename, h.houseaddress, h.houseid, b.rentalstatus
    from tenant t
    join bookingdetails b
    on t.tenantid= b.tenantid
    join housedetails h
    on b.houseid = h.houseid
    where b.bookingid = ?
    <sql:param value="<%=bookingid%>"/>
</sql:query>



<div class="container">

    <h3>MONTHLY PAYMENT</h3>
    <c:forEach var="result" items="${ac.rows}">
    <div class="row">
        <div class="col-25">
            <label>TENANT NAME</label>
        </div>
        <div class="col-75">
            <label>${result.tenantname}</label>
        </div>
    </div>

<%--   <div class="row">--%>
<%--        <div class="col-25">--%>
<%--            <label>LANDLORD NAME</label>--%>
<%--        </div>--%>
<%--        <div class="col-75">--%>
<%--            <label>${result.landlordname}</label>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="row">--%>
<%--        <div class="col-25">--%>
<%--            <label>LANDLORD PHONE NO</label>--%>
<%--        </div>--%>
<%--        <div class="col-75">--%>
<%--            <label>${result.landlordphoneno}</label>--%>
<%--        </div>--%>
<%--    </div>--%>


    <div class="row">
        <div class="col-25">
            <label>HOUSE NAME</label>
        </div>
        <div class="col-75">
            <label>${result.housename}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>HOUSE ADDRESS</label>
        </div>
        <div class="col-75">
            <label>${result.houseaddress}</label>
        </div>
    </div>

   <c:if test="${result.rentalstatus =='On Going'}">
    <form action="MonthlyPaymentServlet" method="post">
        <input type="hidden" name="action" value="rentComplete"/>
        <input type="hidden" name="bookingid" value="<%=bookingid%>"/>
        <input type="hidden" name="hid" value="${result.houseid}"/>
    <button  class="btns">Complete</button>
    </form>
    <button class="btns"  id="myBtn">Create</button>
   </c:if>
    </c:forEach>
    <!-- The Modal -->
    <form id="myModal" class="modal" action="MonthlyPaymentServlet" method="post">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h2>Create Payment</h2>
            </div>
                <div class="modal-body">
                    <label for="month">Month:</label>
                    <select name="month" id="month" required>
                        <option value="January">January</option>
                        <option value="February">February</option>
                        <option value="March">March</option>
                        <option value="April">April</option>
                        <option value="May">May</option>
                        <option value="June">June</option>
                        <option value="July">July</option>
                        <option value="August">August</option>
                        <option value="September">September</option>
                        <option value="October">October</option>
                        <option value="November">November</option>
                        <option value="December">December</option>
                    </select>
                    <div id=space></div>
                    <label for="rent">Rent:</label>
                    <input type="number" id="rent" name="rent" required/>
                    <div id=space2></div>
                    <label for="pay">Due Date:</label>
                    <input type="date" value="<%=Today%>" min="<%=Today%>" id="pay" name="duepay" required/>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="bookingid" value="<%=bookingid%>"/>
                    <input type="hidden" name="action" value="createPay"/>
                    <button class="btn2" type="submit">Submit</button>
                </div>
        </div>
    </form>


    <br><br>
    <table id = "myTable" style="text-align: center">
        <tr>
            <th class="hello">NO.</th>
            <th>MONTH</th>
            <th>DUE DATE</th>
            <th>PRICE</th>
            <th>STATUS</th>
            <th>RECEIPT</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
            <tr>
                <td class="hello">${result.rank}</td>
                <td>${result.month}</td>
                <td>${result.payduedate}</td>
                <td>${result.payprice}</td>

                <c:if test="${result.paystatus=='Unpaid'}">
                    <td style="color: red">${result.paystatus}</td>
                </c:if>
                <c:if test="${result.paystatus=='Pending'}">
                    <td style="color: black">${result.paystatus}</td>
                </c:if>
                <c:if test="${result.paystatus=='Paid'}">
                    <td style="color: forestgreen">${result.paystatus}</td>
                </c:if>


                <td>
                        <c:set var="status" value="${result.paystatus}"/>
                        <c:if test="${status=='Pending'}">
                            <a style="color: black" href="fileDoc/${result.payreceipt}">${result.payreceipt}</a>
                        </c:if>
                        <c:if test="${status=='Paid'}">
                            <a style="color: black" href="fileDoc/${result.payreceipt}">${result.payreceipt}</a>
                        </c:if>
                </td>
                <td>
                        <c:if test="${result.paystatus=='Unpaid'}">
                            <p>Waiting for Payment</p>
                        </c:if>
                        <c:if test="${result.paystatus=='Pending'}">
                            <form action="MonthlyPaymentServlet" method="post">
                            <input type="hidden" name="payId" value="${result.payId}">
                            <input type="hidden" name="action" value="verifyPay">
                            <button type="submit"  class="button button1" >Verify</button>
                            </form>
                            <form action="MonthlyPaymentServlet" method="post">
                                <input type="hidden" name="payId" value="${result.payId}">
                                <input type="hidden" name="action" value="rejectPay">
                            <button type="submit"  class="button button1">Rejected</button>
                            </form>
                        </c:if>
                        <c:if test="${result.paystatus=='Paid'}">
                            <p>None</p>
                        </c:if>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>

    <button type="submit" class="button button1" name="submit" style="float: left" ><a href="landlord-listPayment.jsp">Back</a></button>


</div>
</body>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</html>