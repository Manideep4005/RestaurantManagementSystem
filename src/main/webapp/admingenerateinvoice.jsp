<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	    int customer_id = 0;
		String customerName = null;
		int pid = 0;
		String pName = null;
		double price = 0;
		double qty = 0;
		double subtotal = 0;
		double total = 0;
		Date date = null;
		double tax = 0;
		
    	String invoice = request.getParameter("invoicenumber");
    	invoice = invoice.toUpperCase();
    	
    	PreparedStatement pstmt = DatabaseConnection.getConnection().prepareStatement("select * from invoice where invoice_number=?");
    	pstmt.setString(1, invoice);
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	
			
    	
    	while (rs.next()) {
    		customer_id = rs.getInt("customer_id");
    		customerName = rs.getString("customer_name");
    		pid = rs.getInt("item_id");
    		pName = rs.getString("item_name");
    		price = rs.getDouble("price");
    		qty = rs.getDouble("qty");
    		tax = rs.getDouble("tax");
    		total = rs.getDouble("total");
    		date = rs.getDate("order_date");
    				
    	}
    	
    	subtotal = price * qty;
    %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Receipt Invoice</title>

	<style type="text/css">
		body {
			background-color: wheat;
		}

		.card{
			margin-left: auto;
			margin-right: auto;
			border: 1px solid transparent;
			background-color: white;
			/*border-bottom-left-radius: 10px;
			border-bottom-right-radius: 10px;
			box-shadow:0px 1px 0px 0px black;*/
			/*height: 500px;*/
			/*border-spacing: 10px 10px;*/
			width: 800px;
			/*height: 500px;*/
		}

		.h {
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			border: 1px solid transparent;
			background-color: #28282B;
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
			/*box-shadow:0px 1px 1px 0px black;*/
			width: 800px;
		}

		.h p{
			color: white;
			font-size: 20px;
		}

		.card table {
			margin-right: 50px;
			margin-left: 50px;
			border-collapse: separate;
			/*border-spacing: 3px;*/
		
		/*border: 1px solid darkred;*/
		
			/*margin-top: 0px;*/
		}

		
		
		

		#id1 {
			margin-top: 10px auto;

			float: right;
			margin-right: 20px;
		}

		#date {
			float: right;
			margin-right: 20px;
			font-size: 16px;
		}

		#name {
			margin-top: 10px;
			margin-left: 20px;
			font
		}

		#address {
			margin-left: 120px;
			margin-top: 0;
			font-size: 12px;
		}


		.card th {
		/*border: 1px solid ;*/
		
		width: 200px;
		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: black;
		color: white;
		

	}

	.card td {
		/*border: 1px solid ;*/
		
		width: 200px;
		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: #d9d9d9;
		color: black;
		

	}


	#amount {
		float: right;
		/*text-align: right;*/
		margin-right: 90px;
		margin-top: 10px;
	}

	#tax {
		margin-top: 50px;
		text-align: right;
		margin-right: 90px;
	}
	
	#total {

		/*float: right;*/
		/*text-align: right;*/
		margin-right: 55px;
		margin-left: 610px;
		background-color: orange;
		padding: 5px;
	}

	.footer {
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		border: 1px solid transparent;
		background-color: #28282B;
		width: 800px;
		border-bottom-right-radius: 10px;
		border-bottom-left-radius: 10px;
		/*box-shadow:0px 10px 10px 0px rebeccapurple;*/
	}

	.footer p{
		color: goldenrod;
	}
	
	#home {
		
		text-align: center;
		text-decoration: none;
	}

	#home a{
		text-decoration: none;
		color: black;

	}
	</style>
</head>
<body>
<h2 style="text-align: center; font-family:'Copperplate Gothic'; color: #df4b4d;">Invoice copy of customerID <%=customer_id %> on <%=date %></h2>

	<div class="h">
		<p>INVOICE</p>
	</div>

	<div class="card">
		
		<span id="name">INVOICE TO: <b><%=customerName %></b></span>
		<span id="id1">INVOICE ID#: <b><%=invoice %></b> </span>
		<p id="address">Main Road,<span id="date">DATE: <b><%=date %></b></span><br>L.B NAGAR<br>HYDERABAD-079.</p>

		<table>
			<tr>
				<th>ITEM ID.</th>
				<th>ITEM NAME</th>
				<th>PRICE</th>
				<th>QTY.</th>
				<th>TOTAL</th>
			</tr>	
			<tr>
				<td><%= pid%></td>
				<td><%= pName%></td>
				<td><%= price%></td>
				<td><%= qty%></td>
				<td><%= subtotal%></td>
			</tr>
		</table>
		
		<span id="amount">SUB TOTAL:&nbsp;<b><%=subtotal %></b></span>
		<p id="tax">TAX:&nbsp;<b><%=tax%>%</b></p>
		<p id="total">TOTAL:&nbsp;<b><%=total %></b></p>
	</div>
	<div class="footer">
		<p>------- THANK YOU -------</p>
	</div>
	<p id="home"><a href="adminPrintInvoice.jsp">BACK</a></p>
</body>
</html>
