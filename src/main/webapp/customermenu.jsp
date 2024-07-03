<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Menu | RMS</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="logo.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />


<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-image: #fffff7;
	font-family: 'Poppins', sans-serif;
}

.header {
	box-shadow: 0 0 10px gainsboro;
	padding: 10px;
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
	transition: .4s;
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
	background-color: #3de3d7;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	color: white;
	border-radius: 5px;
	outline: none;
	transition-duration: 0.4s;
}

.openbtn:hover {
	background-color: dodgerblue;
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
	background-color: rgba(255, 255, 255, 0.2);
	top: 0;
	left: 0;
	z-index: 1;
	overflow-x: hidden;
	transition: margin-left, margin-right, 0.6s;
	padding-top: 20px;
	box-shadow: 0 0 10px gray;
	backdrop-filter: blur(10px);
}

.sidebar a {
	padding: 10px 10px 10px 40px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block;
	text-align: left;
	margin: auto;
	transition: 0.3s;
	font-weight: 500;
}

.sidebar a:hover {
	color: gray;
}

.sidebar .closebtn {
	top: 0;
	font-size: 25px;
	margin-left: 200px;
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
	transition-duration: .4s;
}

#logout:hover {
	color: red;
}

.container {
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 0 5px gainsboro;
}

.scroll {
	overflow-y: scroll;
	height: 410px;
	margin-left: auto;
	margin-right: auto;
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
	width: 500px;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	padding: 13px;
	font-size: 18px;
	border: 1px solid #ccc;
}


#add {
	
	text-decoration: none;
	color: white;
	background: dodgerblue;
	transition: .4s;
	border-radius: 5px;
	padding: 5px;
}

#add:hover {
	background: #3de397;
}

#add:active {
	background: red;
}


tr:nth-child(odd) {
	background: #f1f9f9;
}

tr:hover {
	background: #f1f9f9;
}


.cart_view {
	display:flex;
	width: 500px;
	margin-top: 15px;
	justify-content: space-between;
	padding: 10px;
	background: wheat;
	border-radius: 5px;
}

.cart1 p {
	padding: 10px;
}


.cart2 button {
	padding: 10px;
	color: white;
	outline: none;
	border: none;
	background: #3de397;
	transition: .4s;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.cart2 button:hover {
	background: dodgerblue;
}





@media screen and (max-width:600px) {
	
	table {
		width: 300px;
	}

	.cart_view {
		width: 300px;
	}

	.cart1 {
	}
	
	.cart2 {
		width: 60px;
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
				<i class="fa fa-user"></i>&nbsp;&nbsp;${customername }
			</p>
		</nav>
	</div>

	<div class="sidebar" id="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i
			class="fa fa-close"></i></a> <a href="customer.jsp"><i
			class="fa fa-home"></i>&nbsp;&nbsp;Home</a> <a href="javasript::void(0)"><i
			class="fa fa-info"></i>&nbsp;&nbsp;About us</a> <a
			href="javasript::void(0)"><i class="fa fa-phone"></i>&nbsp;&nbsp;Contact
			us</a>
		<hr />

		<a href="javascript:void(0)">My Id: ${customerId}</a> <a
			href="CustomerViewDetails">My Profile</a>

		<hr>

		<a href="CustomerViewOrders">My Orders</a>
		<a href="CustomerViewCartItems">Cart (${cartItems })</a>

		<hr />
		<a href="/RMS/customerLogout" id="logout">Logout</a>
	</div>


	<div class="container">


		<div class="scroll">

			<table>

				<tr>
					<th>Item</th>
					<th>Price</th>
					<th>Cart</th>
				</tr>

				<c:forEach items="${customermenu }" var="menu">
					
					<tr>
						
						<td>${menu.productName }</td>
						<td>${menu.price }</td>
						<td><a href="CustomerAddItem?item=${menu.productId }" id="add">add</a></td>
					</tr>
					
				</c:forEach>

			</table>

		</div>
		
		<div class="cart_hr"></div>
		
		<c:choose>
		
			<c:when test="${customerCartItems == 1}">
				
				<div class="cart_view">
		
					<div class="cart1">
						<p>Total ${customerCartItems } item added</p>
					</div>
			
					<div class="cart2">
						<form action="CustomerViewCartItems">
							<button type="submit">View</button>
						</form>
					</div>
			
				</div>
			
			</c:when>
			
			<c:when test="${customerCartItems > 1}">
				
				<div class="cart_view">
		
					<div class="cart1">
						<p>Total ${customerCartItems } items added</p>
					</div>
			
					<div class="cart2">
						<form action="CustomerViewCartItems">
							<button type="submit">View</button>
						</form>
					</div>
			
				</div>
			
			</c:when>
			
			<c:otherwise></c:otherwise>
			
		</c:choose>
		
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