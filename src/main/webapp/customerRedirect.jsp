<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.rms.customer.RegisterCustomerServlet"%>

<% 
	int a = 0;
	ArrayList<Integer> arr = (ArrayList<Integer>)request.getAttribute("id");
	a = arr.get(0);
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Customer Login</title>
	<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

	<style type="text/css">
		body {
			background: none;
		}
		/*.upperd {
			width: inherit;
			border-radius: 10px;
			border: 1px solid;
			border-color: burlywood;
			margin: ;
			align-content: center;
			/*margin-left: 35%;
			/*border-radius: 10px;
			background-color: limegreen;			
			height: 70%;
			float: left;
			margin-left: 42%;
			
		}

		.details h1{
			color: mediumblue;
			text-align: center;
		}

		.details h3 {
			color: orange;
			text-align: center;
			font-family: sans-serif;
		}

		#button {
			width: 100%;
			border-style: none;
			color: white;
			background: #00f;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			font-size: 20px;
			
		}

		.form {
			
			
		}

		.box {
			color: royalblue;
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			/*border: 3px solid #ccc;
			border-radius: 4px;
			border-style: outset;
			border-color: grey;
		}

		.box : focus {
			border: 3px solid #555;
		}*/

		 h2{
			color: seagreen;
			text-align: center;
			font-family: 'castellar';
		}

		h3 {
			color: #04AA;
			text-align: center;
			font-family: 'lucida handwritting';
			margin-top: 10px;
		}

		.upperd{
			/*position: relative;*/
			/*position: sticky;*/
			/*background-color: #FFFFFF;*/
			height: 250px;
			width: 350px;
			background-color: #7FA9A4 ;
			border-radius: 10px;
			display: flex;
			flex-direction: column;
			top: 18vh;
			justify-content: flex-start;
			padding: 30px 50px 20px 0px;
			align-items: center;
			box-shadow: 0px 0px 10px 8px rosybrown;
			/*margin-left: 38%;*/
			margin: 0 auto;
			
		}



		.box {
			color: royalblue;
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			/*box-sizing: border-box;*/
			border-radius: 10.5px;
			/*border: 3px solid #ccc;
			border-radius: 4px;
			border-style: outset;
			border-color: grey;*/
			border-bottom-color: #B6B3B2;
			border-left-color: #B6B3B2;
			border-color: #B6B3B2;
		}

		#button {
			width: 120%;
			border-style: none;
			color: white;
			/*background: #00f;*/
			background-color: deepskyblue;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			font-size: 20px;
			border-radius: 10.5px;
			cursor: pointer;
			/*transition-duration: 5s;*/
		}

		#button:hover {
			background-color: #805670;
		}

		.create{
			display: block;
			text-align: center;
			text-decoration: none;
			width: 120%;
			border-style: none;
			color: white;
			background: limegreen;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			font-size: 20px;
			border-radius: 10.5px;
			cursor: pointer;
			transition-duration: 0.4s;
		}

		.create:hover {
			background-color: green;
		}

		hr {
			background-color: #B6B3B2;
		}

		.last a {
			text-decoration: none;
			font-size: 20px;
			color: orange;
		}

		

		.last a:hover{
			color: red;
		}
		
		p {
			margin: 0 auto;
		}
		
	</style>
</head>
<body>

	<p class="last"><span><a href="rms.html">Home :: </a></span>
		<span><a href="customerAbout.jsp">About us</a></span>
		<h2>Your Log in ID is <%= a %></h2>
		<p><h3>Login with the ID and EMAIL.</h3></p>
	<div class="details">
		
		


		<div class="upperd">
			<form class="form" method="post" action="/RMS/customerlogin">
				<table cellpadding="5px" cellspacing="5px">
					<tr>
						<td><input type="text" name="customerid" class="box" required placeholder="Enter your id"></td>
					</tr>
					<tr>
						<td>
							<input type="email" name="email" class="box" required placeholder="Enter your email">
						</td>
					</tr>

					<tr>
						<td><input type="submit" name="" id="button" value="Log in"></td>
					</tr>

				</table>
			</form>
	</div>

	</div>
	

	

	<!-- <div id="login">
		<input type="text" name="name" placeholder="Enter your name" required>
		<input type="email" name="email" required placeholder="Enter your email">
		<input type="button" name="" value="Log in" id="login">
		<hr style="width : 95%">
		<input type="button" name="" value="New user register here!" id="create">  
	</div> -->
</body>
</html>