<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>

<style>
	body {font-family: 'Roboto Slab', serif; color: #132A13; background-color: #F2EDDB}

	* {
		box-sizing: border-box;
	}

	input[type=text], input [type=password] {
		width: 100%;
		padding: 15px;
		margin: 5px 0 15px 0;
		display: inline-block;
		border: none;
		background: #E4DAB6;
	}

	input[type=password], input [type=password] {
		width: 100%;
		padding: 15px;
		margin: 5px 0 15px 0;
		display: inline-block;
		border: none;
		background: #E4DAB6;
	}

	input[type=text]:focus, input[type=password]:focus {
		background-color: #E4DAB6;
		outline: none;
	}

	input[type=password]:focus, input[type=password]:focus {
		background-color: #E4DAB6;
		outline: none;
	}

	hr {
		border: 1px solid #f1f1f1;
		margin-bottom: 15px;
	}

	.login-btn {
		background-color: #31572C;
		color: white;
		padding: 10px 20px;
		margin: 40px 0;
		border: none;
		cursor: pointer;
		width: 100%;
		font-size: 140%;
	}

	.login-btn:hover {
		opacity: 1;
	}

	.formPadding {
		padding-top: 50px;
	}

	.inputField {
		padding-right: 15px;
		width: 100%;
	}

	.center {
		text-align: center;

	}
</style>

<body>

<div class="row glyphicon-align-left">
	<div class="col-sm"></div>
	<div class="col-sm">
		<c:url var="formAction" value="/login" />
		<form class="formPadding" method="POST" action="${formAction}">
			<h3 style="font-family: 'Calistoga', cursive;" class="center"> Welcome Back! Please Log In </h3>
		<input type="hidden" name="destination" value="${param.destination}"/>
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<div class="container">
				<div class="container">

			<div class="form-group">
				<div class="inputField">
				<label for="userName">Username: </label>
				<input type="text" id="userName" name="userName" placeHolder="Username" class="form-control" />
			</div>
			</div>

			<div class="form-group">
				<div class="inputField">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			</div>
			<button type="submit" class="btn btn-block login-btn">Login</button>
			</div>
			</div>
		</form>
	</div>
	<div class="col-sm"></div>
</div>
</body>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />