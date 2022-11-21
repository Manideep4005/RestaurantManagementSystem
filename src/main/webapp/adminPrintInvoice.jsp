<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	Statement stmt = null;
    	ResultSet rs = null;
    	
    	stmt = DatabaseConnection.getConnection().createStatement();
    	rs = stmt.executeQuery("select customer_id, order_date, invoice_number from invoice");
    	
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Invoice Details</title>
	<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">
	
	<style type="text/css">
		
		body{
			 background-image: radial-gradient(circle, #051937, #4f295d, #9f2f66, #df4b4d, #f88914);
		}
		span {
		
		font-size: 18px;
		color: #051937;

	}

	span a {
		/*float: right;*/
		color: #14de9b;
		font-size: 18px;
		text-decoration: none;
	}

	span a:hover {
		color: /*brown*/#87cf0c;
		text-decoration: underline;
		text-decoration-color: /*limegreen*/#35f50a;
	}

	.parent{
		display: flex;
	}

	.show {
		flex: 1;
		margin-left: 420px;
	}

	.iprint{
		flex: 1;
		margin-right: 300px;
		padding: 15px;	
	}

	
	table {
		border-spacing: 5px 5px ;
		text-align: center;
	}

	h1{
		text-align: center;
		color: #84A98C;
	}

	th {
		padding: 5px;
		color: #c4620c;
		border-radius: 3px;
		background-color: #74ccaf;
	}

	td {
		padding: 1px;
		color: #dea004;
		border: 1px solid transparent;
		background-color: #c9f0e3;
		border-radius: 3px;
	}

	input[type=text] {
		border-radius: 3px;
		outline: none;
		color: #c4620c;
		height: 20px;
		padding: 5px;
		border:1px solid transparent;

	}
	::placeholder {
		color: #c4620c;
		font-size: 11px;
	}
	input[type=text]:focus {
		border:2px solid #df4b4d;
	}


	input[type=submit] {
		border-radius: 3px;
		background-color: #051937;
		color: white;
		padding: 5px;
		cursor: pointer;
		transition: 0.4s;
		border-color: transparent;
	}

	input[type=submit]:hover {
		background-color: #df4b4d;
	}
	</style>
</head>
<body>
	<span><a href="adminmodule.jsp">Home</a> :: </span>
	<span><a href="/RMS/adminLogout">Log out</a> :: </span>
	<span><a href="adminabout.html">About us</a></span>

	<h1>INVOICES</h1>
	<div class="parent">
		<div class="show">
		<table>
			<tr>
				<th>Invoice number</th><th>Order date</th><th>customerID</th>
			</tr>
			<% 
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("invoice_number") + "</td>");
					out.println("<td>" + rs.getDate("order_date") + "</td>");
					out.println("<td>" + rs.getInt("customer_id") + "</td>");
					out.println("</tr>");
				}
			%>
		</table>
	</div>

	<div class="iprint">
		<form method="post" action="admingenerateinvoice.jsp">
			
			<input type="text" name="invoicenumber" required placeholder="Enter invoice number(to print bill)">&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="button" type="submit" name="" value="Print">
		</form>
	</div>
	</div>
</body>
</html>