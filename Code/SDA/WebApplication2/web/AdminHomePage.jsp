<%-- 
    Document   : AdminHomePage
    Created on : 26-May-2022, 04:11:09
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
  <link rel="shortcut icon" href="AdminHomePage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="AdminHomePage/assets/web/AdminHomePage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="AdminHomePage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="AdminHomePage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="AdminHomePage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="AdminHomePage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="AdminHomePage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="AdminHomePage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="AdminHomePage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="AdminHomePage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="AdminHomePage.jsp">
                        <img src="AdminHomePage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="AdminHomePage.jsp">Home</a><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
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
                <center>
        <div class="embla mt-4" data-skip-snaps="true" data-align="center" data-contain-scroll="trimSnaps" data-auto-play-interval="5" data-draggable="true">
            <div class="embla__viewport container-fluid">
                <div class="embla__container">
                    
                    
                    <div class="embla__slide slider-image item active" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="AdminHomePage/assets/images/pngegg-26-1000x1000.png" alt="Mobirise Website Builder" data-slide-to="0" data-bs-slide-to="0">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>Manage Menu Items</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">Add, Edit or Remove Items from Cafe Menu<br></p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="ManageMenuPage.jsp" class="btn item-btn btn-secondary display-7" target="_blank">Manage Items</a></div>
                        </div>
                    </div><div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="AdminHomePage/assets/images/pngegg-35-512x512.png" alt="Mobirise Website Builder" data-slide-to="2" data-bs-slide-to="2">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>Manage Users</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">Edit or Remove Customers & Employee from Cafe</p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="RemoveUsersPage.jsp" class="btn item-btn btn-danger display-7" target="_blank">Manage Users</a></div>
                        </div>
                    </div><div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="AdminHomePage/assets/images/pngegg-31-980x978.png" alt="Mobirise Website Builder" data-slide-to="5" data-bs-slide-to="5">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong>View Today's Sales</strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7">View Cafe Sales Progress</p>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2"><a href="ViewSales.jsp" class="btn item-btn btn-warning display-7" target="_blank">View Sales</a></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
                    </center>
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