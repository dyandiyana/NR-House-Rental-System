<%--
  Created by IntelliJ IDEA.
  User: wala wala
  Date: 1/2/2022
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOUSE RENTAL SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tenant-viewProfile.css">
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
</head>

<body>

<%@include file="tenant-navbar.html"%>
<form action="" method="post">

    <input type="number" name="tenantid"  value="${tenantid}" hidden>

<div class="container">
    <h3>MY PROFILE</h3>
    <div class="row">
        <div class="col-25">
            <label>USERNAME</label>
        </div>
        <div class="col-75">
            <label>${tenantusername}</label>
        </div>
    </div>
    <div class="row">
        <div class="col-25">
            <label>PASSWORD</label>
        </div>
        <div class="col-75">
            <label>${tenantpassword}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>FULL NAME</label>
        </div>
        <div class="col-75">
            <label>${tenantname}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>EMAIL</label>
        </div>
        <div class="col-75">
            <label>${tenantemail}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>GENDER</label>
        </div>
        <div class="col-75">
            <label>${tenantgender}</label>
            <input type="text" name="tenangender"  value="${tenantgender}" hidden>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>AGE</label>
        </div>
        <div class="col-75">
            <label>${tenantage}</label>
        </div>
    </div>

    <div class="row">
        <div class="col-25">
            <label>PHONE NUMBER</label>
        </div>
        <div class="col-75">
            <label>${tenantphoneno}</label>
        </div>
    </div>


    <button type="submit" class="button button1" name="submit" onclick="form.action='tenant-updateProfile.jsp'">UPDATE</button>
    <button type="submit"  class="button button1" name="submit" >DELETE</button>

  
    <script type="text/javaScript">
						function myFunction2()
						{	
							confirm("Are you sure you want to delete your profile?");
						}
					</script>	
</div>
</form>
</body>
</html>
