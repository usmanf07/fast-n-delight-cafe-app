<%-- 
    Document   : editProfile
    Created on : May 20, 2022, 6:42:10 PM
    Author     : usman
--%>
<%@page import="Users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  >
<head>
  <!-- Site made with Mobirise Website Builder v5.6.8, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.8, mobirise.com">
  <meta name="twitter:card" content="summary_large_image"/>
  <meta name="twitter:image:src" content="">
  <meta property="og:image" content="">
  <meta name="twitter:title" content="Home">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="EditProfilePage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="EditProfilePage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="EditProfilePage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="EditProfilePage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="EditProfilePage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="EditProfilePage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="EditProfilePage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="EditProfilePage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
                    </a>
                </span>
                
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-bs-toggle="collapse" data-target="#navbarSupportedContent" data-bs-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <%if(User.currentUser.userType == 1){
            %>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Menu</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="ReserveTablePage.jsp">Reserve A Table</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="OrdersPage.jsp">My Orders</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="VouchersPage.jsp">Vouchers</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a> <a class="btn btn-white-outline display-4" href="Cart.jsp"><span class="mobi-mbri mobi-mbri-shopping-cart mbr-iconfont mbr-iconfont-btn"></span></a> <a class="btn btn-white-outline display-4" href="index.jsp"><span class="mobi-mbri mobi-mbri-alert mbr-iconfont mbr-iconfont-btn"></span></a></div>
            </div>
            <%}else if(User.currentUser.userType == 2){
            %>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="EmployeeHomePage.jsp">Home</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Cafe Menu</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
            </div>
            <%}else if(User.currentUser.userType == 3){
            %>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="AdminHomePage.jsp">Home</a><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
            </div>
            <%}else if(User.currentUser.userType == 4){
            %>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="DeliveryBoyHome.jsp">Home</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
            </div>
            <%}%>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="form7 cid-t6nFoRR5qE" id="form7-14">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2"><strong>Edit Profile</strong></h3>
            
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
                <form action="${pageContext.request.contextPath}/EditProfile" method="post">
                    <input type="hidden" name="email" data-form-email="true">
                    <p class="mbr-text mbr-fonts-style align-center mb-4 display-7">Edit Profile Information</p>
                     <br>
                            <span style = "color: red; text-align: center" >${error}</span>
                           <br>
                             <span style = "color: green;  text-align: center" >${success}</span>
                    <div class="dragArea row">
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3" data-for="name">
                            <p>  Name:</p>
                            <input type="text" name="name" placeholder=<%out.println(User.currentUser.name);%> data-form-field="name" class="form-control" value="" id="name-form7-11">
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3" data-for="email">
                             <p>  Email:</p>
                            <input type="email" name="email" placeholder=<%out.println(User.currentUser.email);%> data-form-field="email" class="form-control" value="" id="email-form7-11">
                        </div>
                        <div data-for="phone" class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                             <p>  Phone: </p>
                            <input type="tel" name="phone" placeholder=<%out.println(User.currentUser.phoneNum);%>  data-form-field="phone" class="form-control" value="" id="phone-form7-11" pattern="[0][3][0-9]{9}">
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3" data-for="name">
                             <p>  Old Password: </p>
                            <input type="password" name="password" placeholder="Old Password" data-form-field="password" class="form-control" value="" id="name-form7-11">
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3" data-for="name">
                             <p>  New Password: </p>
                            <input type="password" name="newpassword" placeholder="New Password" data-form-field="password" class="form-control" value="" id="name-form7-11">
                        </div>
                        <center>
                        <div class="col-auto mbr-section-btn align-center">
                            <input type="submit" name="save" id="savebtn" class="btn btn-primary display-4" value="Save Profile">
                           
                        </div>
                                                  </center>
                        </div>
                        <br> <br>
                         <div class="col-auto mbr-section-btn align-center">
                            <input type="submit" name="logout" id="savebtn" class="btn btn-primary display-4" value="Log Out">
                        </div>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="footer3 cid-t6gWVt0I9W" once="footers" id="footer3-x">

    

    

    <div class="container">
        <div class="media-container-row align-center mbr-white">
            <div class="row row-links">
                <ul class="foot-menu">
                    
                    
                    
                    
                    
                <li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">About us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Services</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Contact Us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Careers</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Work</a>
                    </li></ul>
            </div>
            <div class="row social-row">
                <div class="social-list align-right pb-2">
                    
                    
                    
                    
                    
                    
                <div class="soc-item">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.youtube.com/c/mobirise" target="_blank">
                            <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://instagram.com/mobirise" target="_blank">
                            <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.behance.net/Mobirise" target="_blank">
                            <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div></div>
            </div>
           
        </div>
    </div>
</section>
  
  
</body>
</html>