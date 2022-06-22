<%-- 
    Document   : foodMethod
    Created on : 22-May-2022, 20:12:09
    Author     : usman
--%>

<%@page import="Users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  >
<head>
  
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.8, mobirise.com">
  <meta name="twitter:card" content="summary_large_image"/>
  <meta name="twitter:image:src" content="">
  <meta property="og:image" content="">
  <meta name="twitter:title" content="Home">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="FoodMethodPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="FoodMethodPage/assets/web/FoodMethodPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="FoodMethodPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="FoodMethodPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="FoodMethodPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="FoodMethodPage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
            <%}%>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="features4 cid-t6zJMsYb9s" id="features4-13">
    
    <div class="mbr-overlay"></div>
    <div class="container">
        <div class="mbr-section-head">
            <h4 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <mark><strong>Select Your Delivery Method!</strong></mark></h4>
            <h5 class="mbr-section-subtitle mbr-fonts-style align-center mb-0 mt-2 display-5"></h5>
        </div>
         <form action="${pageContext.request.contextPath}/ChooseOrderType" method="get">
        <div class="row mt-4">
            <div class="item features-image сol-12 col-md-6 col-lg-4">
                <div class="item-wrapper">
                    <div class="item-img">
                        <img src="FoodMethodPage/assets/images/shutterstock-1269173458-scaled-816x544.jpg" alt="Takeaway" title="">
                    </div>
                    <div class="item-content">
                        <h5 class="item-title mbr-fonts-style display-5"><strong>Take Away</strong></h5>
                        <h6 class="item-subtitle mbr-fonts-style mt-1 display-7"></h6>
                        <p class="mbr-text mbr-fonts-style mt-3 display-7">Pick up food from our cafe!</p>
                    </div>
                    <div class="mbr-section-btn item-footer mt-2">
                         <input type="submit" name="takeaway" class="btn item-btn btn-black display-7" value="Take Away &gt;">
                    </div>
                </div>
            </div>
            <div class="item features-image сol-12 col-md-6 col-lg-4">
                <div class="item-wrapper">
                    <div class="item-img">
                        <img src="FoodMethodPage/assets/images/jason-leung-poi7delfiva-unsplash-scaled-816x544.jpg" alt="dinein" title="">
                    </div>
                    <div class="item-content">
                        <h5 class="item-title mbr-fonts-style display-5"><strong>Dine In</strong></h5>
                        <h6 class="item-subtitle mbr-fonts-style mt-1 display-7"></h6>
                        <p class="mbr-text mbr-fonts-style mt-3 display-7">Reserve your own table and dine in with us!</p>
                    </div>
                    <div class="mbr-section-btn item-footer mt-2">
                         <input type="submit" name="dinein" class="btn item-btn btn-black display-7" value="Dine In &gt;">
                    </div>
                </div>
            </div>
            <div class="item features-image сol-12 col-md-6 col-lg-4">
                <div class="item-wrapper">
                    <div class="item-img">
                        <img src="FoodMethodPage/assets/images/istockphoto-1287632111-170667a-508x339.jpg" alt="delivery" title="">
                    </div>
                    <div class="item-content">
                        <h5 class="item-title mbr-fonts-style display-5"><strong>Delivery</strong></h5>
                        <h6 class="item-subtitle mbr-fonts-style mt-1 display-7"></h6>
                        <p class="mbr-text mbr-fonts-style mt-3 display-7">Busy & Can't pick your order? No need to worry, we will deliver your food at your selected destination with in university!</p>
                    </div>
                    <div class="mbr-section-btn item-footer mt-2">
                         <input type="submit" name="delivery" class="btn item-btn btn-black display-7" value="Delivery &gt;">
                    </div>
                </div>
            </div>

        </div>
        </form>
    </div>
</section>

<section data-bs-version="5.1" class="footer3 cid-s48P1Icc8J" once="footers" id="footer3-i">

    

    

    <div class="container">
        <div class="media-container-row align-center mbr-white">
            <div class="row row-links">
                <ul class="foot-menu">
                    
                    
                    
                    
                    
                <li class="foot-menu-item mbr-fonts-style display-7"><a href="https://mobirise.com/help/" class="text-success">Help Center</a></li><li class="foot-menu-item mbr-fonts-style display-7"></li><li class="foot-menu-item mbr-fonts-style display-7"></li></ul>
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
                            <span class="mbr-iconfont mbr-iconfont-social socicon-instagram socicon"></span>
                        </a>
                    </div></div>
            </div>
            <div class="row row-copirayt">
                <p class="mbr-text mb-0 mbr-fonts-style mbr-white align-center display-7">
                    © Copyright 2022 FAST CAFE. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>
</section>
  
  
</body>
</html>