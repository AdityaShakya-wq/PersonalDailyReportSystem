<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Supervisor HomePage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {
		RequestDispatcher rd = request.getRequestDispatcher("SupervisorLogin.jsp");
		rd.forward(request, response);
	}
	%>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="SupervisorHomePage.jsp">Home</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-labelled="Toggle Navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a href="#" class="nav-link">About
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a href="ProjectDetail.html"
							class="nav-link">ProjectDetail<span class="sr-only">(current)</span></a>
						</li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">${username} </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Account Details</a>
								<div class="dropdown-divider"></div>
								<form action="Logout">
									<button type="submit" class="dropdown-item">Logout</button>
								</form>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>


	<div class="modal fade" id="AssignTaskModal" tabindex="-1"
		aria-labelledby="EnterProjectLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ProjectDetailLabel">Assign A Task</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="myForm" method="POST" action="assignATask" class="needs-validation" novalidate>
						<div class="form-group">
							<label for="EmployeeName">Enter Employee Name</label> <select
								class="form-control" id="EmployeeName" name="EName"
								aria-describedby="PNHelp">
								<%
									try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs", "root", "lifeis12hell");
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery("Select * from employee");
									while (rs.next()) {
								%>
								<option value="<%=rs.getString("Name")%>">
									<%=rs.getString("Name")%>
								</option>
								<%
									}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="EmployeeRole">Select Role</label> <select
								class="form-control" id="EmployeeRole" name="Role"
								aria-describedby="PNHelp" onchange="roleCheck(this)">
								<option value="Developer">Developer</option>
								<option value="QA">QA</option>
							</select>

						</div>
						<div class="form-group">
							<label for="ProjectSelect">Select Project</label> <SELECT
								class="form-control" id="ProjectSelect" name="PName"
								aria-describedby="PSHelp">
								<%
									try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs", "root", "lifeis12hell");
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery("Select * from projects");
									while (rs.next()) {
								%>
								<option value="<%=rs.getString("ProjectName")%>">
									<%=rs.getString("ProjectName")%>
								</option>
								<%
									}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</SELECT>

						</div>
						<div class="form-group" id="EnterTask">
							<label for="Task">Enter Tasks</label>
							<textarea class="form-control" id="EnterTaskbox" name="TaskName"
								aria-describedby="PNHelp" placeholder="Enter Tasks." required></textarea>
								<div class="invalid-feedback">Please enter the task.</div>
						</div>
						<div class="form-group">
							<label for="Deadline">Set Deadline(Hours)</label> <input
								type="Number" class="form-control" id="Deadline" name="Deadline"
								aria-describedby="PNHelp" min=0 required="required" ></input>
								<div class="invalid-feedback">Please enter a deadline</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" name="input" id="BTN" value="Add Project"
								class="btn btn-success">Assign</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="col-md-4 col-sm-1 col-xl-10">
			<form>
				<button type="button" class="mt-4 btn btn-outline-primary"
					data-toggle="modal" data-target="#AssignTaskModal">
					<i class='fas fa-arrow-circle-right mr-1'></i>Assign A Task
				</button>
			</form>
		</div>

		<div class="col-md-4 col-sm-1 col-xl-10"
			style="display: none; margin-top: 20vh;">
			<table id='show'>
				<thead>
					<tr>
						<td>Project Name</td>
						<td>Assigned To</td>
						<td>Role</td>
						<td>Tasks</td>
						<td>Deadline</td>
					</tr>
				</thead>
			</table>
		</div>

	</div>







	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	(function(){
		// Self-executing function
		 'use strict'; 
		//The purpose of "use strict" is to indicate that the code should be executed in "strict mode". With strict mode, you can not, for example, use undeclared variables.
		window.addEventListener('load',function(){
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms=document.getElementsByClassName('needs-validation');

			// Loop over them and prevent submission	
			 var validation=Array.prototype.filter.call(forms,function(form){	
			 	// The JavaScript array prototype constructor is used to allow to add new methods and properties to the Array() object
			 	// The filter() method creates an array filled with all array elements that pass a test (provided as a function).
				// Note: filter() does not execute the function for array elements without values.
				// Note: filter() does not change the original array.
				//filter() calls a provided callback function once for each element in an array, and constructs a new array of all the values for which callback returns a value that coerces to true 

				form.addEventListener('submit',function(event){
					if(form.checkValidity()===false){
						event.preventDefault();
						event.stopPropagation();
					}
					// preventDefault() method stops the default action of an element from happening. For example: Prevent a submit button from submitting a form. Prevent a link from following the URL.
					// The event. stopPropagation() method stops the bubbling of an event to parent elements, preventing any parent event handlers from being executed
					form.classList.add('was-validated'); //adds the specified class 
				},false);
			});

		},false);
	})();
		function roleCheck(that) {
			if (that.value == "Developer") {
				$("#EnterTaskbox").val("");
				$("#EnterTask").css("display", "block");
				$("#EnterTaskbox").attr("required",true);
			} else {
				$("#EnterTaskbox").val("");
				$("#EnterTask").css("display", "none");
				$("#EnterTaskbox").attr("required",false);
			}
		}
	</script>
</body>
</html>