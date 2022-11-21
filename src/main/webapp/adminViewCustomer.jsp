<%@page import="com.mysql.cj.protocol.a.NativeConstants.IntegerDataType"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rms.customer.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	
<% ArrayList<CustomerBean> clist = (ArrayList<CustomerBean>)request.getAttribute("clist");
	Iterator<CustomerBean> itr = clist.iterator();
	
	
	  /*while(itr.hasNext())
	   {
		   CustomerBean cBean = itr.next();   
		  
		   id = cBean.getCustomerId();
		   name = cBean.getCustomerName();
		   gender = cBean.getGender();
		   email = cBean.getEmail();
		   address = cBean.getAddress();
		   mobile = cBean.getMobileNumber();
	   }*/ 
	   
%>
    
    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	body{
		background-color: black;
		background-image: url("display background.jpg");
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-size: 100% 100%;
	}

	.detail{
		border-collapse: separate;
		/*border-spacing: 10px 10px;*/
		margin-right: auto;
		margin-left: auto;
		/*border: 1px solid darkred;*/
		margin: 8px auto;
	}	

	.detail th {
		border: 1px solid ;
		border-color: #ba5c34;
		width: 100px;

		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: #095de3;
		color: white;
		border-radius: 5px;
	}

	.detail td {
		border: 1px solid ;
		border-color: #eb0c43;
		width: 100px;

		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: #547bb8;
		color: white;
		border-radius: 5px;
	}

	.detail td:hover {
		background-color: #0db9db;
		border-color: blue;
	}

	span {
		font-size: 18px;
		color: mediumorchid;
	}

	span a {
		/*float: right;*/
		color: crimson;
		font-size: 18px;
		text-decoration: none;
	}

	span a:hover {
		color: /*brown*/#87cf0c;
		text-decoration: underline;
		text-decoration-color: /*limegreen*/#35f50a;
	}

	h1 {
		text-align: center;
		color: deeppink;
	}

	#info {
		text-align: center;
		color: cornflowerblue;
		font-size: 15px;
	}

	p a{
		color: cornflowerblue;
		/*border: 1px solid cornflowerblue;*/
		text-decoration: none;
		font-size: 18px;
	}
	p a:hover{
		text-decoration: underline;
		text-decoration-color: deeppink;
	}

	input[type=submit] {
  width: 100%;
  background-color: #04AA6D;
  color: white;
  padding: 10px 10px;
  margin: 1px auto;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

	input[type=submit]:hover {
  background-color: #04AA;
	}

	input[type=text] {
		 width: 100%;
		  padding: 10px 10px;
		  margin: 8px auto;
		  /*display: table;*/
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;
	}

	.d {
		
			height: 150px;
			width: 150px;
			border-radius: 10px;
			/*display: flex;*/
			justify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			box-shadow: 0 5px 5px 3px gray;
			/*margin: 50px auto;*/
			background-color: transparent;

			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-right: 10px;
	}

	.add {
		
			height: 150px;
			width: 150px;
			border-radius: 10px;
			/*display: flex;*/
			justify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			box-shadow: 0 5px 5px 3px gray;
			/*margin: 50px auto;*/
			background-color: transparent;

			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-left: 10px;
	}

	.parent {
		/*border: 1px solid black;*/
	  	margin: 0 auto;
  		padding: 1px 1px;
 	 	text-align: center;
	}
	
	.s1 a{
		float: right;
		border: 1px solid cream;
		padding: 8px;
		background-color: transparent;
		border-radius: 1rem;
		color: #17b969;
		margin-left: 5px;
		box-shadow: 1px 1px 1px 1px gray;
		cursor: pointer;
		transition: 0.4s;
	}

	.s1 a:hover {
		text-decoration: none;
		color: crimson;
	}
	
	.s2 a{
		float: right;
		border: 1px solid cream;
		padding: 8px;
		background-color: transparent;
		border-radius: 1rem;
		color: #17b969;
		box-shadow: 1px 1px 1px 1px gray;
		cursor: pointer;
		transition: 0.4s;
		margin-left: 5px;
	}

	.s2 a:hover {
		text-decoration: none;
		color: crimson;
	}
	
	.s3 a{
		float: right;
		border: 1px solid cream;
		padding: 8px;
		background-color: transparent;
		border-radius: 1rem;
		color: #17b969;
		box-shadow: 1px 1px 1px 1px gray;
		cursor: pointer;
		transition: 0.4s;
	}

	.s3 a:hover {
		text-decoration: none;
		color: crimson;
	}
	
	.d a{
		width: 100%;
	  	background-color: #04AA6D;
	  	color: white;
	  	padding: 10px 10px;
	 	 margin-top: 10px;
	  	border: none;
	  	border-radius: 4px;
	  	cursor: pointer;
		text-decoration: none;
	}
	.d a:hover{
		background-color: #04AA;
	}
	.d p{
		margin-top: 40px;
		/*margin-bottom: 60px;*/
	}
</style>


</head>
<body>
	<span><a href="adminmodule.jsp">Home</a> ::</span>
	<span><a href="/RMS/adminLogout"> Log out </a>::</span>
	<span><a href="adminabout.html">About us</a></span>
	<span class="s1"><a href="/RMS/displaymember">member details</a></span>
	<span class="s2"><a href="/RMS/displaysales">sales details</a></span>
	<span class="s3"><a href="/RMS/displayadminmenu">menu details</a></span>
	<h1>The customer details are below.</h1>
	<!--  <p id="info">For the details of <a href="/RMS/displaymember">MEMBERS</a>.</p>-->

	<table class="detail">
		<tr>
			<th>Customer ID</th><th>Customer Name</th><th>Gender</th><th>Email</th><th>Address</th><th>Mobile Number</th>
		</tr>
		
		<%
			
			while (itr.hasNext()) {
				CustomerBean cBean = itr.next();   
					out.println("<tr>");
				   out.println("<td>" + cBean.getCustomerId() + "</td>");
				   out.println("<td>" + cBean.getCustomerName() + "</td>");
				   out.println("<td>" + cBean.getGender() + "</td>");
				  
				   out.println("<td>" + cBean.getEmail() + "</td>");
				   out.println("<td>" + cBean.getAddress() + "</td>");
				   out.println("<td>" + cBean.getMobileNumber() + "</td>");
				   out.println("</tr>");
				  
			}
		
		
			  
		%>
		
	</table>

	<div class="parent">
	 	<div class="d">
		<!-- <form method="post" action="adminCustomerDelete.jsp">
		<p style="color: brown">To delete customer</p>
		<!-- <label for="delete">Enter the customer id</label> 
		<table class="">
			<tr>
			<td><input type="text" name="delete" placeholder="Enter customer id"></td>
			
		</tr>
		<tr>
			<td><input type="submit" name="" value="delete"></td>
		</tr>
		</table>
	</form>-->
	<p style="color: brown">To Add Customer</p>
	<a href="adminaddcustomer.jsp">Add</a>
	</div>
	<div class="add">
		<form method="post" action="adminMemberAdd.jsp">
		<p style="color: brown">Add to member</p>
		<!-- <label for="delete">Enter the customer id</label> -->
		<table class="">
			<tr>
			<td><input type="text" name="add" placeholder="Enter customer id"></td>
			
		</tr>
		<tr>
			<td><input type="submit" name="" value="Add"></td>
		</tr>
		</table>
	</form>
	</div>
	</div>
</body>
</html>

<% 
	
%>