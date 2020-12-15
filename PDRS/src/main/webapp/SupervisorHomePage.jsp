<%@page import="com.internproject.web.SupLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Supervisor HomePage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/dycalendar.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
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
							aria-expanded="false">

						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Account Details</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="SupervisorLogin.jsp">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-12 mt-4">
				<div id="Calendar" class="dycalendar-container"></div>
			</div>
			<div class="col-md-8 col-sm-12 mt-4 d-flex justify-content-center">
				<div class="content card-deck" style="width: 110vh">
					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">Enter A
							Project</h3>
						<img class="card-img-top" src="images/Add.png"
							style="width: 80%; margin-left: 6vh; margin-top: 4vh">
						<div class="card-body">
							<a class="btn btn-success" data-toggle="modal"
								data-target="#EnterProjectModal" style="width: 45%">Add</a>

						</div>
					</div>
					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">Assign
							A Task</h3>
						<img class="card-img-top" src="images/Assign.png"
							style="width: 80%; margin-left: 6vh; margin-top: 2.5vh">
						<div class="card-body">
							<a href="AssignATask.html" class="btn btn-success"
								style="width: 45%; margin-top: 0.5vh">Assign</a>
						</div>
					</div>
					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">Daily
							Log Review</h3>
						<img class="card-img-top" src="images/View.png"
							style="width: 65%; margin-left: 7vh; margin-top: 4vh">
						<div class="card-body">
							<a href="DailyLogReview.html" class="btn btn-success"
								style="width: 45%; margin-top: 3vh">View</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-12 mt-4 d-flex justify-content-left">
				<div class="content card-deck">
					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">My Team</h3>
						<div class="card-body"></div>
					</div>
				</div>
			</div>


		</div>
	</div>

	<div class="modal fade" id="EnterProjectModal" tabindex="-1"
		aria-labelledby="EnterProjectLabel" aria-hidden="true"
		style="margin-top: 15vh">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ProjectDetailLabel">Project Detail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form method="POST" action="GetProjectControl" id="projectadd">
						<div class="form-group">
							<label for="PName">Enter Project Name</label> <input type="text"
								class="form-control" id="PName" aria-describedby="PNHelp"
								placeholder="Enter name of the project." name="PNAME" >








						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" name="input" id="BTN" value="Add Project"
								class="btn btn-success" onclick="AddRow()">Add Project</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</div>










		<script type="text/javascript" src="js/dycalendar.min.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<script type="text/javascript">
		
		
			

			dycalendar.draw({
				target : "#Calendar",
				type : "month",
				highlighttoday : true,
				prevnextbutton : "show"
			});
		</script>
</body>





</html>
