<%@page import="java.util.Iterator"%>
<%@page import="com.rms.menuadmin.AdminMenuBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    	ArrayList<AdminMenuBean> aList = (ArrayList<AdminMenuBean>)request.getAttribute("alist");
    	Iterator<AdminMenuBean> itr = aList.iterator();
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	body{
		background-image: linear-gradient(to right, #bdc3c7, #2c3e50 );
		
	}

	.detail {
		
		border-spacing: 10px 10px ;
		

	}

	.detail th {
	  background-color: #4287f5;
	  color: white;
	  width: 150px;
	  text-align: center;
	  /*border: 1px solid black;*/
	  padding: 5px;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.detail td {
	  width: 150px;
	  text-align: center;
	  /*border: 1px solid black;*/	
	  padding: 5px;
	  background-color: /*42cbf5*/#f2eded;
	  color: forestgreen;
	  font-size: 18px;
	   border-radius: 5px;
	}

	.detail td:hover {
		background-color: #0db9db;
		border-color: blue;
		color: black;
	}

	span {
		font-size: 18px;
		color: mediumorchid;
	}

	span a {
		/*float: right;*/
		color: crimson;
		font-size: 18px;
		text-decoration: none;
	}

	span a:hover {
		color: /*brown*/#87cf0c;
		text-decoration: underline;
		text-decoration-color: /*limegreen*/#35f50a;
	}

	

	#info {
		text-align: center;
		color: orange;
		font-size: 22px;
		font-family:'Copperplate Gothic';
	}
	
	.customer a{
		float: right;
		border: 1px solid transparent;
		padding: 8px;
		background-color: transparent;
		box-shadow: 1px 1px 1px 1px grey;
		border-radius: 1rem;
		color: antiquewhite;
		cursor: pointer;
		transition: 0.4s;
	}

	.customer a:hover {
		text-decoration: none;
		color: crimson;
		background-color: ;
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

	input[type=text] {
		 width: 100%;
		  padding: 10px 10px;
		  margin: 8px auto;
		  /*display: table;*/
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;
		  outline: none;
	}
	
	input[type=text]:focus {
		 border: 2px solid orange;
	}

	
	.first {
		
			height: 200px;
			width: 150px;
			border-radius: 10px;
			/*display: flex;*/
			justify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			box-shadow: 0 5px 5px 3px rebeccapurple;
			/*margin: 50px auto;*/
			background-color: transparent;

			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-right: 10px;
	}

	.second {
		
			height: 150px;
			width: 150px;
			border-radius: 10px;
			/*display: flex;*/
			justify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			box-shadow: 0 5px 5px 3px rebeccapurple;
			/*margin: 50px auto;*/
			background-color: transparent;

			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-left: 10px;
	}
	.menu {
		margin-left: 90px;
			justify-content: center;
			
			align-items: center;
			text-align: center;
			
			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			
	}
	
	
	.parent {
		/*border: 1px solid black;*/
		
			/*display: flex;*/
			justify-content: center;
			/*padding: 10px;*/
			align-items: center;
			text-align: center;
			
			display: inline-block;
			/*border: 1px solid red;*/
			padding: 1rem 1rem;
			vertical-align: middle;
			margin-top: 70px;
			float: right;
			margin-right: 50px;
	}

	
	
	.first p{
		margin-top: 2px ;
	}

	.third p{
		margin-top: 2px ;
	}
	
	
</style>


</head>
<body>
	
	<span><a href="adminmodule.jsp">Home</a> ::</span>
	<span><a href="/RMS/adminLogout"> Log out </a>::</span>
	<span><a href="adminabout.html">About us</a></span>
	<span class="customer"><a href="/RMS/displaycustomer">customer details</a></span>
	<p id="info">ADD ITEMS TO MENU</p>

	<div class="menu">
		<table class="detail">
		<tr>
			<th>Product ID</th><th>Product Name</th><th>Price</th>
		</tr>
		<%
		while (itr.hasNext()){
			AdminMenuBean aBean = itr.next();
			
			out.println("<tr>");
			out.println("<td>" + aBean.getProductId() +"</td>");
			out.println("<td>" + aBean.getProductName() +"</td>");
			out.println("<td>" + aBean.getPrice() +"</td>");
			out.println("</tr>");
		}
		%>
	</table>
	</div>

	<div class="parent">
	 	<div class="first">
		 <form method="post" action="adminAddMenu.jsp">
		<p style="color: orange;">To add product</p>
		  
		<table class="">
			<tr>
			<td><input type="text" name="productname" required placeholder="Enter product Name"></td>
			
		</tr>
		<tr>
			<td><input type="text" name="price"  required placeholder="Enter price"></td>
			
		</tr>
		<tr>
			<td><input type="submit" name="" value="Add"></td>
		</tr>
		</table>
	</form>
	
	</div>
	<div class="second">
		<form method="post" action="adminDeleteMenu.jsp">
		<p style="color: orange;">Delete product</p>
		<table class="">
			<tr>
			<td><input type="text" name="delete"  required placeholder="Enter product id"></td>
			
		</tr>
		<tr>
			<td><input type="submit" name="" value="Delete"></td>
		</tr>
		</table>
	</form>
	
	</div>
</div>
	
</body>
</html>