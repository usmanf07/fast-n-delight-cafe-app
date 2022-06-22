<%-- 
    Document   : EmployeeHomePage
    Created on : 25-May-2022, 06:40:34
    Author     : usman
--%>
<%@page import="FoodMenu.Item"%>
<%@page import="Order.Order"%>
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
  <link rel="shortcut icon" href="EmployeeHomePage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="EmployeeHomePage/assets/web/EmployeeHomePage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="EmployeeHomePage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="EmployeeHomePage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="EmployeeHomePage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="EmployeeHomePage.jsp">
                        <img src="EmployeeHomePage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="EmployeeHomePage.jsp">Home</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Cafe Menu</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="slider4 mbr-embla cid-t6NYfnS8jC" id="slider4-1c">
    
    <div class="mbr-overlay"></div>
    <div class="position-relative text-center">
        <div class="mbr-section-head">
            <h4 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <%User temp = User.getCurrentUser();%>
                <strong>Welcome,&nbsp;<%out.print(temp.name);%></strong></h4>
            
        </div>
        <div class="embla mt-4" data-skip-snaps="true" data-align="center" data-contain-scroll="trimSnaps" data-auto-play-interval="5" data-draggable="true">
            <div class="embla__viewport container-fluid">
                <div class="embla__container">
                    
                    
                    <div class="embla__slide slider-image item active" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="EmployeeHomePage/assets/images/pngegg-26-1000x1000.png" alt="Mobirise Website Builder" data-slide-to="0" data-bs-slide-to="0">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>View Incoming Orders</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">View, Accept &amp; Prepare Incoming Orders<br></p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="IncomingOrdersPage.jsp" class="btn item-btn btn-secondary display-7" target="_blank">View Orders</a></div>
                        </div>
                    </div><div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="EmployeeHomePage/assets/images/pngegg-32-980x972.png" alt="Mobirise Website Builder" data-slide-to="1" data-bs-slide-to="1">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>Cafe Order Management</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">Manage Accepted Orders</p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="ManageOrdersPage.jsp" class="btn item-btn btn-danger display-7" target="_blank">Manage Orders</a></div>
                        </div>
                    </div><div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="EmployeeHomePage/assets/images/pngegg-30-980x970.png" alt="Mobirise Website Builder" data-slide-to="3" data-bs-slide-to="3">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>Add Manual Order</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">Add a manual order to cafe orders list<br></p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="FoodMenuPage.jsp" class="btn item-btn btn-success display-7" target="_blank">Add New Order</a></div>
                        </div>
                    </div><div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="EmployeeHomePage/assets/images/pngegg-31-980x978.png" alt="Mobirise Website Builder" data-slide-to="4" data-bs-slide-to="4">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>Assign Table</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">Approve Table reservation requests and assign to customer</p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="AssignTablePage.jsp" class="btn item-btn btn-warning display-7" target="_blank">Assign Table</a></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
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