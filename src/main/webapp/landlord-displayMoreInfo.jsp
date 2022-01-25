<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/1/2022
  Time: 2:48 AM
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
<%@include file="landlord-navbar.html"%>
<style><%@include file="landlord-displayMoreInfo.css"%></style>
</head>
<body>
<div class="topic">RUMAH BANGLO TAMAN PERMAI INDAH</div>

<div class="mybtn">
    <button onclick="booking()">Booking</button>
    <button onclick="edit()">Edit</button>
    <button onclick="delx()">Delete</button>
</div>


<div class="tintedbg2">
    <div class="k">
         <div class="colk">
             <div class="imagex">
                 <%-- display image by house-id and image array --%>
                     <div id="himg" class="carousel slide" data-ride="carousel">
                         <ol class="carousel-indicators">
                             <li data-target="#himg" data-slide-to="0" class="active"></li>
                             <li data-target="#himg" data-slide-to="1"></li>
                             <li data-target="#himg" data-slide-to="2"></li>
                         </ol>
                         <div class="carousel-inner">
                             <div class="carousel-item active">
                                 <img   target="popup"
                                        onclick="popw ()" class="d-block w-100" src="pic/k1.jpg" alt="First slide">
                             </div>
                             <div class="carousel-item">
                                 <img class="d-block w-100" src="pic/k2.jpg" alt="Second slide">
                             </div>
                             <div class="carousel-item">
                                 <img class="d-block w-100" src="pic/k3.jpg" alt="Third slide">
                             </div>
                         </div>
                         <a class="carousel-control-prev" href="#himg" role="button" data-slide="prev">
                             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                             <span class="sr-only">Previous</span>
                         </a>
                         <a class="carousel-control-next" href="#himg" role="button" data-slide="next">
                             <span class="carousel-control-next-icon" aria-hidden="true"></span>
                             <span class="sr-only">Next</span>
                         </a>
                     </div>

             </div>
         </div>

        <div class="coll">
            <div class="overflow-auto">
                <div class="mytable">
                <table>
                    <tr>
                        <td colspan="2">Publish Date </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">Address</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">Price (per month) RM</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">Number of Tenant</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">House Availability</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">Wifi Availability</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><img src="pic/bed.png" height="25px" width="18px" class="center"></td>
                        <td><img src="pic/bath.png" height="25px" width="18px" class="center"></td>
                        <td><img src="pic/aircond.png" height="25px" width="18px" class="center"></td>
                        <td><img src="pic/wm.png" height="25px" width="18px" class="center"></td>
                        <td><img src="pic/sofa.png" height="25px" width="18px" class="center"></td>
                    </tr>
                    <tr>
                        <td text-align="center">Bedroom</td>
                        <td text-align="center">Bathroom</td>
                        <td text-align="center">Air Conditioner</td>
                        <td text-align="center">Washing Machine</td>
                        <td text-align="center">Furniture</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">House Description</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">Tenancy Agreement</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                </table>
                </div>
            </div>
        </div>
     </div>
</div>
<br>

<script>

    function delx(){
        confirm("Are you sure you want to delete your house? Your action cannot be undone!");
    }

    function edit(){
        location.href = "landlord-updateHouseDetails.jsp";
    }

    function popw () {
        window.open('http://localhost:8088/nonresident_war_exploded/pic/k2.jpg','popup','width=600,height=600'); return false;
    }

    function booking(){
        location.href = "landlord-displayBookingList.jsp";
    }
</script>

</body>
</html>
