<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.rms.sales.SalesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	////String user = null;
	//if(session.getAttribute("customerId") == null) {
	//	response.sendRedirect("customerlogin.html");
	//} else 
	//	user = (String) session.getAttribute("customerId");
	
	String userID = null;
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("customerId"))
				userID = cookie.getValue();
			
			if (cookie.getName().equals("JSESSIONID"))
				sessionID = cookie.getValue();
		}
	}
	
	if (userID == null) {
		response.sendRedirect("customerlogin.html");
	}
	
	
	
		
%>
<% 
	// JDBC CODE TO GET THE NAME OF THE USER USING CUSTOMER ID
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String customerName = null;
	//String gender = null;
	//String male = "Mr.  ";
	//String female = "Mrs.  ";
	//String Other = "";
	
	pstmt = DatabaseConnection.getConnection().prepareStatement("select customer_name,gender from customer  where customer_id=?");
	pstmt.setString(1, userID);
	
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		customerName = rs.getString("customer_name");
		//gender = rs.getString("gender");
	}
	
	//customerName = customerName.toUpperCase();
	
	//if (gender.equals("male")) {
		//customerName = male + customerName;
	//} else if (gender.equals("female")) {
	//	customerName = female + customerName;
	//} else {
		
	//}
	
/*	switch(gender) {
	case "male" :
		customerName = male + customerName;
		break;
		
	case "female" : 
		customerName = female +  customerName;
		break;
		
		default:
			customerName = Other + customerName;
	}
	*/
	
%>

<% 
	Connection con = null;
	Statement stmt = null;
	
	con = DatabaseConnection.getConnection();
	stmt = con.createStatement();
	rs = stmt.executeQuery("select * from menu");
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>::~~ WELCOME ~~::</title>
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
		color: crimson;
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
		font-family:'Copperplate Gothic';
		/*margin: 0 auto;*/
	}

	
	
	.menu table {
		border-spacing : 5px 10px;
	}

	.menu th {
	  background-color: #4287f5;
	  color: white;
	  width: 150px;
	  text-align: center;
	  border: 1px solid transparent;
	  padding: 5px;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.menu td {
	  width: 150px;
	  text-align: center;
	  border: 1px solid transparent;
	  padding: 5px;
	  background-color: /*42cbf5*/#f2eded;
	  color: forestgreen;
	  font-size: 18px;
	  border-radius: 5px;
	}

	h2 {
	  color: #4287f5;
	}

	.menu td:hover {
		/*background-color: lightcoral;*/
		color: #eb0c0c;
	}
	
	#cname {
		color : mintcream;
		font-family:'Copperplate Gothic';
		font-size: 25px;
		
	}
	.customer a{
		float: right;
		border: 1px solid transparent;
		padding: 5px;
		background-color: transparent;
		box-shadow: 0px 0px 0px 1px grey;
		border-radius: 1rem;
		color: antiquewhite;
	}
	
	.cdetail a {
		float: right;
		border: 1px solid transparent;
		padding: 5px;
		background-color: transparent;
		box-shadow: 0px 0px 0px 1px honeydew;
		border-radius: 2px;
		color: antiquewhite;
		transition: 0.3s;
		cursor:pointer;
	}
	
	.customer a:hover {
		text-decoration: none;
		color:white;
		box-shadow: 0px 0px 0px 1px #f27507;
	}
	
	.cdetail a:hover {
		text-decoration: none;
		color:white;
		box-shadow: 0px 0px 0px 1px #f27507;
	}

	#order {
		color: orange;
		/*text-align: center;*/
		font-size: 18px;
		
	}
.menu  {
		
		margin-left: 200px;
			justify-content: center;
			
			align-items: center;
			text-align: center;
			
			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
	}
	.order {
		fjustify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			
			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-top: 100px;	
			float: right;
			margin-right: 200px;
			box-shadow: 0px 0px 20px 0px white;
			border-radius: 13px; 
	}

	.order table {
		border-collapse: separate;
		border-spacing: 10px 10px ;
		margin-right: auto;
		margin-left: auto;
	}

	input[type=text] {
		  padding: 10px 10px;
		  

		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;
		  /*border-color: red;*/
	}

	input[type=submit] {
		width: 100%;
		background-color: #04AA6D;
		color: white;
		padding: 10px 10px;
		margin: 1px auto;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		}

	input[type=submit]:hover {
		background-color: #04AA;
	}

	
	
</style>
</head>
<body>
	<span><a href="customermenu.jsp">Home</a> ::</span>
	<span><a href="/RMS/customerLogout"> Log out </a>::</span>
	<span><a href="/RMS/customerAbout.jsp">About us</a></span>
	<span class="cdetail"><a href="customerdetails.jsp">My Account</a></span>
	<!--  <span class="customer"><a href="customersalesview.jsp">Order History</a></span>-->
	<p class="heading">WELCOME <span id="cname"><%=customerName %></span> TO RMS MENU</p>
	<div class="menu">
	<table >
		<tr>
			<th>Product ID</th><th>product name</th><th>price</th>

		</tr>
		<%
			while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getInt("product_id") + "</td>");
				out.println("<td>" + rs.getString("product_name") + "</td>");
				out.println("<td>" + rs.getDouble("price") + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	</div>
	<div class="order">
		
		<form method="post" action="customerorder.jsp">
		<p id="order">Order Here</p>
			<table>
				<tr>
					<td ><input type="text" name="id" required placeholder="Enter product id"></td>
					
				</tr>
				<tr>
					
					<td class="select">
						<input type="text" name="quantity" required placeholder="Enter quantity"></td>
					
					
				</tr>
				<tr>
					
					
					<td><input type="submit" name="" value="Order"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>