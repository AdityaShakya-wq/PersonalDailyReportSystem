<%@page import="com.internproject.web.EmpLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee HomePage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {
		RequestDispatcher rd = request.getRequestDispatcher("EmployeeLogin.jsp");
		rd.forward(request, response);
	}
	%>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="EmployeeHomePage.jsp">Home</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-labelled="Toggle Navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">

					</ul>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">${username}</a>
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


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 mt-4 d-flex justify-content-center">
				<div class="content card-deck" style="width: 110vh">

					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">Report
							Today's Task</h3>
						<img class="card-img-top" src="images/Assign.png"
							style="width: 80%; margin-left: 6vh; margin-top: 2.5vh">
						<div class="card-body">
							<a href="AssignATask.html" class="btn btn-success"
								style="width: 45%; margin-top: 0.5vh">Enter</a>
						</div>
					</div>
					<div class="card text-center">
						<h3 class="card-header d-flex justify-content-center">Daily
							Log View</h3>
						<img class="card-img-top" src="images/View.png"
							style="width: 65%; margin-left: 10vh; margin-top: 4vh">
						<div class="card-body">
							<a href="DailyLogReview.html" class="btn btn-success"
								style="width: 45%; margin-top: 6vh">View</a>
						</div>
					</div>
				</div>
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






</body>





</html>
</html>
