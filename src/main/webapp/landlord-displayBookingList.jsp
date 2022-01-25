<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/1/2022
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<!--BOOTSTRAP JS-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!--BOOTSTRAP CSS-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<style><%@include file="landlord-displayBookingList.css"%></style>
<head>
    <title>Title</title>
</head>
<body>
<div class="titlebg"></div>

   <fieldset>
    <legend>RUMAH BANGLO TAMAN PERMAI INDAH</legend>
       <div class="htopic">
           <h1>TENANCY BOOKING APPLICATION</h1>
       </div>
   </fieldset>

   <div class="mytab">
       <div class="d-flex align-items-start">
           <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
               <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-New" type="button" role="tab" aria-controls="v-pills-New" aria-selected="true">New Application</button>
               <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-In" type="button" role="tab" aria-controls="v-pills-In" aria-selected="false">In process</button>
               <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Completed" type="button" role="tab" aria-controls="v-pills-Completed" aria-selected="false">Completed</button>
               <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Canceled" type="button" role="tab" aria-controls="v-pills-Canceled" aria-selected="false">Canceled</button>
           </div>
           <div class="tab-content" id="v-pills-tabContent">
               <div class="tab-pane fade show active" id="v-pills-New" role="tabpanel" aria-labelledby="v-pills-New-tab">...</div>
               <div class="tab-pane fade" id="v-pills-In" role="tabpanel" aria-labelledby="v-pills-In-tab">...</div>
               <div class="tab-pane fade" id="v-pills-Completed" role="tabpanel" aria-labelledby="v-pills-Completed-tab">...</div>
               <div class="tab-pane fade" id="v-pills-Canceled" role="tabpanel" aria-labelledby="v-pills-Canceled-tab">...</div>
           </div>
       </div>
   </div>

</body>
</html>
