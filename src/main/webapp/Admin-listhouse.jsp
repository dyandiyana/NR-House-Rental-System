<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>

<head>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="Admin-listhouse.css">

</head>



<body>


<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("adminid")==null)
        response.sendRedirect("admin-login.jsp");
%>

<%@include file="admin-navbar.html"%>

<div class="search ">

  <div class="w3-bar" style="background-color: #19747c;border-radius: 5px 5px 0px 0px;">
    <span class="w3-bar-item"  style="background-color: #19747c; color: white;" ><i class="fa fa-home w3-margin-right" style="color: white;"></i>Rent House</span>
  </div>

  <div class="w3-container w3-white w3-padding-16" style="border-radius: 0px 0px 5px 5px;">

    <div style="margin-top:-20px;">

      <form action="Admin-listhouse(search).jsp" method="post">

        <div class="w3-threequarter" style="margin-top: 20px;">
          <input class="w3-input w3-border" type="text" name="location" placeholder="Enter Location">
        </div>

        <button type="submit" class="searchbutton">Search</button>

      </form>


    </div><br>

    <%--<select  class="dropdown" style="width:140px; color: black;background-color: #90bccc; border: none; ">
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
      <option value="no max">No max</option>
      <option value="RM100">RM100</option>
      <option value="RM200">RM200</option>
      <option value="RM500">RM500</option>
      <option value="RM1000">RM1000</option>
    </select>

    <select class="dropdown">
      <option value=""disable selected>Rooms</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>

    <select class="dropdown">
      <option value=""disable selected>Bathooms</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>--%>



  </div>
</div>





<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"
                   user = "gpdkvocjaztxrw"
                   password="dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"/>

<sql:query dataSource="${ic}" var="oc">
  SELECT * from housedetails
</sql:query>



<div class="container" >


  <c:forEach var="result" items="${oc.rows}">
  <div class="Hcont" style="height: auto">

    <form  action="" method="">



          <div class="housepic"><img src="pic/${result.houseimagepic}"></div>
          <div class="houseName"></div>


            <p class="name" style="margin-top: 0%;"><c:out value="${result.housename}"/></p>
            <p class="price"><c:out value="RM ${result.housemonthlyprice}.00"/></p>

            <input type="hidden" name="houseid" value="${result.houseid}">


           <c:set var="bed" value="${result.housefurniture}"/>
            <c:if test ="${bed > 0}">
            <p ><i class="fa fa-bed"></i>
            </c:if>

            <c:set var="toilet" value="${result.housenotoilet}"/>
            <c:if test ="${toilet > 0}">
              <i class="fa fa-bath"></i>
            </c:if>

            <c:set var="wifi" value="${result.housewifi}"/>
            <c:if test ="${wifi == 'Available'}">
              <i class="fa fa-wifi"></i>
            </c:if>


                <c:set var="status" value="${result.houseavailability}"/>
              <c:if test ="${status == 'Available'}">
      <p class="status">Available</p>
      </c:if>
      <c:if test ="${status == 'Not Available'}">
        <p class="status" style="color: red; margin-bottom: 0%; padding-bottom: 0%;">Not Available</p>
      </c:if>


      <br>
        <div class="MyLink">
            <button formaction="admin-viewhousedetails.jsp" >View more</button>
        </div>


    </form>
  </div>

  </c:forEach>








</div>
<br>



<br>





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