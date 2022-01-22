
<!DOCTYPE html>
<html>
<title>NR RENTAL SYSYTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="house.css">
<style>
  *{
    font-family: 'Poppins', sans-serif;

  }

  body {
    background-color: #c7dde0;
    background-size: cover;
    justify-content: center;
    height: 100%;
    font-size: 100%;

  }



  .dropdown option
  {
    border: none;
  }


  a:link { color: black; text-decoration: none; }
  a:visited { color: black; text-decoration: none; }
  a:hover { color: black; text-decoration: none; }
  a:active { color: black; text-decoration: none; }

  .custom-select
  {
    position: relative;
  }




  .Hcont {    align-items:center;


    background-color: white;
    height: 1100px;
    width: 800px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px;
    padding: 0px 0px 40px 0px;
    margin: 40px 40px 40px 40px;
    text-decoration: none;
    margin-left:400px;

  }



  .housepic{
    background-color: grey;
    width: 100%;
    height: 400px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px 10px 0px 0px;

  }

  .houseName{

    padding-left: 10px;
    padding-top: 20px;
    font-size: 15px;
  }

  .status
  {
    color: rgb(27, 189, 27);
  }

  .fa-bed, .fa-bath, .fa-wifi
  {
    opacity: 0.5;
  }



  .MyLink{
    text-align: center;
  }

  .MyLink button{
    background-color: white;
    border:none;
    border-radius: 5px;
    cursor: pointer;
    color: cornflowerblue;
    width: 5cm;
    height:1cm;
  }

  .MyLink button:hover{
    background-color: #007bff;
    color: white;
    border: none;
    width: 5cm;
    height:1cm;
  }

  .MyLink button:active{
    background-color: #007bff;
    color: white;
    border: none;
    width: 5cm;
    height:1cm;
  }




  .C button{
    bottom: 20px;
    position: fixed;
    right: 10px;
    font-family: "Inter", sans-serif;
    font-size: 15px;
    width: 90px;
    height: 90px;
    color: #000000;
    border:none;
    border-radius: 49px;
    box-shadow: 8px 8px 7px 0px rgba(0, 0, 0, 0.25);
    cursor:pointer;
    overflow: hidden;
    z-index: 3;
  }

  .C button:hover{
    background : #E1D7D7;
  }

  .C button:active {
    background : #C1C1C1;
  }

  .C button__text,.C button__icon {
    align-items:center;
    padding : 1px 10px;
    height:100%;
  }

  img {
    width:100%;
    height:100%;
    object-fit:cover;
  }

  .button
  {
    background-color: #abe9cd;
    border: none;
    text-color: white;
    padding:10px 44px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;

  }
</style>
<body>



<!-- Search -->


<!-- House -->



<!-- End page content -->




<div class="Hcont" >
  <div class="housepic">

    <img class="mySlides" src="tenant-houseMerlimau1.jpg" >
    <img class="mySlides" src="tenant-houseMerlimau2.PNG" >
    <img class="mySlides" src="tenant-houseMerlimau3.jpg" >
  </div>

  <div class="houseName">
    <p class="name">Rumah Sewa Taman Lipat Kajang</p>
    <p class="price">RM800</p>
    <p ><i class="fa fa-bed"></i> <i class="fa fa-bath"></i> </i> <i class="fa fa-wifi"></i></p>
    <p class="status">Available</p>




    <h3>Amenitites</h3>
    <ul>
      <li> Built Up Size : 850 sq ft
      <li>Renovated Unit ( Level 1 )</li>
      <li>3 Bedrooms & 2 Bathrooms</li>
      <li>Furnished : Not Furnished</li>
      <li> Free Unifi ( 1 Year )</li>
      <li>Free Water Bill ( 1 Year )</li>
      <li>Only pay Rent + Electricity</li>
      <li>Tenant Agreement : <a href="file:///C:/Users/anis%20zamri/Downloads/agreement.pdf">Download here</a></li>

    </ul>


    <h3>Description</h3>
    <p>	MEMERLUKAN SEORANG LAGI PENYEWA, URGENT! LEBIH DARIPADA SEORANG AKAN DIPERTIMBANGKAN
      Fully Furnished
      Ada katil,meja makan,tempat memasak,mesin basuh,peti ais
      2 Bilik Tidur*
      2 Bilik Air
      RM 350 untuk kemasukan bulan pertama(termasuk duit sewa bulan pertama+deposit+utiliti)
      RM 150 bulanan utk seorg(tidak termasuk elektrik dan air)</p>
    <br>

    <a href="tenant-createBooking.jsp" class="button">Book Now</a>

  </div>
</div>

</div>
</div>


<script>
  var myIndex = 0;
  carousel();

  function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 2000); // Change image every 2 seconds
  }
</script>


</body>
</html>



