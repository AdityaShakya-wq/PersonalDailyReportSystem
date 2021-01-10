<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/global.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>





</head>
<body>
	

	<div class="container">
		<div class="row content">
			<div class="col-md-4 mb-1">
				<img src="images/emp.png" class="img-fluid">
			</div>
			<div class="col-md-6 mb-3">
				<h3 class="signin-text mb-5">Sign In</h3>
				<form class="needs-validation" action="getControl" method="GET"
					novalidate>
					<div class="form-group">

						<label for="exampleUsername">Username</label> <input type="text"
							class="form-control" id="exampleUsername"
							aria-describedby="UsernameHelp" placeholder="Enter Username"
							required="required" autocomplete="off" name="EmployeeName"></input>

						<div class="invalid-feedback">Please enter your username.</div>
					</div>
					<div class="form-group">

						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" name="EmployeePassword" required>

						<div class="invalid-feedback">Please enter your password to
							continue</div>

					</div>
					<div class="form-check">


						<input type="checkbox" class="form-check-input" id="remember-me">
						<label class="form-check-label" for="exampleCheck1"
							style="color: black !important">Remember me</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
		<script>
			(function() {
				// Self-executing function
				'use strict';
				//The purpose of "use strict" is to indicate that the code should be executed in "strict mode". With strict mode, you can not, for example, use undeclared variables.
				window
						.addEventListener(
								'load',
								function() {
									// Fetch all the forms we want to apply custom Bootstrap validation styles to
									var forms = document
											.getElementsByClassName('needs-validation');

									// Loop over them and prevent submission	
									var validation = Array.prototype.filter
											.call(
													forms,
													function(form) {
														// The JavaScript array prototype constructor is used to allow to add new methods and properties to the Array() object
														// The filter() method creates an array filled with all array elements that pass a test (provided as a function).
														// Note: filter() does not execute the function for array elements without values.
														// Note: filter() does not change the original array.
														//filter() calls a provided callback function once for each element in an array, and constructs a new array of all the values for which callback returns a value that coerces to true 

														form
																.addEventListener(
																		'submit',
																		function(
																				event) {
																			if (form
																					.checkValidity() === false) {
																				event
																						.preventDefault();
																				event
																						.stopPropagation();
																			}
																			// preventDefault() method stops the default action of an element from happening. For example: Prevent a submit button from submitting a form. Prevent a link from following the URL.
																			// The event. stopPropagation() method stops the bubbling of an event to parent elements, preventing any parent event handlers from being executed
																			form.classList
																					.add('was-validated'); //adds the specified class 
																		},
																		false);
													});

								}, false);
			})();
		</script>
		>
	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>


