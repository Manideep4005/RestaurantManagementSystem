<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminSessionValidate.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Portal | RMS</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" type="image/png" href="logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #fffff7;
	font-family: 'Poppins', sans-serif;
}

.header {
	box-shadow: 0 0 10px gray;
	padding: 10px;
	background: #fffff7;
}

h1 {
	font-size: 18px;
	color: #4e9c79;
}

#navs {
	margin: 10px 10px;
	font-size: 18px;
}

#navs a {
	text-decoration: none;
	color: dodgerblue;
	margin-top: 10px;
	transition: 0.4s;
}

#navs a:hover {
	color: #3de397;
}

.error {
	color: red;
	padding: 10px;
	background: #fa9b9b;
	border: 1px solid red;
	width: 900px;
	margin: 10px auto;
}

.openbtn {
	display: inline-block;
	font-size: 20px;
	background-color: dodgerblue;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	color: white;
	border-radius: 5px;
	outline: none;
	transition-duration: 0.4s;
}

.openbtn:hover {
	background-color: rgb(6, 116, 226);
	color: white;
}

.username {
	float: right;
	font-size: 18px;
	padding: 8px 15px;
}

.fa-user {
	font-size: 25px;
}

.sidebar {
        height: 100%;
        width: 0;
        position: fixed; 
        background-color: rgba(255, 255, 255, 0.5);
        top: 0;
        left: 0;
        z-index: 10;
        overflow-x: hidden;
        transition: margin-left, margin-right, 0.6s;
        padding-top: 20px;
        box-shadow: 0 0 10px gray;
        backdrop-filter: blur(10px);
      }

      .sidebar a {
      	padding: 10px;
        text-decoration: none;
        font-size: 18px;
        color: black;
        display: block;
        text-align: left;
        margin-left: 40px;
        transition: 0.3s;
        font-weight: 500;
      }

      .sidebar a:hover {
        color: gray;
      }

      .sidebar .closebtn {
        top: 0;
        font-size: 25px;
        margin-left: 250px;
        right: 10px;
        left: 0;
        transition-duration: 0.4s;
      }

      .sidebar .closebtn:hover {
        color: red;
      }

      hr {
        width: 200px;
        display: block;
        margin-left: 35px;
        border: 1px solid gray;
        margin: 30px;
      }

      #logout {
      	border: 2px solid red;
      	color: red;
        transition-duration: 0.4s;
        width: 80px;
        text-align: center;
        padding: 10px;
        margin-left:40px;	
      }

      #logout:hover {
        color: white;
        background: red;
      }
	
	  #profile {
	  	border: 2px solid dodgerblue;
      	color: dodgerblue;
        transition-duration: 0.4s;
        width: 120px;
        text-align: center;
        margin-left:40px;
	  }
	  
	  #profile:hover {
        color: white;
        background: dodgerblue;
      }

.container {
	padding: 10px;
	border-radius: 5px;
}

.scroll {
	overflow-y: scroll;
	height: 410px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0 0 10px gray;
	width: 900px;
	border-radius: 5px;
}

.scroll {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.scroll::-webkit-scrollbar {
	display: none;
}

table {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0;
	border-collapse: collapse;
	border-radius: 5px;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -2px;
	position: sticky;
}

td {
	text-align: left;
	padding: 13px;
	font-size: 18px;
	border: 1px solid #ccc;
}

.new-add {
	width: 900px;
	margin: 10px auto;
	padding: 10px 0;
}

.new-add a {
	text-decoration: none;
	border-radius: 5px;
	color: white;
	background: dodgerblue;
	font-size: 17px;
	transition: .4s;
	padding: 12px;
}

.new-add a:hover {
	background: #168aaa;
}

#add {
	text-decoration: none;
	border-radius: 5px;
	padding: 5px;
	color: dodgerblue;
	border: 1px solid dodgerblue;
	transition: .4s;
	background: white;
}

#add:hover {
	color: white;
	background: dodgerblue;
}

@media screen and (max-width: 600px) {
	form {
		width: 300px;
	}
	.header {
		position: sticky;
		top: 0;
	}
	.scroll {
		width: 350px;
	}
	
	.error {
		width: 350px;
	}
	.main {
		grid-template-columns: auto;
	}
	.new-add {
		width: 350px;
	}
}
</style>
</head>
<body>
	<div class="header">
		<nav>
			<button class="openbtn" onclick="openNav()">
				<i class="fa fa-bars"></i>
			</button>

			<p class="username">
				<i class="fa fa-user"></i>&nbsp;&nbsp;${adminName }
			</p>
		</nav>
	</div>

	<div class="sidebar" id="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i
			class="fa fa-close"></i></a> <a href="adminmodule.jsp"><i
			class="fa fa-home"></i>&nbsp;&nbsp;Home</a> <a href="javasript::void(0)"><i
			class="fa fa-info"></i>&nbsp;&nbsp;About us</a> <a
			href="javasript::void(0)"><i class="fa fa-phone"></i>&nbsp;&nbsp;Contact
			us</a>
		<hr />

		<a href="javascript:void(0)">My Id: ${adminId}</a> <a href="AdminDetailsServlet" id="profile">My
			Profile</a>
 <hr/>
	  
	  <a href="/RMS/displaycustomer">Customer</a>
      <a href="AdminNewSalesDisplay"  >Sales</a>
      <a href="/RMS/displaymember">Members</a>
      <a href="/RMS/displayadminmenu" >Menu</a>
      <a href="AdminDisplayInvoice">Invoice</a>
	  
		<hr />
		<a href="/RMS/adminLogout" id="logout">Logout</a>
	</div>

	<div class="container">

		<div class="new-add">

			<a href="adminaddcustomer.jsp">Add Customer</a>
			
			
		</div>
	
		<c:if test="${adminCustomerAddMemeberError != null }">
				<div class="error">${adminCustomerAddMemeberError }</div>
			</c:if>
	
		<div class="scroll">

			


			<table>

				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Contact</th>
					<th>Email</th>
					<th>Address</th>
					<th>Members</th>
				</tr>

				<c:forEach items="${clist }" var="c">

					<tr>

						<td>${c.customerId }</td>
						<td>${c.customerName }</td>
						<td>${c.gender }</td>
						<td>${c.mobileNumber }</td>
						<td>${c.email }</td>
						<td>${c.address }</td>
						<td><a href="AdminAddToMemeberCustomer?cid=${c.customerId }"
							id="add">add</a></td>
					</tr>

				</c:forEach>

			</table>

		</div>
	</div>




	<script>
		function openNav() {
			document.getElementById('sidebar').style.width = '300px';
		}

		function closeNav() {
			document.getElementById('sidebar').style.width = '0';
		}

		document.addEventListener('keydown', function(e) {
			console.log(e.key);

			// check the key is 'Escape'
			if (e.key === 'Escape') {
				document.getElementById('sidebar').style.width = '0';
			}
		});
	</script>
</body>
</html>


<%
session.removeAttribute("adminCustomerAddMemeberError");
%>
