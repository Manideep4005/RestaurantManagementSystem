<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String customer_id = request.getParameter("id");//Integer.parseInt(request.getParameter("id"));
    	String date  = request.getParameter("date");
    	
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String userName = null;
    	pstmt = DatabaseConnection.getConnection().prepareStatement("select customer_name from customer where customer_id = ? ");
    	pstmt.setString(1, customer_id);
    	
    	rs = pstmt.executeQuery();
    	while (rs.next()) {
    		userName = rs.getString("customer_name");
    	}
    	
    	pstmt = DatabaseConnection.getConnection().prepareStatement("select * from invoice where customer_id = ?");
    	pstmt.setString(1, customer_id);
    	//pstmt.setString(2, date);
    	
    	
    	rs = pstmt.executeQuery();
    	
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>customer sales details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	body{
		background-color: #2e2d2d;
		
	}

	.detail {
		border-collapse: separate;
		border-spacing: 1px 10px ;
		margin-right: auto;
		margin-left: auto;

	}

	.detail th {
	  background-color: #4287f5;
	  color: white;
	  width: 150px;
	  text-align: center;
	  border: 1px solid black;
	  padding: 5px;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.detail td {
	  width: 150px;
	  text-align: center;
	  border: 1px solid black;
	  padding: 5px;
	  background-color: /*42cbf5*/#f2eded;
	  color: forestgreen;
	  font-size: 18px;
	   border-radius: 5px;
	}

	.detail td:hover {
		background-color: #0db9db;
		border-color: blue;
		color: black;
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
		text-decoration-color: /*limegreen*/#35f50a;
	}

	

	#info {
		text-align: center;
		color: orange;
		font-size: 22px;
		font-family:'Copperplate Gothic';
	}
	
	.customer a{
		float: right;
		border: 1px solid transparent;
		padding: 8px;
		border-radius: 3px;
		color: antiquewhite;
		cursor: pointer;
		transition: 0.4s;
		box-shadow: 0px 0px 0px 1px #4287f5;
	}

	.customer a:hover {
		text-decoration: none;
		color: white;
		box-shadow: 0px 0px 0px 1px orange;
	}
	
	#order {
		color: orange;
		/*text-align: center;*/
		font-size: 18px;
	}

	.order {
		border: 1px solid transparent;
		width: 460px;
		padding: 10px;
		margin-right: auto;
		margin-left: auto;
		text-align: center;
		box-shadow: 3px 3px 0px 0px firebrick;
		background-color: ;
		/*border-top-left-radius: 10px;*/
		border-bottom-right-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		/*border-bottom-color: red;*/
	}

	.order table {
		border-collapse: separate;
		border-spacing: 10px 10px ;
		margin-right: auto;
		margin-left: auto;
	}

	input[type=text] {
		  padding: 10px 10px;
		  

		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;
		  /*border-color: red;*/
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
	
	h1 {
		text-align: center;
		color: orange;
		/*font-size: 22px;*/
		font-family:'Copperplate Gothic';
	}

</style>


</head>
<body>
	
	<span><a href="adminmodule.jsp">Home</a> ::</span>
	<span><a href="/RMS/adminLogout"> Log out </a>::</span>
	<span><a href="adminabout.html">About us</a></span>
	<span class="customer"><a href="/RMS/displaysales">sales details</a></span>
	<h1>Orders of <%=userName %></h1>
	<!--  <p id="info">DETAILS OF SALES</p>
-->
	<table class="detail">
		<tr>
			<th>Item id</th><th>Item name</th><th>Price</th><th>Quantity</th><th>Tax%</th><th>Total</th><th>Order date</th><th>Invoice number</th>
		</tr>
		
		<% 
			while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getInt("item_id") + "</td>");
			out.println("<td>" +  rs.getString("item_name")+ "</td>");
			out.println("<td>" + rs.getDouble("price")+ "</td>");
			out.println("<td>" +  rs.getInt("qty")+ "</td>");
			out.println("<td>" +  rs.getDouble("tax")+ "</td>");
			out.println("<td>" +  rs.getDouble("total")+ "</td>");
			out.println("<td>" +  rs.getDate("order_date")+ "</td>");
			out.println("<td>" +  rs.getString("invoice_number")+ "</td>");
			out.println("</tr>");
			}	
		
		%>
	</table>

	
</body>