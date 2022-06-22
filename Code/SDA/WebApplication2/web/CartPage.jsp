<%-- 
    Document   : Cart
    Created on : 20-May-2022, 20:41:31
    Author     : usman
--%>

<%@page import="Users.User"%>
<%@page import="FoodMenu.Item"%>
<%@page import="Order.Cart"%>
<%@page import="java.util.List"%>
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
  <link rel="shortcut icon" href="CartPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="CartPage/assets/web/CartPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="CartPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="CartPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="CartPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="CartPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="CartPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="CartPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="CartPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="CartPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="CartPage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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

<section data-bs-version="5.1" class="features7 cid-t6obsdaWxK" id="features8-z">
    <!---->
    
    
    <div class="container">
        <div class="row">
            <div class="title col-12">
                <h5 class="mbr-section-title mbr-fonts-style mb-3 display-2">
                    <strong>My Cart</strong></h5>
                
            </div>
       <%
           
            Cart c = new Cart();
            List <Item> cartItems = c.getCartItemList();
           
            if(cartItems != null )
            {

            for(int x = 0; x < cartItems.size(); x++)
            {
                Item item = cartItems.get(x);
                float price = item.getPrice();
                int quantity = item.getQuantity();
                String itemName = item.getName();

        %>
        <form action="${pageContext.request.contextPath}/CartServlet" method="get">
            <div class="card col-12 col-md-6">
                <div class="card-wrapper">
                    <div class="top-line">
                    <div class="col-auto mbr-section-btn align-center">
                        <input style="background-color: #e01009 !important; border-color: #e01009 !important;" type="submit" name="cartRemove" id="savebtn" class="btn btn-primary display-3" value="X">
                    </div>
                        <h6 class="card-title mbr-fonts-style display-5">
                            <strong><%out.println(itemName);%></strong></h6>
                        <p class="mbr-text cost mbr-fonts-style display-5">Price: <%out.println(price);%> Rs</p>
                    </div>
                    <div class="bottom-line">
                        <p class="mbr-text mbr-fonts-style display-7">
                            Quantity: <%out.println(quantity);%></p>
                    </div>
                     <input type="hidden" name="id" value=<%=item.getItemID()%>>
                </div>
            </div>
         <%}}
        
        float totalBill = c.getTotalBill();
if(cartItems != null){
if(!cartItems.isEmpty() && totalBill >= 0){
         %>
         <div class="title col-12">
                <h5 class="mbr-section-title mbr-fonts-style mb-3 display-2">
                    <strong>Total Bill: <%out.println(totalBill);%> Rs</strong></h5>
                
          </div>
        </div>
    </div>
        <%if(!Cart.voucherUsed){%>
         <div class="dragArea row">
             <center>
                        <div class="col-lg-4 col-md-12 col-sm-12 form-group mb-3" data-for="voucher">
                            <input type="text" name="vouchercode" placeholder="Voucher" class="form-control" id="name-form8-14">
                        </div>
                 <div class="col-lg-4 col-md-12 col-sm-12 mbr-section-btn align-left">
                     <center>
                            <input type="submit" name="voucher" class="btn btn-primary display-4" value="Apply Voucher">
                        </center>
                            </div>
                 </center>     
          </div>
                   <center>
                            <span style = "color: red;" >${error}</span>
                   </center>
                   <center>
                       OR
                   </center>
           <%}%>
           <center>
                    <span style = "color: green;" >${success}</span>
                    <br>
                    <span>${discount}</span>
            </center>
            <div class="col-auto mbr-section-btn align-center">
                <input style="background-color: #fc731e !important; border-color: #fc731e !important;" type="submit" name="checkout" id="savebtn" class="btn btn-primary display-4" value="Checkout Now!">
            </div>
     </form>
        <%}}
else {
    out.println("<p style=\"text-align:center;\" class=\"price mbr-fonts-style display-5\">");
    out.println("Your cart is empty!<br>Add some items if you're feeling hungry!</p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
       
        }
        %>
       
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
