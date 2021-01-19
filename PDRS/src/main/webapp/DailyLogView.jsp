<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Supervisor HomePage</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/DLR.css">


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
	
	<div class="container px-4 py-4">
		<div class="row-inline">
			<div class="form-inline mt-4">
				<label for="Role">Role:</label>
				<select id="Role" onchange="roleCheck(this)" class="form-control" style="margin-left: 2vh">
					<option value="Developer">Developer</option>
					<option value="QA">QA</option>
				</select>

			</div>

			<div id="DeveloperTable" class="mt-4" style="display: block;">
			
				<input type="text" id="myInputDP" onkeyup="myFunctionDP()" placeholder="Search by project" title="Type in a name">
				<table border="2" id="myTableD">
					<thead>
						<tr class="header">
							<th>Date</th>
							<th>Project</th>
							<th>Task Assigned</th>
							<th>Work Completed</th>
							<th>Work In Progress</th>
							<th>Hours Spent</th>
							<th>Remarks</th>
						</tr>
					</thead>
					<tbody>
						<%
						try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
						Statement st2=con2.createStatement();
						ResultSet rs2=st2.executeQuery("Select * from developertaskdetails where SubmittedBy=\""+session.getAttribute("username")+"\"");
						while(rs2.next()){
							
						%>
						<tr>
							<td><%=rs2.getDate("SubmittedDate") %></td>
							<td><%=rs2.getString("ProjectName") %></td>
							<td><%=rs2.getString("Task") %></td>
							<td><%=rs2.getString("WorkCompleted") %></td>
							<td><%=rs2.getString("WorkInProgress") %></td>
							<td><%=rs2.getString("HourSpent") %></td>
							<td><%=rs2.getString("Remarks") %></td>
						</tr>
					</tbody>
					<%}
						}catch(Exception e2){
							System.out.println(e2);
						}
					%>
					



				</table>
			</div>
			<div id="QATable" class="mt-4" style="display: none;">
				<input type="text" id="myInputQP" onkeyup="myFunctionQP()" placeholder="Search By Project.." title="Type in a name">
				<input type="text" id="myInputQ" onkeyup="myFunctionQB()" placeholder="Bug Filter" title="Type in a name">

				<table id="myTableQ" border="2">
					<thead>
						<tr class="header">
							<th>Date</th>
							<th>Ticket No.</th>
							<th>Project</th>
							<th>Issues Identified</th>
							<th>Suggestion Provided</th>
							<th>Status</th>
							<th>Hours Spent</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
					<%
						try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
						Statement st3=con3.createStatement();
						ResultSet rs3=st3.executeQuery("Select * from qasubmit where SubmittedBy=\""+session.getAttribute("username")+"\"");
						while(rs3.next()){
						%>
						<tr>
							<td><%=rs3.getDate("SubmittedDate") %></td>
							<td><%=rs3.getInt("TicketNumber") %></td>
							<td><%=rs3.getString("ProjectName") %></td>
							<td><%=rs3.getString("Issue") %></td>
							<td><%=rs3.getString("Suggestion") %></td>
							<td><%=rs3.getString("Status") %></td>
							<td><%=rs3.getString("HourSpent") %></td>
							<td><%=rs3.getString("Description") %></td>
						</tr>

					</tbody>
					<%}
						}catch(Exception e3){
							System.out.println(e3);
						}
					%>



				</table>
			</div>

		</div>	
		</div>









		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			let today = new Date().toISOString().substr(0, 10);
			document.querySelector("#today").value = today;

			function roleCheck(that){
				if(that.value=="Developer"){
					document.getElementById("DeveloperTable").style.display="block";
					document.getElementById("QATable").style.display="none";
				}
				if(that.value=="QA"){
					document.getElementById("DeveloperTable").style.display="none";
					document.getElementById("QATable").style.display="block";	
				}
			}
			

				function myFunctionDP() {
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInputDP");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTableD");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[0];
					if (td) {
						txtValue = td.textContent || td.innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}       
				}
			}
			function myFunctionQB() {
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInputQ");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTableQ");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[2];
					if (td) {
						txtValue = td.textContent || td.innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}       
				}
			}
			function myFunctionQP() {
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInputQP");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTableQ");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[1];
					if (td) {
						txtValue = td.textContent || td.innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}       
				}
			}

		</script>
	</body>
	</html>