<%-- 
    Document   : myOrders
    Created on : 19-May-2022, 04:13:12
    Author     : usman
--%>


<%@page import="FoodMenu.Item"%>
<%@page import="Order.Order"%>
<%@page import="Users.User"%>
<%@ page import="java.util.List" %>
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
  <link rel="shortcut icon" href="OrdersPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>My Orders</title>
  <link rel="stylesheet" href="OrdersPage/assets/web/OrdersPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="OrdersPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="OrdersPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="OrdersPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="OrdersPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="OrdersPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="OrdersPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="OrdersPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="OrdersPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="OrdersPage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a> <a class="btn btn-white-outline display-4" href="CartPage.jsp"><span class="mobi-mbri mobi-mbri-shopping-cart mbr-iconfont mbr-iconfont-btn"></span></a> <a class="btn btn-white-outline display-4" href="index.jsp"><span class="mobi-mbri mobi-mbri-alert mbr-iconfont mbr-iconfont-btn"></span></a></div>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="features9 cid-t6fUKoinQJ" id="features10-r">
    <!---->
    

    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style mb-0 display-2">
                <%
                    User user = User.getCurrentUser();
                    if(User.OrdersList == null)
                        user.getOrdersListFromDB();
                    
                %>
                <strong>My Orders</strong></h3>
            
        </div>
               <%
                   if(User.OrdersList.size() != 0)
                   {
                        for(int x = User.OrdersList.size() - 1; x >= 0; x--)
                        {
                            Order order = User.OrdersList.get(x);
               %>
        <div class="row mt-4">
            <div class="card col-12">
                <div class="card-wrapper">
                    <div class="top-line row">
                        <div class="col">
                            <h4 class="card-title mbr-fonts-style display-5"><strong>Order ID:&nbsp;<%out.println(order.getOrderID());%></strong></h4>
                        </div>
                        <div class="col-auto">
                            <p class="price mbr-fonts-style display-5">
                                Total Amount: Rs.&nbsp;<%out.println(order.getOrderBill());%></p>
                        </div>
                    </div>
                    <div class="bottom-line">
                        <p class="mbr-text mbr-fonts-style display-7">
                            Items Ordered:&nbsp;<%
                                if(order.orderItemList != null)
                                {
                                    for(int i = 0; i < order.orderItemList.size(); i++){
                                        Item item = order.orderItemList.get(i);
                                        out.println(item.getName());
                                        out.println("x"+item.getQuantity());
                                        if(i < order.orderItemList.size() - 1)
                                        out.println(",");
                                    }
                                }
                            %>
                            <br>Order Date:&nbsp;<%out.println(order.getOrderDate());%>
                            <br>Order Time:&nbsp;<%out.println(order.getOrderTime());%>
                            <br>Order Type:&nbsp;<%out.println(order.getOrderType());%>
                            <br>Order Status:&nbsp;<%out.println(order.getOrderStatus());%>
                        </p>
                    </div>
                </div>
            </div>           
        </div> 
                        <%}}
else{
out.println("<center>");
    out.println("<p class=\"price mbr-fonts-style display-5\">");
    out.println("You haven't placed any orders yet.<br><br><br><br><br><br><br>");
out.println("</center>");
} 
                        %>
                        
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