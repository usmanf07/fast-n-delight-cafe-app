<%-- 
    Document   : foodMenu
    Created on : 20-May-2022, 02:59:45
    Author     : usman
--%>

<%@page import="Users.User"%>
<%@page import="FoodMenu.Item"%>
<%@page import="FoodMenu.Menu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.8, mobirise.com">
  <meta name="twitter:card" content="summary_large_image"/>
  <meta name="twitter:image:src" content="">
  <meta property="og:image" content="">
  <meta name="twitter:title" content="Home">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="FoodMenuPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">

  <title>Cafe Menu</title>
  <link rel="stylesheet" href="FoodMenuPage/assets/web/FoodMenuPage/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="FoodMenuPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="FoodMenuPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="FoodMenuPage/assets/mobirise/css/mbr-additional.css" type="text/css">
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="FoodMenuPage/assets/images/logo-96x33.png" alt="" style="height: 3rem;">
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
            <%if(User.currentUser.userType==1){%>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Menu</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="ReserveTablePage.jsp">Reserve A Table</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="OrdersPage.jsp">My Orders</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="VouchersPage.jsp">Vouchers</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-danger display-4" href="CartPage.jsp">My Cart</a>
                    <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a>
                    </div>
                </div>
            </div>
            <%}else if(User.currentUser.userType == 2){
            %>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="EmployeeHomePage.jsp">Home</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="FoodMenuPage.jsp">Today's Cafe Menu</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-danger display-4" href="CartPage.jsp">My Cart</a>
                    <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a>
                    </div>
                </div>
            </div>
            <%}%>
    </nav>
</section>

<section data-bs-version="5.1" class="features8 cid-t6jSTjoFNp" xmlns="http://www.w3.org/1999/html" id="features9-10">
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <strong>Cafe Menu</strong></h3>
        </div>
        <br>
        <center><span style = "color: green; font-size: 25px;" >${success}</span></center>
        <%
            
            Menu menu = new Menu();
            menu.getItemsFromDB();
            
             List<Item> itemsList = Menu.getItemList();
             
                   if(itemsList.size() != 0 )
                   {
                        for(int x = 0; x < itemsList.size(); x++)
                        {
                            Item item = itemsList.get(x);
                            int id = item.getItemID();
                         
                            String name = item.getName();
                            
                            String url = item.getImageUrl();
                            if(item.isAvailabile() == true){
                            
        %>
    <form action="${pageContext.request.contextPath}/AddToCart" method="post">
    <div class="container">
        <div class="card">
            <div class="card-wrapper">
                <div class="row align-items-center">
                    <div class="col-12 col-md-3">
                        <div class="image-wrapper">
                            <img alt= <%out.println(name);%> src=<%out.println(url);%>>
                        </div>
                    </div>
                    <div class="col-12 col-md">
                        <div class="card-box">
                            <div class="row">
                                <div class="col-md">
                                    <h6 class="card-title mbr-fonts-style display-5">
                                        <strong><%out.println(name);%></strong></h6>
                                    <p class="mbr-text mbr-fonts-style display-7">
                                        <%out.println(item.getDesc());%><br><br>
                                        Quantiy: <input type="number" name="quantity" id ="quantity" value="1" min="1" max="<%=item.getStock()%>" oninvalid="this.setCustomValidity('This quantity is invalid!')"/>
                                    </p>
                                </div>
                                <div class="col-md-auto">
                                    <p class="price mbr-fonts-style display-2">Price: <%out.println(item.getPrice());%>Rs</p>
                                    
                                    <div class="mbr-section-btn">
                                        <a>
                                            <input type="hidden" name="id" value=<%=item.getItemID()%>>
                                            <input type="hidden" name="name" value="<%out.println(name);%>">
                                            <input type="hidden" name="price" value=<%=item.getPrice()%>>
                                        <input class="btn btn-primary display-4" type="submit" value="Add to Cart" name="cart" />
                                          
                                        
                                        </a>
                                        
                                    </div>
                                    
                                    
                                </div>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    </div>
                                    <br>
    </form>
                        <%}}}
else {
    out.println("<p class=\"price mbr-fonts-style display-5\">");
    out.println("No Available Items, Please Try Again Later.<br><br><br><br><br><br><br>");
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