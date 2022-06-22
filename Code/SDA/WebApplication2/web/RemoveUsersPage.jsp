<%-- 
    Document   : RemoveUsersPage
    Created on : 26-May-2022, 12:40:32
    Author     : usman
--%>

<%@page import="Users.Admin"%>
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
  <link rel="shortcut icon" href="RemoveUserPage/assets/images/logo-96x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="RemoveUserPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="RemoveUserPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="RemoveUserPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="RemoveUserPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="RemoveUserPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="RemoveUserPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="RemoveUserPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="RemoveUserPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6eOd1l1ZV" once="menu" id="menu2-l">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="RemoveUserPage/assets/images/logo-96x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white display-4" href="AdminHomePage.jsp">Home</a></li></ul>
                
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-danger display-4" href="EditProfilePage.jsp">My Account</a></div>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="features9 cid-t6VkgakXpx" id="features10-1h">
    <!---->
    

    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style mb-0 display-2">
                <strong>Manage Users</strong></h3>
            <center>
                 <span style = "color: green; font-size: 25px;" >${success}</span>
            <span style = "color: red; font-size: 25px;" >${error}</span>
            </center>
        </div>
        <%
            User user = User.getCurrentUser();
                    if(Admin.usersList == null)
                        Admin.getUsersfromDB();
                        
                   if(Admin.usersList.size() != 0 )
                   {
                        for(int x = 0; x < Admin.usersList.size(); x++)
                        { 
                            User u = Admin.usersList.get(x);
        %>
        <form method="post" action="${pageContext.request.contextPath}/RemoveUsers">
        <div class="row mt-4">
            <div class="card col-12">
                <div class="card-wrapper">
                    <div class="top-line row">
                    <div class="col-auto mbr-section-btn align-center">
                        <input style="background-color: #e01009 !important; border-color: #e01009 !important;" type="submit" name="removeuser" id="deletebtn" class="btn btn-primary display-3" value="X">
                    </div>
                        <input type="hidden" name="index" value=<%=x%>>
                        <div class="col">
                            <h4 class="card-title mbr-fonts-style display-7"><strong>User ID:&nbsp;<%out.println(u.userID);%></strong><br>
                                <strong>User Type:&nbsp;<%
                                            if(u.userType == 1)
                                                out.println("Customer");
                                            else if(u.userType == 2)
                                                out.println("Employee");
                                            else if(u.userType == 4)
                                                out.println("Delivery Boy"); %>
                                </strong>
                                <br><strong>User Name:&nbsp;<%out.println(u.name);%></strong><br><strong>User Email:&nbsp;<%out.println(u.email);%><br></strong><br></h4>
                        </div>
                        <div class="col-auto">
                            <p class="price mbr-fonts-style display-5"></p>
                        </div>
                    </div>
                    <div class="bottom-line">
                        <p class="mbr-text mbr-fonts-style display-7"></p>
                    </div>
                </div>
            </div>
            
        </div>
                        </form>
                        <%}}
else{
out.println("<center>");
    out.println("<p class=\"price mbr-fonts-style display-5\">");
    out.println("No users are available.<br><br><br><br><br><br><br>");
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
                    © Copyright 2022 FAST CAFE. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>
</section>
  
  
</body>
</html>
