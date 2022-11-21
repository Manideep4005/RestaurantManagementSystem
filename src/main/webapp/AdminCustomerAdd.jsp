<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rms.customer.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	
<% 
	PreparedStatement pstmt = null;
	String name = request.getParameter("customer name");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	long mobile = Long.parseLong(request.getParameter("mobile number"));
	
	pstmt = DatabaseConnection.getConnection().prepareStatement("insert into customer(customer_name,gender,email,address,mobile_number) values(?,?,?,?,?)");
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setString(3, email);
	pstmt.setString(4, address);
	pstmt.setLong(5, mobile);
	int n = pstmt.executeUpdate();
	
	
	if (n > 0) {
		response.sendRedirect("/RMS/displaycustomer");
	} 
	else {
		out.println("There is an error");
		RequestDispatcher rd = request.getRequestDispatcher("/RMS/displaycustomer");
		rd.include(request, response);
		
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">



</head>
<body>
	
</body>
</html>
