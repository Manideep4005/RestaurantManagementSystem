<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<% 
	PreparedStatement pstmt = null;
    
	int delete = Integer.parseInt(request.getParameter("delete"));
	
	pstmt = DatabaseConnection.getConnection().prepareStatement("delete from menu where product_id = ?");
	pstmt.setInt(1, delete);

	
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
<title>## Deleting Menu ##</title>
</head>
<body>

</body>
</html>