<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminSessionValidate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>My Profile | RMS</title>
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
	background-image: #fffff7;
	font-family: 'Poppins', sans-serif;
}

.header {
	box-shadow: 0 0 10px 1px grey;
	padding: 10px;
	position: sticky;
	top: 0;
	position: -webkit-sticky;
	background-color: white;
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

.main {
	width: 500px;
	margin: 20px auto;
	border-radius: 5px;
	box-shadow: 0 0 10px lightsteelblue;
	/* background: lightsteelblue; */
	/* border: 1px solid lightslategray; */
}

form {
	/* width: 500px; */
	margin: auto;
	padding: 30px;
}

.head1 p, .head2 p, .head3 p {
	font-size: 25px;
}

.head {
	padding: 20px;
}

label {
	font-size: 20px;
	display: block;
	margin: 20px 0 5px 0;
}

#customerId {
	cursor: not-allowed;
	background: #f9f9f9;
}

input, select, textarea {
	display: block;
	/* margin: 0 20px; */
	width: 100%;
	font-size: 18px;
	padding: 12px;
	outline: none;
	border: 2px solid #8ac4be;
	border-radius: 5px;
	transition-duration: 0.4s;
}

input:hover, textarea:hover, select:hover {
	box-shadow: 0 0 10px 1px #3de397;
	border-color: transparent;
}

input:focus, textarea:focus, select:focus {
	border-color: aqua;
}

textarea {
	resize: none;
}

select {
	background: white;
}

#reset {
	margin: 10px 20px;
	display: block;
	text-decoration: none;
	border: 2px solid dodgerblue;
	color: dodgerblue;
	font-size: 18px;
	width: 160px;
	text-align: center;
	padding: 12px;
	border-radius: 5px;
	transition: 0.4s;
}

#reset:hover {
	background-color: dodgerblue;
	color: white;
}

#line {
	width: 450px;
	margin: 30px 0;
	border: none;
	height: 1px;
	background-color: gray;
}

.save {
	margin: auto;
	padding: 10px;
	display: flex;
	justify-content: flex-end;
}

.save button {
	font-size: 18px;
	padding: 12px 20px;
	outline: none;
	border: 2px solid #3de397;
	color: white;
	transition-duration: 0.4s;
	cursor: pointer;
	background: #3de3d7;
	border-radius: 5px;
	width: 50%;
}

.save button:hover {
	background: #3de397;
	border-color: #3de397;
}

.close-btn {
	display: flex;
	justify-content: flex-end;
}

.close-modal {
	font-size: 25px;
	transition-duration: 0.4s;
	background: white;
	border: none;
	color: red;
	cursor: pointer;
}

/* -------------------------- */
/* CLASSES TO MAKE MODAL WORK */
.hidden {
	display: none;
}

.modal {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	background-color: white;
	padding: 25px;
	border-radius: 5px;
	box-shadow: 0 3rem 5rem rgba(0, 0, 0, 0.3);
	z-index: 10;
	transition-duration: .4s;
}

.overlay {
	transition-duration: .4s;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(3px);
	z-index: 5;
}

.stopScroll {
	overflow: hidden;
}

.form {
	padding: 20px;
}

.form input {
	margin: 12px 0;
}

.form button {
	margin: 12px 0;
	width: 100%;
	border: none;
	outline: none;
	transition: .4s;
	color: white;
	background: #3de3d7;
	font-size: 17px;
	padding: 12px;
	border-radius: 5px;
	cursor: pointer;
}

.form button:hover {
	background: #3de397;
}

#msg {
	color: red;
	padding: 0 10px;
}

@media screen and (max-width: 600px) {
	.main {
		width: 350px;
	}
	#line {
		width: 300px;
	}
	table {
		width: 300px;
	}
	.modal {
		width: 320px;
	}
	.head1 p, .head2 p, .head3 p {
		font-size: 20px;
	}
	label {
		font-size: 18px;
	}
	input, textarea, select {
		font-size: 17px;
	}
	.overlay {
		height: 120%;
	}
}

