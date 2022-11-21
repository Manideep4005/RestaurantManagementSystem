<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.rms.admin.AdminValidateServlet"%>
    


<% 
	/*String user = null;
	if(session.getAttribute("username") == null) {
		response.sendRedirect("adminlogin.html");
	}
	
	else 
		user = (String) session.getAttribute("username");*/
	
	String userName = null;
	String sessionID = null;
	
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("username"))
				userName = cookie.getValue();
			
			if (cookie.getName().equals("JSESSIONID"))
				sessionID = cookie.getValue();
		}
	}
	
	
	if (userName == null)
		response.sendRedirect("adminlogin.html");
	
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>::~~ Welcome ~~::</title>
	<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

	<style type="text/css">
		h1 {
			text-align: center;
			color: darkolivegreen;
			font-style: italic;
			font-family:'Copperplate Gothic';
		}
		
		h1 span {
			font-family:'Copperplate Gothic';
			color: fuchsia;
		}

		tr {
			text-align: center;
		}

		
		a {
			text-decoration: none;
			/*color: red;*/
		}

		a:link {
		  color: red;
		}

		/* visited link */
		a:visited {
		  color: brown;
		}

		/* mouse over link */
		a:hover {
		  color: royalblue;
		}

		/* selected link */
		a:active {
		  color: blue;
		}

		body {
			background-image: linear-gradient(to right, #0f0c29, #302b63, #24243e);
		}

		.div1 {
			
		}
		
		.last a {
			text-decoration: none;
			font-size: 20px;
			color: orange;
			
		}

		span {
			color: orange;
			font-size: 20px;
		}
		.last a:hover{
			color: red;
		}
		
		#details {
			float: right;
		}

		td {
			color: white;
		}

		table {
			border: 1px solid thistle;
		}


</style>

		
	
</head>
<body>
	<p class="last"><span><a href="adminmodule.jsp">Home</a>&nbsp;::&nbsp;</span><span><a href="/RMS/adminLogout">Log out</a><span>&nbsp;::&nbsp;<a href="adminabout.html">About us</a></span><span id="details"><a href="admindetails.jsp">Admin details</a></span></p>
	<h1>Management Modules<span></span></h1>
	<div class="div1">
		

	<table align="center" cellpadding="13px" border="1px">
		<tr>
			<td>Customer Details</td>
			<td><a href="/RMS/displaycustomer" class="a">Click Here</a></td>
		</tr>
		<tr>
			<td>Sales Details</td>
			<td><a href="/RMS/displaysales" class="a">Click Here</a></td>
		</tr>
		<tr>
			<td>Members Details</td>
			<td><a href="/RMS/displaymember" class="a">Click Here</a></td>
		</tr>
		<tr>
			<td>Menu Details</td>
			<td><a href="/RMS/displayadminmenu" class="a">Click Here</a></td>
		</tr>
		<tr>
			<td>Generate Invoice</td>
			<td><a href="adminPrintInvoice.jsp" class="a">Click Here</a></td>
		</tr>
	</table>
	</div>
	
</body>
</html>