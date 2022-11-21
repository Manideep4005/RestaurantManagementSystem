<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rms.members.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	ArrayList<MemberBean> mList = (ArrayList<MemberBean>)request.getAttribute("mlist");
    	Iterator<MemberBean> itr = mList.iterator();
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member details</title>
<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">

<style type="text/css">
	body{
		background-color: #2e2d2d;
		
	}

	.detail {
		border-collapse: separate;
		border-spacing: 10px 10px ;
		margin-right: auto;
		margin-left: auto;
	}

	.detail th {
	  background-color: #4287f5;
	  color: white;
	  width: 150px;
	  text-align: center;
	  border: 1px solid black;
	  padding: 5px;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.detail td {
	  width: 150px;
	  text-align: center;
	  border: 1px solid black;
	  padding: 5px;
	  background-color: /*42cbf5*/#f2eded;
	  color: forestgreen;
	  font-size: 18px;
	  border-radius: 5px;
	}

	.detail td:hover {
		background-color: #0db9db;
		border-color: black;
		color: white;
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

	h1 {
		text-align: center;
		color: deeppink;
	}

	#info {
		text-align: center;
		color: cornflowerblue;
		font-size: 22px;
	}


	.d {
		background-color: #FFFFFF;
			height: 20px;
			width: 300px;
			border-radius: 10px;
			display: flex;
			justify-content: center;
			padding: 10px;
			align-items: center;
			text-align: center;
			box-shadow: 1px 1px 1px 1px transparent;
			margin: 20px auto;
			background-color: transparent;
	}

	

	.d a{
		color: cornflowerblue;
		/*border: 1px solid cornflowerblue;*/
		text-decoration: none;
		font-size: 15px;
	}
	.d a:hover{
		text-decoration: underline;
		text-decoration-color: deeppink;
	}

	.parent {
		/*border: 1px solid black;*/
	  	margin: 0 auto;
  		padding: 1px 1px;
 	 	text-align: center;
 	 	margin-top: 5px;
	}

	.delete {
		height: 150px;
			width: 150px;
			border-radius: 10px;
			
			justify-content: center;
			
			align-items: center;
			text-align: center;
			box-shadow: 0 5px 5px 3px gray;
			
			background-color: transparent;

			display: inline-block;
			
			padding: 1rem 1rem;
			vertical-align: middle;

	}

	input[type=text],input[type=submit] {
		box-sizing: border-box;
	}

	input[type=submit] {
  width: 100%;
  background-color: #04AA6D;
  color: white;
  padding: 10px 10px;
  margin: 8px auto;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: 0.4s;
}

	input[type=submit]:hover {
  background-color: #04AA;
	}

	input[type=text] {
		 width: 100%;
		  padding: 10px 10px;
		  margin: 0px auto;
		  /*display: table;*/
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  box-sizing: border-box;

	}
	
	.customer a{
		float: right;
		border: 1px solid black;
		padding: 8px;
		background-color: #4287f5;
		border-radius: 1rem;
		color: antiquewhite;
		cursor: pointer;
		transition: 0.4s;
	}

	.customer a:hover {
		text-decoration: none;
		color: crimson;
		background-color: #17ee69;
	}

</style>


</head>
<body>
	
	<span><a href="adminmodule.jsp">Home</a> ::</span>
	<span><a href="/RMS/adminLogout"> Log out </a>::</span>
	<span><a href="adminabout.html">About us</a></span>
	<span class="customer"><a href="/RMS/displaycustomer">cusotmer details</a></span>
	<p id="info">Details of the members</p>

	<table class="detail">
		<tr>
			<th>Customer ID</th><th>Join Date</th>
		</tr>
		<%
		while (itr.hasNext()) {
    		MemberBean mBean = itr.next();
    		out.println("<tr>");
    		out.println("<td>" + mBean.getCustomerId() + "</td>");
    		out.println("<td>" + mBean.getJoindate() + "</td>");
    		out.println("</tr>");
    	}
		%>
	</table>
<!--  
	<div class="d">
		<a href="/RMS/displaycustomer"><p>To add customer to the members list. Add from customer view</p></a>
	
	</div>-->

	<div class="parent">
		<div class="delete">
		<form method="post" action="adminDeleteMember.jsp">
		<p style="color: darkorange;">To delete member</p>
		<!-- <label for="delete">Enter the customer id</label> -->
		<table class="">
			<tr>
			<td><input type="text" name="delete" placeholder="Enter customer id"></td>
			
		</tr>
		<tr>
			<td><input type="submit" name="" value="delete"></td>
		</tr>
		</table>
	</form>
	</div>
	</div>
</body>
