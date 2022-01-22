<!DOCTYPE html>

<html>

<head>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="Admin-listhouse.css">

</head>



<body>

<%@include file="admin-navbar.html"%>

<div class="search ">

  <div class="w3-bar" style="background-color: #19747c;border-radius: 5px 5px 0px 0px;">
    <span class="w3-bar-item"  style="background-color: #19747c; color: white;" ><i class="fa fa-home w3-margin-right" style="color: white;"></i>Rent House</span>
  </div>

  <div class="w3-container w3-white w3-padding-16" style="border-radius: 0px 0px 5px 5px;">

    <div style="margin-top:-20px;">

      <div class="w3-threequarter" style="margin-top: 20px;">
        <input class="w3-input w3-border" type="text" placeholder="Enter Location">
      </div>

      <button type="submit" class="searchbutton">Search</button>
    </div><br>

    <select  class="dropdown" style="width:140px; color: black;background-color: #90bccc; border: none; ">
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
    </select>



  </div>
</div>


<div class="container">



  <div class="Hcont" >
    <a href="">
      <div class="housepic"></div>
      <div class="houseName">
        <p class="name">Rumah Banglo Taman Permai Indah</p>
        <p class="price">RM800</p>
        <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
        <p class="status">Available</p>

      </div>
    </a>
  </div>

  <div class="Hcont">
    <a href="">
      <div class="housepic"></div>
      <div class="houseName">
        <p class="name">Rumah Teres 22</p>
        <p class="price">RM800</p>
        <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
        <p class="status">Available</p>

      </div>
    </a>
  </div>

  <div class="Hcont">
    <a href="">
      <div class="housepic"></div>
      <div class="houseName">
        <p class="name">Rumah Minangkabau</p>
        <p class="price">RM800</p>
        <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
        <p class="status">Available</p>

      </div>
    </a>
  </div>








</div>
<br>

<div class="C" id="Chouse">
  <button onclick="z()">
	 <span class="button__icon">
	 <ion-icon name="add"></ion-icon>
	 </span>
    <br>
    <span class="button__text">Create</span>
  </button>
</div>

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