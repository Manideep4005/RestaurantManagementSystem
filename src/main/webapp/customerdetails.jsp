<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		
		
		
		// For getting the current customer details
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int customerId = 0;
		String customerName = null;
		String gender = null;
		String email = null;
		String address = null;
		long mobile = 0;
		
		
		
		pstmt = DatabaseConnection.getConnection().prepareStatement("select * from customer where customer_id=?");
		pstmt.setString(1, userID);
		
		rs = pstmt.executeQuery();
		
		
			while(rs.next()) {
				customerId = rs.getInt("customer_id");
				customerName = rs.getString("customer_name");
				gender = rs.getString("gender");
				email = rs.getString("email");
				address = rs.getString("address");
				mobile = rs.getLong("mobile_number");
			}
		 
			//out.println("Unable to fetch the data"); %>
			
		
		<%
		
    %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	.customer a{
		float: right;
		border: 1px solid transparent;
		padding: 5px;
		background-color: transparent;
		box-shadow: 0px 0px 0px 1px honeydew;
		border-radius: 2px;
		color: antiquewhite;
		cursor: pointer;
		transition: 0.4s;
	}
	
	.customer a:hover {
		text-decoration: none;
		color:white;
		box-shadow: 0px 0px 0px 1px #f27507;
	}
	
	
	span {
		font-size: 18px;
		color: mediumorchid;
	}

	a {
		/*float: right;*/
		color: crimson;
		font-size: 18px;
		text-decoration: none;
		cursor: pointer;
		transition: 0.1s;
	}

	a:hover {
		color: /*brown#c4620c*/honeydew;
		text-decoration: underline;
		text-decoration-color: /*limegreen*/#f27507;

	}
	
	
	body {
		background-image: linear-gradient(to right, #bdc3c7, #2c3e50);
	}
	
	table{
		text-align: center;
		margin-left: auto;
		margin-right: auto;
	}

	th {
		font-size: 20px;
		color: #243b55;
		padding: 10px;
	}

	td {
		color: #42275a;
		padding: 6px;
		font-size: 20px;
	}

	h1{
		text-align: center;
/*		cursor: pointer;*/
		transition: 0.4s;
		color: #f27507;
	}
	
</style>

</head>
<body>
<span><a href="customermenu.jsp">Home</a> ::</span>
	<span><a href="/RMS/customerLogout"> Log out</a> ::</span>
	<span><a href="/RMS/customerAbout.jsp">About us</a></span>
	<!-- <span class="cdetail"><a href="customerdetails.jsp">My Account</a></span> -->
	  <span class="customer"><a href="customersalesview.jsp">My Orders</a></span>
	
	<h1 style="font-family:'Copperplate Gothic';">~~~ Your Details ~~~</h1>

	<table>
  <tr>
    <th>Customer ID:</th>
    <td><%=customerId %></td>
  </tr>
  <tr>
    <th>Customer Name:</th>  
    <td><%=customerName %></td>      
  </tr>  
  <tr>
    <th>Gender:</th>
    <td><%=gender %></td>
  </tr>
  <tr>
    <th>Email:</th>
    <td><%=email %></td>
  </tr>
  <tr>
    <th>Address:</th>
    <td><%=address %></td>
  </tr>
  <tr>
    <th>Mobile:</th>
    <td><%=mobile%></td>
  </tr>
</table>
</body>
</html>