h2 {
	font-size: 17px;
	color: green;
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

		<a href="javascript:void(0)">My Id: ${adminId}</a> <a
			href="AdminDetailsServlet" id="profile">My Profile</a>
 <hr/>
	  
	  <a href="/RMS/displaycustomer">Customer</a>
      <a href="AdminNewSalesDisplay"  >Sales</a>
      <a href="/RMS/displaymember">Members</a>
      <a href="/RMS/displayadminmenu" >Menu</a>
      <a href="AdminDisplayInvoice">Invoice</a>
	  
		<hr />
		<a href="/RMS/adminLogout" id="logout">Logout</a>
	</div>

	<div class="main">



		<form action="AdminUpdateProfile" method="post">

			<c:forEach items="${aList }" var="a">

				<div class="head1">
					<p>Personal Information</p>

					<div class="head">
						<label for="">Admin Id</label> <input type="text"
							value="${a.adminId }" readonly id="customerId" /> <label for="">Full
							Name</label> <input type="text" value="${a.adminName }" required
							placeholder="Full Name" name="adminName" />
					</div>
				</div>
				<hr id="line" />
				<div class="head2">
					<p>Contact Information</p>

					<div class="head">
						<label for="">Email</label> <input type="email"
							placeholder="Email" value="${a.email }" required name="email" />

						<label for="">Contact Number</label> <input type="text"
							inputmode="numeric" name="mobile" pattern="[0-9]{10}"
							title="Enter Moible Number" maxlength="10"
							placeholder="Contact Number" required value="${a.contact }"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />

						<label for="">Address</label>
						<textarea rows="4" placeholder="Address" cols="2" name="address"
							required>${a.address }</textarea>
					</div>
				</div>

				<hr id="line" />
				<div class="head3">
					<p>Additional Information</p>



					<div class="head">

						<h2>${adminPasswordChange}</h2>

						<label for="">Password Change</label><a href="#" id="reset"
							class="show-modal">Reset Password</a>
					</div>
				</div>

				<div class="head4">
					<div class="head">
						<div class="save">
							<button type="submit">Update</button>
						</div>
					</div>
				</div>

			</c:forEach>
		</form>
	</div>


	<div class="modal hidden">
		<div class="close-btn">
			<button class="close-modal">
				<i class="fa fa-close"></i>
			</button>
		</div>
		<h1>Reset Password</h1>

		<div class="reset">
			<form class="form" method="post" action="AdminChangePassword">
				<input type="password" required id="pass"
					placeholder="Enter Password" onkeyup="validatePassword()">
				<input type="password" required id="repass"
					placeholder="Re-enter Password" name="password"
					onkeyup="validatePassword()">
				<P id="msg"></P>
				<button type="submit">Reset</button>
			</form>
		</div>

	</div>
	<div class="overlay hidden"></div>

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

		var sidebar = document.getElementById('sidebar');

		window.onclick = function(event) {
			if (event.taget == sidebar) {
				sidebar.style.width = '0';
			}
		}

		const modal = document.querySelector('.modal');
		const overlay = document.querySelector('.overlay');
		const btn = document.querySelector('.close-modal');
		const btnCloseModal = document.querySelector('.close-modal');
		const btnsOpenModal = document.querySelectorAll('.show-modal');
		const w = document.getElementsByTagName("BODY")[0];

		const openModal = function() {
			modal.classList.remove('hidden');
			overlay.classList.remove('hidden');
			w.classList.add('stopScroll');
		};

		for (let i = 0; i < btnsOpenModal.length; i++)
			btnsOpenModal[i].addEventListener('click', openModal);

		const closeModal = function() {
			modal.classList.add('hidden');
			overlay.classList.add('hidden');
			w.classList.remove('stopScroll');

		};

		btnCloseModal.addEventListener('click', closeModal); // close modal by clicking close button
		overlay.addEventListener('click', closeModal); // close modal by clicking outside area

		document.addEventListener('keydown', function(e) {
			console.log(e.key);

			// check the key is 'Escape'
			if (e.key === 'Escape' && !modal.classList.contains('hidden')) {
				closeModal();
			}
		});

		function validatePassword() {
			var pass = document.getElementById('pass').value;
			var repass = document.getElementById('repass').value;
			var isValid = false;

			if (pass.length < 1 || repass.length < 1) {

				document.getElementById('msg').innerHTML = '';
				isValid = false;
			} else if (pass.length <= 7 && repass.length <= 7) {
				document.getElementById('msg').innerHTML = 'Password must be 8 characters';
				document.getElementById('msg').style.color = 'red';
				isValid = false;
			}

			else if (pass.length != repass.length) {
				document.getElementById('msg').innerHTML = 'Password doesn\'t match';
				document.getElementById('msg').style.color = 'red';
				isValid = false;
			}

			else if (pass != repass) {
				document.getElementById('msg').innerHTML = 'Password doesn\'t match';
				document.getElementById('msg').style.color = 'red';
				isValid = false;
			} else {
				document.getElementById('msg').innerHTML = 'Password matched';
				document.getElementById('msg').style.color = 'darkgreen';
				isValid = true;
			}

			return isValid;

		}
	</script>
</body>
</html>
<%
session.removeAttribute("adminPasswordChange");
%>