<%-- 
    Document   : IncomingOrdersPage
    Created on : 25-May-2022, 22:19:48
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
  <link rel="shortcut icon" href="IncomingOrdersPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Confirm Order</title>
  <link rel="stylesheet" href="IncomingOrdersPage/assets/web/IncomingOrdersPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/web/IncomingOrdersPage/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="IncomingOrdersPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="IncomingOrdersPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="IncomingOrdersPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="IncomingOrdersPage/assets/images/logo-96x33.png" alt="logo" style="height: 3rem;">
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
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="EmployeeHomePage.jsp">Home</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Cafe Menu</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="ManageOrdersPage.jsp">Cafe Orders</a></li></ul>
                <form action="${pageContext.request.contextPath}/EditProfile" method ="post">
                <div class="navbar-buttons mbr-section-btn">
                    <input type="submit" name="logout" class="btn btn-danger display-4" value="Log Out">
                </div>
                </form>
            </div>
        </div>
    </nav>
</section>
                <%
                    User user = User.getCurrentUser();
                    if(User.OrdersList == null)
                        user.getOrdersListFromDB();
                %>
<section data-bs-version="5.1" class="form7 cid-t6EQO8B6qL" id="form7-14">
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2"><strong>Incoming Orders</strong></h3>
            <center>
            <span style = "color: red;" >${declined}</span>
            <span style = "color: green;" >${accepted}</span>
            </center>
        </div>
        <%
            boolean flag = false;
            int o = 0;
            if(User.OrdersList.size() != 0)
                   {
                        for(int x = User.OrdersList.size() - 1; x >= 0; x--)
                        {
                            
                            Order order = User.OrdersList.get(x);
                            if(order.getOrderStatus().equals("Confirmed")){
                                o++;
        %>   
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-5 mbr-form" data-form-type="formoid">
                <form method="get" action="${pageContext.request.contextPath}/IncomingOrder">
                    <p class="mbr-text mbr-fonts-style align-center mb-0 display-7"></p>
                    <input type="hidden" name="index" value="<%=x%>">
                    <input type="hidden" name="o" value="<%=o%>">
                    <div class="dragArea row">
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-2">
		            <p> Customer Name:&nbsp;<%out.println(order.getCustomerName());%></p>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p1> Order ID:&nbsp;<%out.println(order.getOrderID());%><p1>
                        </div>
			<div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p2> Order Type:&nbsp;<%out.println(order.getOrderType());%><p2>
                        </div>
			<div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p3> Items: &nbsp;<%
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
                            %><p3>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p4> Total Amount: Rs.&nbsp;<%out.println(order.getOrderBill());%> <p4>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p4>Order Date:&nbsp;<%out.println(order.getOrderDate());%><p4>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p4>Order Time:&nbsp;<%out.println(order.getOrderTime());%><p4>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                            <p4>Order Status:&nbsp;<%out.println(order.getOrderStatus());%><p4>
                        </div>
                        
                        <div class="col-auto mbr-section-btn align-center">
                            <input type="submit" name="accept" class="btn btn-primary display-4" value="Accept Order">
                        </div>
			&nbsp;
			<div class="col-auto mbr-section-btn align-center">
                            <input style="background-color: red !important; border-color: red !important;" type="submit" name="decline" class="btn btn-primary display-4" value="Decline Order">
                        </div>
                    </div>
                </form>
            </div>
        </div>
                        <hr class="line">
                        <%}
                        flag = false;
}}
if(o == 0){
out.println("<center>");
    out.println("<p class=\"price mbr-fonts-style display-5\">");
    out.println("No incoming orders.<br><br><br><br><br><br><br>");
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
                    � Copyright 2022 FAST CAFE. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>

</body>
</html>
