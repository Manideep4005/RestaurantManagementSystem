<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.Random"%>
<%@page import="com.dbutil.CurrentDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.dbutil.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String userId = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("customerId"))
				userId = cookie.getValue();
			}
	}
	
	
	
	Date date = CurrentDate.getCurrentDate();
	
	//out.println(date);
	
%>

<%
	//Random random = new Random();
	//int invoice = random.nextInt(100001);
	
	
    String numbers = "1234567890";

    // combine all strings
    String alphaNumeric =  numbers;

    // create random string builder
    StringBuilder sb = new StringBuilder();

    // create an object of Random class
    Random random = new Random();

    // specify length of random string
    int length = 5;

    for(int i = 0; i < length; i++) {

      // generate random index number
      int index = random.nextInt(alphaNumeric.length());

      // get character specified by index
      // from the string
      char randomChar = alphaNumeric.charAt(index);

      // append the character to string builder
      sb.append(randomChar);
    }

    String invoice = "M-" + sb.toString();
   
    
    //-----------------------------------------------------------------------------//
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String customerName = null;
    int customer_id = 0;
    
    pstmt = DatabaseConnection.getConnection().prepareStatement("select customer_id,customer_name,gender from customer  where customer_id=?");
	pstmt.setString(1, userId);
	
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		customer_id = rs.getInt("customer_id");
		customerName = rs.getString("customer_name");
	}
	
	
%>

<%
	// Inserted to sales.
	int pid = Integer.parseInt(request.getParameter("id"));
	int qty =	Integer.parseInt(request.getParameter("quantity"));
	
	pstmt = DatabaseConnection.getConnection().prepareStatement("insert into sales values (?, ?, ?)");
	pstmt.setInt(1, customer_id);
	pstmt.setDate(2, date);
	pstmt.setInt(3, pid);
	
	int n = pstmt.executeUpdate();
	
	if (n > 0){
	System.out.println("inserted into sales");
	}
	else {
		
	}
%>

<%
	String pName = null;
	double price = 0;
	pstmt = DatabaseConnection.getConnection().prepareStatement("select product_name,price from menu where product_id = ?");
	pstmt.setInt(1, pid);
	
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		pName = rs.getString("product_name");
		price = rs.getDouble("price");
	}
	
	double subtotal = price * qty;
	double tax = 0;
	if (subtotal < 1000) {
		tax = 2.5;
	}
	else if (subtotal >= 1000 && subtotal <= 2000) {
		tax = 3.4;
	}
	else if (subtotal > 2000) {
		tax = 4.7;
	}
	
	
	double total = subtotal + ((subtotal * tax/100));
%>


<%
	pstmt = DatabaseConnection.getConnection().prepareStatement("insert into invoice values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	pstmt.setInt(1, customer_id);
	pstmt.setString(2, customerName);
	pstmt.setInt(3, pid);
	pstmt.setString(4, pName);
	pstmt.setDouble(5, price);
	pstmt.setInt(6, qty);
	pstmt.setDouble(7, tax);
	pstmt.setDouble(8, total);
	pstmt.setDate(9, date);
	pstmt.setString(10, invoice);
	
	int a = pstmt.executeUpdate();
	if (a > 0) {
		System.out.println("Inserted into invoice");
	}
	else {
		
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Receipt Invoice</title>

	<style type="text/css">
		body {
			background-color: wheat;
		}

		.card{
			margin-left: auto;
			margin-right: auto;
			border: 1px solid transparent;
			background-color: white;
			/*border-bottom-left-radius: 10px;
			border-bottom-right-radius: 10px;
			box-shadow:0px 1px 0px 0px black;*/
			/*height: 500px;*/
			/*border-spacing: 10px 10px;*/
			width: 800px;
			/*height: 500px;*/
		}

		.h {
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			border: 1px solid transparent;
			background-color: #28282B;
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
			/*box-shadow:0px 1px 1px 0px black;*/
			width: 800px;
		}

		.h p{
			color: white;
			font-size: 20px;
		}

		.card table {
			margin-right: 50px;
			margin-left: 50px;
			border-collapse: separate;
			/*border-spacing: 3px;*/
		
		/*border: 1px solid darkred;*/
		
			/*margin-top: 0px;*/
		}

		
		
		

		#id1 {
			margin-top: 10px auto;

			float: right;
			margin-right: 20px;
		}

		#date {
			float: right;
			margin-right: 20px;
			font-size: 16px;
		}

		#name {
			margin-top: 10px;
			margin-left: 20px;
			font
		}

		#address {
			margin-left: 120px;
			margin-top: 0;
			font-size: 12px;
		}


		.card th {
		/*border: 1px solid ;*/
		
		width: 200px;
		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: black;
		color: white;
		

	}

	.card td {
		/*border: 1px solid ;*/
		
		width: 200px;
		font-size: 15px;
		text-align: center;
		padding: 3px;
		background-color: #d9d9d9;
		color: black;
		

	}


	#amount {
		float: right;
		/*text-align: right;*/
		margin-right: 90px;
		margin-top: 10px;
	}

	#tax {
		margin-top: 50px;
		text-align: right;
		margin-right: 90px;
	}
	
	#total {

		/*float: right;*/
		/*text-align: right;*/
		margin-right: 55px;
		margin-left: 610px;
		background-color: orange;
		padding: 5px;
	}

	.footer {
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		border: 1px solid transparent;
		background-color: #28282B;
		width: 800px;
		border-bottom-right-radius: 10px;
		border-bottom-left-radius: 10px;
		/*box-shadow:0px 10px 10px 0px rebeccapurple;*/
	}

	.footer p{
		color: goldenrod;
	}
	
	#home {
		
		text-align: center;
		text-decoration: none;
	}

	#home a{
		text-decoration: none;
		color: black;

	}
	</style>
</head>
<body>

	<div class="h">
		<p>INVOICE</p>
	</div>

	<div class="card">
		
		<span id="name">INVOICE TO: <b><%=customerName %></b></span>
		<span id="id1">INVOICE ID#: <b><%=invoice %></b> </span>
		<p id="address">Main Road,<span id="date">DATE: <b><%=date %></b></span><br>L.B NAGAR<br>HYDERABAD-079.</p>

		<table>
			<tr>
				<th>ITEM ID.</th>
				<th>ITEM NAME</th>
				<th>PRICE</th>
				<th>QTY.</th>
				<th>TOTAL</th>
			</tr>	
			<tr>
				<td><%= pid%></td>
				<td><%= pName%></td>
				<td><%= price%></td>
				<td><%= qty%></td>
				<td><%= subtotal%></td>
			</tr>
		</table>
		
		<span id="amount">SUB TOTAL:&nbsp;<b><%=subtotal %></b></span>
		<p id="tax">TAX:&nbsp;<b><%=tax %>%</b></p>
		<p id="total">TOTAL:&nbsp;<b><%=total %></b></p>
	</div>
	<div class="footer">
		<p>------- THANK YOU -------</p>
	</div>
	<p id="home"><a href="customermenu.jsp">BACK</a></p>
</body>
</html>
    