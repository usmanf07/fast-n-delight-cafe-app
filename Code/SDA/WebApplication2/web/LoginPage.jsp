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
        <title>Fast n Delight | Login</title>
        <style>
            <%@include file="/LoginPage/home.css"%>
        </style>
    </head>
    <body>
        
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form method="post" action="LoginVerification">
			<h1>Sign in</h1>
			<input type="email" placeholder="Email" name="txtUsername"/>
			<input type="password" placeholder="Password" name="txtPassword"/>
                        <input class="signInButton" type="submit" id="signinbtn" value="Sign In">
                        <span style = "color: red;" >${error}</span>
		</form>
	</div>
        <form method="get" action="SignUpPage.jsp">
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Don't have an account?</h1>
				<p>Sign Up Now, and Start Ordering!</p>
				<button class="ghost" id="signUp" onclick="signUp.jsp">Sign Up</button>
			</div>
		</div>
	</div>
        </form>
</div>

    </body>
</html>

