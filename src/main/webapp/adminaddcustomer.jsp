<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Customer</title>
	<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">


<style type="text/css">
	h1 {
		color : #04AA;
		text-align : center;
		
	}


	td {
		font-size: 25px;
	}

	sup {
		font-size: 10pt;
		color: red;
		margin-top: 100px;
	}

	.gender {
 		font-size: 18px;
	}

	input[type=text],textarea, input[type=email],input[type=number],select {
		 width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: block;
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;
	}


input[type=submit] {
  width: 100%;
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #04AA;
}

div.main {
  border-radius: 10px;
  background-color: #f2f2f2;
  padding: 20px;
  border: 1px solid #04AA6D;
  margin-top: 0 auto;
  /*position: relative;*/
  height: 500px;
}

.last a {
			text-decoration: none;
			font-size: 20px;
			color: orange;
		}

		.last {
			/*position: relative;*/
			
			/*margin-top: 100px;*/
		}

		.last a:hover{
			color: red;
		}

		#login {
			text-align: center;
		}

		#login a {
			text-decoration: none;
			color: #3964c3;
		}

		#login a:hover{
			color: #04AA6d;
		}
		
</style>
</head>
<body>
	<p class="last"><span><a href="/RMS/displaycustomer">Home :: </a></span>
		<span><a href="adminabout.jsp">About us</a></span></p>
	<h1> Fill THE FORM </h1>
	<div class="main">
		

		<form action="AdminCustomerAdd.jsp" method="post">
			<label for="customer name">Customer Name<sup>*</sup></label>
			<input type="text" name="customer name" required placeholder="Enter your Name" class="box">

			<label for="gender">Gender<sup>*</sup></label>
			<select name="gender" required>
				<option value="">---Select---</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="other">Other</option>
			</select>


			<label for="eamil">Email<sup>*</sup></label>
			<input type="email" name="email" required placeholder="Enter your Email" class="box">

			<label for="address">Address<sup>*</sup></label>
			<textarea name="address" placeholder="Enter your Address(max 200 characters)" required></textarea>

			<label for="mobile">Mobile Number<sup>*</sup></label>
			<input type="text" name="mobile number" required placeholder="Enter your Mobile Number" class="box" maxlength="10">

			<input type="submit" value="Submit">
			
		</form>
	</div>

	
</body>
</html>