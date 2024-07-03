<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminSessionValidate.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Menu | RMS</title>
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
	width: 500px;
	box-shadow: 0 0 10px gray;
	margin: 50px auto;
	border-radius: 5px;
}

form {
	width: 400px;
	margin: auto;
	padding: 20px;
}

input, select {
	display: block;
	padding: 12px;
	margin: 10px 0;
	border: 2px solid #3de397;
	outline: none;
	font-size: 17px;
	background: transparent;
	color: grey;
	transition: .4s;
	width: 100%;
	border-radius: 5px;
}

select {
	color: gray;
}

input:hover, select:hover {
	box-shadow: 0 0 5px #3d3397;
}

input:focus, select:focus {
	border-color: #3d3397;
}


form button {
	display: block;
	padding: 12px;
	margin: 15px 0;
	border: 2px solid #3d3397;
	outline: none;
	font-size: 17px;
	background: transparent;
	color: white;
	background: #3d3397;
	border-radius: 5px;
	transition: .4s;
	width: 100%;
	cursor: pointer;
}

form button:hover {
	background: #3de3d7;
	border-color: #3de3d7;
}

@media screen and (max-width: 600px) {
	form {
		width: 300px;
	}
	.container {
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

		<div class="form">
			<form action="AdminMenuUpdate" method="POST">
				<c:forEach items="${ mUpdateList}" var="m">
				
				<input type="text" readonly="readonly" name="itemId" value="${m.productId }">
				<input type="text" name="itemName" required placeholder="Item Name" value="${m.productName }"/>
				<input type="text" name="price" required placeholder="Price" value="${m.price }"/>
				<select name="category" required="required">

					<option value="${m.category }" selected="selected">${m.category }</option>
					<option value="veg">Veg</option>
					<option value="non-veg">Non-Veg</option>
					<option value="starter">Starters</option>
					<option value="dessert">Desserts</option>
					<option value="drink">Drinks</option>
				</select>

				<button type="submit">Submit</button>
			</c:forEach>
			
			</form>
			
			
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
