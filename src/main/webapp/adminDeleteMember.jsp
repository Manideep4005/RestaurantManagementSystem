<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	PreparedStatement pstmt = null;
    
    	String customerid = request.getParameter("delete");
    	
    	pstmt = DatabaseConnection.getConnection().prepareStatement("delete from members where customer_id = ?");
    	pstmt.setString(1, customerid);
    	
    	int n = pstmt.executeUpdate();
    	
    	if (n > 0) {
    		response.sendRedirect("/RMS/displaymember");
    		
    	}
    	else {
    		out.println("There is an error while deleteing");
    		response.sendRedirect("/RMS/displaymember");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>### Delete member ###</title>
</head>
<body>

</body>
</html>