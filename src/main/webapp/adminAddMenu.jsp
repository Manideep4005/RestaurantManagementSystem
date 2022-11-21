<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    
    	PreparedStatement pstmt = null;
    
    	String name = request.getParameter("productname");
    	double price = Double.parseDouble(request.getParameter("price"));
    	
    	pstmt = DatabaseConnection.getConnection().prepareStatement("insert into menu(product_name, price) values (?, ?)");
    	pstmt.setString(1, name);
    	pstmt.setDouble(2, price);
    	
    	int n = pstmt.executeUpdate();
    	
    	if (n > 0) {
    		response.sendRedirect("/RMS/displayadminmenu");
    	} else {
    		out.println("There is an error");
    		RequestDispatcher rd = request.getRequestDispatcher("/RMS/displayadminmenu");
    		rd.include(request, response);
    		
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>## Adding To Menu ##</title>
</head>
<body>

</body>
</html>