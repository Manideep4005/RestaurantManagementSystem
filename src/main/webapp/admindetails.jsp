<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	
    	String name = null;
    
	    Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
					name = cookie.getValue();
				
				;
			}
		}
    	
    	//out.println(name);
    
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String userName = null;
    	String email = null;
    	long mobile = 0;
    	String address = null;
    	
    	pstmt = DatabaseConnection.getConnection().prepareStatement("select * from admin where username = ?");
    	pstmt.setString(1, name);
    	
    	rs = pstmt.executeQuery();
    	
    	while (rs.next()) {
    		userName = rs.getString("username");
    		email = rs.getString("email");
    		mobile = rs.getLong("contact");
    		address = rs.getString("address");
    	}
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">

	body {
		background-image: linear-gradient(to right, #bdc3c7, #2c3e50 );
	}

	h1 {
		font-family:'Copperplate Gothic';
		text-align: center;
		color: #004e92;
	}
	
	span {
		font-size: 17px;
	}
	
	span a{
		color: #d76d77;
		text-decoration: none;
	}

	span a:hover {
		color: red;

	}

	table {
		margin-left: auto;
		margin-right: auto;
		padding: 20px;
		
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

</style>
</head>
<body>
	<span><a href="adminmodule.jsp">Home</a></span>&nbsp;::
	<span><a href="adminabout.html">About us</a></span>&nbsp;::
	<span><a href="/RMS/adminLogout">Log out</a></span>
	<h1>~~~ Admin Details ~~~</h1>

	<table>
  <tr>
    <th>Name:</th>
    <td><%=userName %></td>
  </tr>
  <tr>
    <th>Email:</th>  
    <td><%=email %></td>      
  </tr>  
  <tr>
    <th>Phone:</th>
    <td><%=mobile %></td>
  </tr>
  <tr>
    <th>Address:</th>
    <td><%=address %></td>
  </tr>
</table>
</body>
</html>