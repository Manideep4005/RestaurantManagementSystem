<%@page import="java.util.Iterator"%>
<%@page import="com.rms.sales.SalesBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
		ArrayList<SalesBean> sList = (ArrayList<SalesBean>)request.getAttribute("slist");
		Iterator<SalesBean> itr = sList.iterator();
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	body{
		background-image: linear-gradient(to right, #bdc3c7, #2c3e50 ) ;
		
	}

	.detail {
		border-collapse: separate;
		border-spacing: 10px 10px ;
		/*margin-left: 90px	;*/

	}

	.detail th {
	  background-color: #4287f5;
	  color: white;
	  width: 150px;
	  text-align: center;
	  
	  padding: 5px;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.detail td {
	  width: 150px;
	  text-align: center;
	 
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
		background-color: #4287f5;
		border-radius: 1rem;
		color: antiquewhite;
		cursor: pointer;
		transition: 0.4s;
	}

	.customer a:hover {
		text-decoration: none;
		color: white;
		background-color: transparent;
		box-shadow: 0px 0px 10px 0px red;
	}
	
	#order {
		color: orange;
		/*text-align: center;*/
		font-size: 18px;
	}

	.order {
		/*padding: 25px;
		background-color: transparent;*/
/*		border: 1px solid red;*/
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
		  outline: none;
		  /*border-color: red;*/
	}
	
	input[type=text]:focus {
		 border: 2px solid #4287f5;
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
		transition: 0.4s;
		}

	input[type=submit]:hover {
		background-color: #04AA;
	}
	
	#dform{
		float: right;
		margin-top: 150px;
		
		margin-right: 120px;
		border: 3px solid transparent;
    box-shadow: 0px 0px 20px 0px gainsboro;
		padding: 10px;
		border-radius: 15px;
	}
	
	
	.tdiv {
		float:left;
		margin-left: 90px;
	}
</style>


</head>
<body>
	
	<span><a href="adminmodule.jsp">Home</a> ::</span>
	<span><a href="/RMS/adminLogout"> Log out </a>::</span>
	<span><a href="adminabout.html">About us</a></span>
	<span class="customer"><a href="/RMS/displaycustomer">customer details</a></span>
	<p id="info">DETAILS OF SALES</p>

	<div class="tdiv">
		<table class="detail">
		
		<tr>
			<th>Customer ID</th><th>Order Date</th><th>Product ID</th>
		</tr>
		<%
		while (itr.hasNext()){
			SalesBean sBean = itr.next();
			
			out.println("<tr>");
			out.println("<td>" + sBean.getCustomerid() +"</td>");
			out.println("<td>" + sBean.getOrderDate() +"</td>");
			out.println("<td>" + sBean.getProductid() +"</td>");
			out.println("</tr>");
		}
		%>
	</table>
	</div>

	
		<div class="order">
		<form id="dform" method="post" action="adminsalesdetailview.jsp">

			
				<p id="order" align="center">customer order details</p>
			<table>
				<tr>
					<td ><input type="text" name="id" required placeholder="Enter customer id"></td>
					<!-- <td class="select">
						<input type="text" name="date" required placeholder="Date (yyyy-mm-dd)"></td> -->
					
					
				</tr>
				<tr><td align="center"><input type="submit" name="" value="view" style="font-size: 15px; width: 50px;" ></td></tr>
			</table>
			
		</form>
	</div>
</body>
