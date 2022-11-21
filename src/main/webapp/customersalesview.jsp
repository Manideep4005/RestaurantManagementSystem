<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rms.sales.SalesBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String userID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("customerId"))
				userID = cookie.getValue();
		}
	}
	
	
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	
	pstmt = DatabaseConnection.getConnection().prepareStatement("select * from invoice where customer_id = ?");
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	
	
	
	
	
	
	
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>:: Order History ::</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">

	body {
		background-color: #2e2d2d;
	}
	span {
		font-size: 18px;
		color: mediumorchid;
	}

	a {
		/*float: right;*/
		color: crimson;al;
		font-size: 18px;
		text-decoration: none;
	}

	a:hover {
		color: /*brown*/#35f50a;
		text-decoration: underline;
		text-decoration-color: /*limegreen*/#87cf0c;
	}

	.heading {
		
		text-align: center;
		color : orange;
		font-size: 25px;
		/*margin: 0 auto;*/
	}

	table {
		border-collapse: separate;
		border-spacing: 5px 10px ;
		margin-right: auto;
		margin-left: auto;
	}

	th {
	  background-color: #4287f5;
	  color: white;
	  
	  text-align: center;
	  border: 1px solid transparent;
	  padding: 5px;
	  font-size: 15px;
	  border-radius: 5px;
	}

	td {
	  
	  text-align: center;
	  border: 1px solid transparent;
	  padding: 5px;
	  background-color: /*42cbf5*/#f2eded;
	  color: forestgreen;
	  font-size: 15px;
	  border-radius: 5px;
	}

	h2 {
	  color: #4287f5;
	}

	td:hover {
		/*background-color: lightcoral;*/
		color: #eb0c0c;
	}
	
	#cname {
		color : mintcream;
		font-family:'Copperplate Gothic';
		font-size: 25px;
		text-decoration: underline;
	}
	
	.customer a{
		float: right;
		border: 1px solid transparent;
		padding: 8px;
		background-color: transparent;
		box-shadow: 0px 0px 0px 1px honeydew;
		border-radius: 2px;
		color: antiquewhite;
		transition: 0.4s;
		cursor: pointer;
	}

	.customer a:hover {
		text-decoration: none;
		color: white;
		box-shadow: 0px 0px 0px 1px #f27507;
	}
</style>
</head>
<body>
	<span><a href="customermenu.jsp">Home</a> ::</span>
	<span><a href="/RMS/customerLogout"> Log out </a>::</span>
	<span><a href="/RMS/customerAbout.jsp">About us</a></span>
	<span class="customer"><a href="customermenu.jsp">Menu</a></span>
	<p class="heading">YOUR ORDERS HISTORY</p>
	<table >
		<tr>
			<th>Product Id</th><th>Product name</th><th>Price</th>
			<th>Quantity</th><th>Tax%</th><th>Total</th><th>Order date</th><th>Invoice number</th>

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
</html>