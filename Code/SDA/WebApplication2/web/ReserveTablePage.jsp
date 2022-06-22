<%-- 
    Document   : ReserveTablePage
    Created on : 24-May-2022, 08:39:57
    Author     : usman
--%>

<%@page import="Users.Customer"%>
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
  <link rel="shortcut icon" href="ReserveTablePage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="ReserveTablePage/assets/web/ReserveTablePage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="ReserveTablePage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="ReserveTablePage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="ReserveTablePage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="ReserveTablePage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Menu</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="ReserveTablePage.jsp">Reserve A Table</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="OrdersPage.jsp">My Orders</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="VouchersPage.jsp">Vouchers</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a> <a class="btn btn-white-outline display-4" href="index.jsp"><span class="mobi-mbri mobi-mbri-shopping-cart mbr-iconfont mbr-iconfont-btn"></span></a> <a class="btn btn-white-outline display-4" href="index.jsp"><span class="mobi-mbri mobi-mbri-alert mbr-iconfont mbr-iconfont-btn"></span></a></div>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="form7 cid-t6gssRf2Zm" id="form7-s">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <strong>Reserve A Table</strong></h3>
            
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
                <form action="${pageContext.request.contextPath}/MakeReservation" method="get">
                <%
                    User.currentUser.getReservation();
                  
                    if(Customer.reservation == null)
                    {
                %>
                    <p class="mbr-text mbr-fonts-style align-center mb-4 display-7">
                        One of our employees will approve your request if any tables are available!.
                    </p>
                    <div class="dragArea row">
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <input type="number" name="nopeople" inputmode="numeric" placeholder="Number of People" class="form-control" min="1" max="10"> 
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <input type="date" name="date" placeholder="Reservation Date" class="form-control">
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <input type="time" name="time" placeholder="Reservation Time" class="form-control">
                        </div>
                        <div class="col-auto mbr-section-btn align-center">
                            <button type="submit" class="btn btn-primary display-4">Submit Request</button>
                        </div>
                    </div>
                    <%
                        }else{
                    %>
                        <div class="row mt-4">
                            <div class="card col-12">
                                <div class="card-wrapper">
                                    <div class="top-line row">
                                        <div class="col">
                                            <h4 class="card-title mbr-fonts-style display-5"><center><strong>You Have Made A Reservation</strong></center></h4>
                                        </div>
                                        <div class="col-auto">
                                            <p class="price mbr-fonts-style display-5"></p>
                                        </div>
                                    </div>
                                    <div class="bottom-line">
                                        <p class="mbr-text mbr-fonts-style display-7">Reservation #: <%out.println(Customer.reservation.getReservationID());%>
                                            <br>Number of People: <%out.println(Customer.reservation.getNumPeople());%><br>Table: <%
                                                if(!Customer.reservation.isReservationApproved())
                                                    out.println("Not Assigned");
                                                    else{
                                                    out.println("Assigned");
                                                }
                                            %><br>Reserved Date:<%out.println(Customer.reservation.getReservationDate());%><br>Reserved Time:<%out.println(Customer.reservation.getReservationTime());%><br>Approval Status: <%out.println(Customer.reservation.isReservationApproved());%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <center><span style = "color: green;" >${success}</span></center>
                        <center><span style = "color: red;" >${error}</span></center>
                </form>
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
