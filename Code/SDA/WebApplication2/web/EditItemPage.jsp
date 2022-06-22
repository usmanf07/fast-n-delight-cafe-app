<%-- 
    Document   : EditItemPage
    Created on : 26-May-2022, 04:50:11
    Author     : usman
--%>

<%@page import="FoodMenu.Item"%>
<%@page import="FoodMenu.Menu"%>
<%@page import="Users.Admin"%>
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
  <link rel="shortcut icon" href="AddItemPage/assets/images/logo-95x33.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="AddItemPage/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="AddItemPage/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="AddItemPage/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="AddItemPage/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="AddItemPage/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="AddItemPage/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="AddItemPage/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="AddItemPage/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6p37iIz2o" once="menu" id="menu2-1d">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="">
                        <img src="AddItemPage/assets/images/logo-95x33.png" alt="Mobirise Website Builder" style="height: 3rem;">
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

<section data-bs-version="5.1" class="form5 cid-t6tXpuVzK2" id="form5-1e">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <strong>Edit Item</strong></h3>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
                 <form action="${pageContext.request.contextPath}/ItemManage" method="post">
                     <%
                    Item item = Menu.itemList.get(Admin.indexNum);
            %>
                    <div class="dragArea row">
                        <div class="col-md col-sm-12 form-group mb-3" data-for="name">
                            <p>Item Name: </p>
                            <input type="text" name="name" placeholder="<%=item.getName()%>" data-form-field="name" class="form-control" value="" id="name-form5-1e">
                        </div>
                        <div class="col-md col-sm-12 form-group mb-3" data-for="email">
                            <p>Item Price: </p>
                            <input type="number" name="price" placeholder="<%=item.getPrice()%>" min ="1" max="100000" data-form-field="text" class="form-control" value="" id="email-form5-1e">
                        </div>
                        <div class="col-12 form-group mb-3" data-for="url">
                            <p>Image URL: </p>
                            <input type="url" name="url" placeholder="<%=item.getImageUrl()%>" data-form-field="url" class="form-control" value="" id="url-form5-1e">
                        </div>
                        <div class="col-12 form-group mb-3" data-for="textarea">
                            <p>Item Description: </p>
                            <textarea name="desc" placeholder="<%=item.getDesc()%>" data-form-field="textarea" class="form-control" id="textarea-form5-1e"></textarea>
                        </div>
                        <div class="col-12 form-group mb-3" data-for="textarea">
                            <p>Stock Amount: </p>
                            <input type="number" name="stock" placeholder="<%=item.getStock()%>" min ="1" max="100000" data-form-field="text" class="form-control" value="" id="email-form5-1e">
                        </div>
                         <div class="col-12 form-group mb-3" data-for="textarea">
                            <p>Item Availability Status:&nbsp;<%
                                if(item.isAvailabile())
                                    out.println("Available");
                                else
                                    out.println("Unavailable");
                                %></p>
                            <label for="available">Change Status</label>
                                <select name="availablestatus" id="available">
                                  <option value="yes">Available</option>
                                  <option value="no">Unavailable</option>
                                </select>
                            
                        </div>
                        
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn">
                               <input class="btn btn-primary display-4" type="submit" value="Edit Item" name="editcurritem">
                        </div>
                            <center>
                         <span style = "color: green;" >${success}</span>
                         <span style = "color: red;" >${error}</span>
                         </center>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="footer3 cid-t6gWVt0I9W" once="footers" id="footer3-x">

    

    

    <div class="container">
        <div class="media-container-row align-center mbr-white">
            <div class="row row-links">
                <ul class="foot-menu">
                    
                    
                    
                    
                    
                <li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">About us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Services</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Contact Us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Careers</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Work</a>
                    </li></ul>
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
                            <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.behance.net/Mobirise" target="_blank">
                            <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"></span>
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
