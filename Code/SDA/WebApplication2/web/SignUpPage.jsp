<%-- 
    Document   : index
    Created on : 16-May-2022, 21:00:59
    Author     : usman
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fast n Delight | SignUp</title>
    </head>
    <style>
        <%@include file="/LoginPage/home.css"%>
    </style>
    <body>
       
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form method="get" action="${pageContext.request.contextPath}/SignupVerification">
			<h1>Sign up</h1>
                        <input type="text" placeholder="Full Name" name="name"/>
			<input type="email" placeholder="Email" name="email"/>
			<input type="password" placeholder="Password" name="password"/>
                        <input type="password" placeholder="Confirm Password" name="confirmpass"/>
			<input type="tel" placeholder="Phone Number" name="phone" pattern="[0][3][0-9]{9}"/>
                        <p>Sign Up As</p>
                        <div class="wrapper">
                            <input type="radio" name="select" id="option-1" value="1" checked>
                            <input type="radio" name="select" id="option-2" value="2">
                            <input type="radio" name="select" id="option-3" value="3">
                            <input type="radio" name="select" id="option-4" value="4">
                            <label for="option-1" class="option option-1">
                              <div class="dot"></div>
                               <span>Customer</span>
                               </label>
                            <label for="option-2" class="option option-2">
                              <div class="dot"></div>
                               <span>Employee</span>
                            </label>
                            <label for="option-3" class="option option-3">
                              <div class="dot"></div>
                               <span>Admin</span>
                            </label>
                            <label for="option-4" class="option option-4">
                              <div class="dot"></div>
                               <span>Delivery Boy</span>
                            </label>
                         </div>
                        <br>
                        <input class="signInButton" type="submit" name="signupbtn" value="Sign Up">
                        <span style = "color: red;" >${error}</span>
                        
		</form>
	</div>
        <form method="get" action="LoginPage.jsp">
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Already have an account?</h1>
				<p>Login Now, and Start Ordering!</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
		</div>
	</div>
        </form>
</div>

    </body>
</html>

