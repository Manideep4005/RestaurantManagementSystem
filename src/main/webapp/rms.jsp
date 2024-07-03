<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<title>RMS Portal</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="logo.png">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	
	background: #fffff7;	
}



.container {
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	padding:20px 10px;
	border-radius: 5px;
	box-shadow: 0 0 10px gainsboro;
}

h2 {
	text-align: center;
}

form {
	width: 400px;
	margin: auto;
	padding: 20px;
}

input {
	display: block;
	margin: 12px 0;
	width: 100%;
	outline: none;
	border: 2px solid #3de397;
	padding: 12px;
	border-radius: 5px;
	transition: .4s;
	color: black;
	background: transparent;
	font-size: 18px;
}

input:focus {
	border-color: #4e9c79;
}

input:hover {
	box-shadow: 0 0 10px #3de397;
}

button {
	display: block;
	margin: 12px 0;
	width: 100%;
	outline: none;
	border: 2px solid transparent;
	padding: 12px;
	border-radius: 5px;
	transition: .4s;
	color: white;
	background: #3de397;
	font-size: 18px;
	cursor: pointer;
}

button:hover {
	background: #4e9c79;
}

p {
	text-align: center;
	font-size: 18px;
}

.create {
	color: #4e9c79;
	text-decoration: none;
	transition: .4s;
}

.create:hover {
	color: dodgerblue;
	padding-left: 10px;
}

.admin {
	margin: 12px 0;
}



.header {
	display: flex;
	padding: 20px;
	box-shadow: 0 0 5px gainsboro;
	justify-content: space-between;
}

.one {
}

.two {
}

h1 {
	font-size: 18px;
	color: #4e9c79;
}

#navs {
	margin: 0 5px;
	font-size: 18px;
}

span a {
	text-decoration: none;
	color: dodgerblue;
	transition: .4s;
}

span a:hover {
	color: #3de397;
}

.error {
	color: red;
	padding: 10px;
	background: #fa9b9b;
	border: 1px solid red;
}

.success {
	color: #28632f;
	padding: 10px;
	background: #98eba2;
	border: 1px solid #28632f;
}

#admin {
	text-decoration: none;
	transition: .4s;
	font-size: 18px;
	background: #3de397;
	color: white;
	padding: 10px;
	border-radius: 5px;
}

#admin:hover {
	background: dodgerblue;
}

@media screen and (max-width:600px) {
	form {
		width: 300px;
	}
	
	.header {
		padding: 15px;
	}
	
	#admin {
	
		padding: 7px;
	}
}
</style>

</head>
<body>

	<div class="header">

		<div class="one">
			<h1>Welcome to RMS</h1>
		</div>
		<div class="two">
			<span id="navs"><a href="rms.jsp">Home</a></span> <span id="navs"><a
				href="javasript::void(0)">About us</a></span>
			<span id="navs">
			<a href="adminlogin.jsp" id="admin">Admin</a>
		</span>
		</div>


	</div>




	<div class="container">
		<h2>Login Here</h2>



		<form action="/RMS/customerlogin" method="POST">

			<c:if test="${customerLoginError != null}">
				<div class="error">${customerLoginError }</div>
			</c:if>
			
			<c:if test="${userLoginId != null}">
			
				<div class="success">Your new login id ${userLoginId}</div>
				
			</c:if>

			<input type="text" maxlength="5" name="customerid" required
				placeholder="Enter User Id" autocomplete="off"> <input type="password" required
				placeholder="Enter Password" name="password">

			<button type="submit">Login</button>

		</form>

		<p>
			New User?&nbsp;<a href="registercustomer.html" class="create">Create
				account</a>
		</p>
		
	</div>
</body>
</html>

<%session.removeAttribute("customerLoginError");%>