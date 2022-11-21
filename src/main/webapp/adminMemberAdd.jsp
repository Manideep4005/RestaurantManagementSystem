<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.time.Instant"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    	Timestamp stamp = Timestamp.from(Instant.now());
    	
    	PreparedStatement pstmt = null;
    
    	String id = request.getParameter("add");
    	
    	pstmt = DatabaseConnection.getConnection().prepareStatement("insert into members values(?,?)");
    	pstmt.setString(1, id);
    	pstmt.setTimestamp(2, stamp);
    	
    	int n = pstmt.executeUpdate();
    	
    	if (n > 0) {
    		response.sendRedirect("/RMS/displaymember");
    	}
    	else {
    		out.println("There is an error while inserting record!");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>### ADD ###</title>
</head>
<body>

</body>
</html>