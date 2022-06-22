<%-- 
    Document   : orderPlaced
    Created on : 23-May-2022, 01:52:11
    Author     : usman
--%>

<%@page import="Users.User"%>
<%@page import="FoodMenu.Item"%>
<%@page import="Order.Cart"%>
<%@page import="Order.Order"%>
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
  <link rel="shortcut icon" href="OrderPlacedPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="OrderPlacedPage/assets/web/OrderPlacedPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="OrderPlacedPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="OrderPlacedPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="OrderPlacedPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="OrderPlacedPage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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

<section data-bs-version="5.1" class="features11 cid-t6B8nZ7Gks" id="features12-18">

    

    
    <%Order order = new Order();%>
    <div class="container">
        <div class="m-0 row align-items-center">
            <div class="col-12 col-lg">
                <div class="card-wrapper">
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style mb-4 display-2"><strong><br>Good News</strong><br><strong>Your Order is Placed!</strong></h4>
                        <p class="mbr-text mbr-fonts-style mb-4 display-5">
                            Order Details: Order#&nbsp;<%out.println(Order.customerOrder.getOrderID());%></p>
                        <div class="mbr-text mbr-fonts-style counter-container display-7">
                            <ul>
                                <li>Items Ordered: 
                                    <%
                                        for(int k = 0; k < Cart.cartItemList.size(); k++){
                                            Item cartItem = Cart.cartItemList.get(k);
                                            out.println(cartItem.getName());
                                            out.println("&nbsp;x"+cartItem.getQuantity());
                                            if(k < Cart.cartItemList.size() - 1)
                                            out.println(",");
                                        }
                                    %>
                                </li>
                                <li>Placed On:<% out.println(Order.customerOrder.getOrderDate()); %>
                                </li>
                                <li>Order Type: <%out.println(Order.customerOrder.getOrderType());%></li><li>Order Status: <%out.println(Order.customerOrder.getOrderStatus());%></li><li>Total Amount:<%out.println(Order.customerOrder.getOrderBill());%></li>
                            </ul>
                        </div>
                        <div class="mbr-section-btn mb-4"><a class="btn btn-secondary display-4" href="FoodMenuPage.jsp">Shop More &gt;</a></div>
                    </div>
                </div>
            </div>
            <div class="p-0 col-12 col-lg-6 md-pb">
                <div class="image-wrapper">
                    <img src="OrderPlacedPage/assets/images/tutorial-preview-large-630x474.png" alt="tick">
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
