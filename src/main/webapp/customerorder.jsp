<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="customersessionvalidate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Invoice | RMS</title>
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
	top: 54%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	border-radius: 10px;
}

.scroll {
	overflow-y: scroll;
	height: 250px;
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	background: #f9f9f9;
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
	width: 450px;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	border: 1px solid #ccc;
	border-top-color: transparent;
	border-bottom-color: black;
	border-left-color: transparent;
	border-right-color: transparent;
	background: #f9f9f9;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	padding: 8px;
	font-size: 18px;
}







.heading {
	width: 500px;
	background: orange;
	padding: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px; 
}

.heading p{ 
	color: white;
	text-align: center;
	font-size: 18px;
}


.footer {
	padding: 10px;
	width: 500px;
	background: #ccc;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.footer p {
	text-align: center;
	font-size: 18px;
	
}

.card {
	display: flex;
	padding: 10px;
	justify-content: space-between;
	background: #f9f9f9;
}

.prices {
padding: 10px;
width: 500px;
background: #f9f9f9;
}

.prices p{
	text-align: right;
}

#line {
	border: 1px solid grey;
	width: 100px;
	
	margin: 5px 0;
	margin-left: 380px;
}




@media screen and (max-width:600px) {
	
	table {
		width: 310px;
	}
	
	.scroll {
		width: 320px;
	}	
	
	.prices {
		width: 320px;
	}
	
	.footer {
		width: 320px;
	}
	
	#line {
		margin-left: 200px;
	}
	
	.heading {
		width: 320px;
	}
	
	.container {
		top: 50%;
		
	}
}

.back {
	width: 100px;
	padding: 5px;
	margin: auto;
}

.back a {
	display: block;
	text-align: center;
	text-decoration: none;
	color: #3de397;
	border: 2px solid #3de397;
	transition: .4s;
	padding: 5px;
}


.back a:hover {
color: white;
	background: #3de397;
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
		<a href="customer.jsp">Menu</a>
		

		<hr />
		<a href="/RMS/customerLogout" id="logout">Logout</a>
	</div>


	<div class="container">

		<div class="heading">
			<p>Invoice</p>
		</div>
		
		<div class="card">
		
			<div class="card1">
			
				<p>Invoice To: <b>${customername}</b> <p>
				
			</div>
			<div class="card2">
				<c:forEach items="${customerInvoice }" var="i">
				
					<p> Invoice Id#: <b>${i.invoice_number }</b> </p>
					<p>Order Date: <b>${i.order_date }</b></p>
					<p>Order Id: <b>${i.orderId }</b></p>		
				
				</c:forEach>
			</div>
			
		</div>
		
		
		<div class="table">
				
				<div class="scroll">
					
					<table>
						
						<tr>
						
							<th>Item Name</th>
							<th>Item Price</th>
						</tr>
						
						
						<c:forEach items="${customerInvoiceItems}" var="i">
						
							<tr>
							
								<td>${i.product_name }</td>
								<td>${i.price }</td>
						
							</tr>
						
						</c:forEach>
						
					</table>
				
				</div>
				
			</div>
		
		
		
			<div class="prices">
			
				<c:forEach items="${customerInvoice }" var="i">
				
					<p>Sub Total : <b>${i.subTotal }</b></p>
					<p>Tax : <b>${i.tax }</b>(%)</p>
					<hr id="line" />
					<p>Total : <b>${i.total }</b></p>
			
				</c:forEach>
			
			</div>
		
		<div class="footer">
			<p>Thank You</p>
		</div>
		
		<div class="back">
			<a href="customer.jsp">Back</a>
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