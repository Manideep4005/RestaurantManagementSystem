<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login | RMS</title>
<link rel="icon" type="image/png" href="logo.png">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #FFFAFA;
	font-family: 'Poppins', sans-serif;
}






.container {
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
	position: absolute;
	box-shadow: 0 0 10px pink;
	border-radius: 5px;
	padding: 20px 10px;
}

h2 {
	text-align: center;
	color: gray;
}
 

form {
	width: 400px;
	margin: auto;
	padding: 20px;
}


input  {
background:transparent;
	width: 100%;
	margin: 12px 0;
	padding: 12px 20px;
	border: 2px solid lightpink;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	transition: .4s;
	font-size: 18px;
}

input:hover {
	box-shadow: 0 0 5px lightpink;
}

input:focus {
	border: 2px solid #317AC7;
}
 

button {

	width: 100%;
	margin: 12px 0;
	padding: 12px 20px;
	box-sizing: border-box;
	border: none;
	outline: none;
	border-radius: 5px;
	transition: .4s;
	font-size: 18px;
	background: lightpink;
	color: white;
	cursor: pointer;
}

button:hover {
	background: pink;
}

.header {
	display: flex;
	padding: 20px;
	box-shadow: 0 0 5px gainsboro;
	justify-content: space-between;
}

h1 {
	font-size: 18px;
	color: gray;
}

#navs {
	margin: 10px 10px;
	font-size: 18px;
}

#navs a {
	text-decoration: none;
	color: dodgerblue;
	margin-top: 10px;
	transition: .4s;
}

#navs a:hover {
	color: #3de397;
}

#new {
	text-align: center;
}


#customer {
	text-decoration: none;
	color: white;
	background: darkorange;
	padding: 10px;
	transition: .4s;
	border-radius: 5px;
	
}

#customer:hover {
	background: dodgerblue;
}

#new a{
	text-decoration: none;
	color: darkorange;
	transition: .4s;
}

#new a:hover  {
	
	color: orange;
	padding-left: 10px;
}



.error {
	color: red;
	padding: 10px;
	background: #fa9b9b;
	border: 1px solid red;
}

@media screen and (max-width:600px) {
	form {
		width: 300px;
	}
}


.success {
	color: #28632f;
	padding: 10px;
	background: #98eba2;
	border: 1px solid #28632f;
}
</style>

</head>
<body>


	<div class="header">
		<div class="one">
			<h1>Welcome to RMS</h1>
		</div>
		<div class="two">
			<span id="navs"><a href="adminlogin.jsp">Home</a></span> <span id="navs"><a
				href="javasript::void(0)">About us</a></span>
			<span>
			<a href="rms.jsp" id="customer">User</a>
		</span>
		</div>

	</div>

	<div class="container">
		<h2>Login Here</h2>
		<form method="post" action="/RMS/adminLogin">
	
			<c:if test="${amdinLoginError != null}">
				<div class="error">${amdinLoginError }</div>
			</c:if>
			
				<c:if test="${adminAccountId != null}">
			
				<div class="success">Your new login id ${adminAccountId}</div>
				
			</c:if>
		
			<input type="text" placeholder="Admin id" required="required"
				maxlength="5" name="userid" autocomplete="off"> <input type="password"
				placeholder="Password" required name="password">
			<button type="submit">Login</button>

		</form>

		<p id="new">
			Don't have an account?&nbsp;<a href="registeradmin.html">Register</a>
		</p>

	</div>

</body>
</html>