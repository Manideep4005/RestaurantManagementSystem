<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Redirecting...</title>
	<link rel="icon" type="image/png" href="C:/Users/Manideep/Desktop/restuarant.png">


<style type="text/css">
	h1 {
		color : red;
		text-align : center;
	}

	p{
		font-size: 20px;
		color: green;
		text-align: center;
		text-decoration: underline;

	}


	
	
	
	.upperd{
			/*position: relative;*/
			/*position: sticky;*/
			background-color: green;
			height: 350px;
			width: 350px;
			border-radius: 10px;
			display: flex;
			flex-direction: column;
			top: 18vh;
			justify-content: center;
			padding: 10px 40px 20px 0;
			align-items: center;
			box-shadow:  10px 10px yellow;
			/*margin-left: 38%;*/
			margin: 0 auto;
			text-align: justify;
		}

		.box {
			color: royalblue;
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			/*box-sizing: border-box;*/
			border-radius: 10.5px;
			/*border: 3px solid #ccc;
			border-radius: 4px;
			border-style: outset;
			border-color: grey;*/
			border-bottom-color: #B6B3B2;
			border-left-color: #B6B3B2;
			border-color: #B6B3B2;
		}

		#button {
			width: 120%;
			border-style: none;
			color: white;
			/*background: #00f;*/
			background-color: blue;
			padding: 12px 20px;
			margin: 8px 0;
		/*	box-sizing: ;*/
			font-size: 20px;
			border-radius: 10.5px;
			cursor: pointer;
			transition-duration: 0.4s;
		}

		#button:hover {
			background-color: gold;
		}
</style>
</head>
<body>
	<h1>Your are successfully registered! </h1>
	<p>Login As Admin</p>
	
	<div class="upperd">
			<form class="form" method="post" action="/RMS/adminLogin">
				<table cellpadding="5px" cellspacing="5px">
					<tr>
						<td><input type="text" name="username" class="box" required placeholder="Enter your username"></td>
					</tr>
					<tr>
						<td>
							<input type="password" name="password" class="box" required placeholder="Enter your password">
						</td>
					</tr>

					<tr>
						<td><input type="submit" name="" id="button" value="Log in"></td>
					</tr>

				</table>
			</form>
	</div>
</body>
</html>