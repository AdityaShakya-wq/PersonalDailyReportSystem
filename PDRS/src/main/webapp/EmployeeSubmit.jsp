<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
<head>
	<title>Employee Form</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<link rel="stylesheet" type="text/css" href="css/EmpForm.css">
			
	<meta charset="ISO-8859-1">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
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
	<div class="container">
		<div class="row">
			<!-- <div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12"> -->

			<form class="form-inline">
			<%
						Date date=new Date();
						java.sql.Date sqldate=new java.sql.Date(date.getTime());
						try{
							Class.forName("com.mysql.jdbc.Driver");
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
							Statement st=con.createStatement();
							ResultSet rs=st.executeQuery("Select * from taskdetails where EmpName=\""+session.getAttribute("username")+"\" and AssignedDate=\""+sqldate+"\"");
							while(rs.next()){
							%>
			
				
				<div class="px-4 mx-4">
					<h2>Report Today's Work</h2>
					
				<div class="form-group mt-3">
					<label for="Date">Date:</label>
					<input type="date" id="today" class="form-control" style="margin-left:20.5vh;" disabled></input>
				</div>
				<div class="form-group">
					<label for="Role">Role</label>
					<input type="text" value="<%=rs.getString("Role")%>" name="emprole" id="givenrole" class="form-control" style="margin-left:21vh;" disabled>
					
				</div>
				<div class="form-group">
					<label for="WorkingToday">Working Today</label>
					<select id="WorkingToday" class="form-control" style="margin-left:10.5vh;" onchange="yesnoCheck(this)">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
					</select>
					<div id="LeaveReason" style="display: none;margin-left: 5vh;margin-bottom: 1vh">
						<label for="No">Reason:</label>
						<input type="text" id="No" name="Reason" size="30" class="form-control"></input>
					</div>
				</div>
					<div class="form-group float-right" id="AddARow">
					<button type="button" class="btn btn-outline-primary" value="Add New Row" id="newrows">Add+</button>
					</div>
					
					
				<div class="form-group" id="DeveloperTable" style="display: block;">
					<table border="2" class="table-form">
						<thead>
							<tr>
							<th>Project</th>
							<th>Task Assigned</th>
							<th>Work Completed</th>
							<th>Work In Progress</th>
							<th>Hours Spent</th>
							<th>Remarks/Issues to be addressed</th>
						</tr>
						</thead>
						<tbody id="developertbody">
						<tr>
							<td><input type="text" value="<%=rs.getString("ProjectName")%>" name="submittedprojectname" disabled></td>
							<td><input type="text" value="<%=rs.getString("Task")%>" name="submittedtaskname" disabled></td>
							<td>
								<select id="WorkCompleted" class="table-control" onchange="yesnoCheck1(this)">
									<option value="-">-</option>
									<option value="Yes2">Yes</option>
									<option value="No2">No</option>
								</select>
							</td>
							<td><input type="text" id="WIP" name="workinprogress" disabled></td>
							<td><input id="HS" type="Number" min=0 class="table-control" name="hourspent"></td>
							<td><input type="text" class="table-control" name="description"></td>
								
						</tr>
						</tbody>
						<%}
						}
						catch(Exception e){
							System.out.println(e);
						}
						%>

							
						
					</table>
				</div>
				<div class="form-group" id="QATable" style="display:none;">
					<table border="2" class="table-form">
						<thead>
							<tr>
							<th>TicketNo.</th>
							<th>Project</th>
							<th>Issue Identified</th>
							<th>Probable Suggestion</th>
							<th>Status</th>
							<th>Hours Spent</th>
							<th>Description</th>
						</tr>
						</thead>
						<tbody id="qatbody">
						<tr>
							<td><input id="TN" type="Number" min=0 class="table-control"></td>
							<td>Auto</td>

							<td><input id="II" type="text" class="table-control" name=""></td>
							<td><input id="PS" type="text" class="table-control" name="">
							</td>
							<td>
								<select id="Status" class="table-control" onchange="statusSelect(this)">
									<option value="-">-</option>
									<option value="Open">Open</option>
									<option value="Close">Close</option>
								</select>
							</td>
							<td><input id="HS" type="Number" min=0 class="table-control"></td>
							<td><input type="text" class="table-control" size=30 name=""></td>
								
						</tr>
						</tbody>

							
						
					</table>
				</div>
				<div class="form-group float-right">
					<button type="submit" class="btn btn-success" id="sub" disabled>Submit</button>
					
				</div>
				
				
				</div>
				

			</form>

			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

		<!-- 	<div class="col-md-5">
					<img src="images/3.png" class="img">
				</div>

		 -->
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script>
		$(document).ready(function(){
  		$('[data-toggle="popover"]').popover();   
		});

		let today = new Date().toISOString().substr(0, 10);
		document.querySelector("#today").value = today;

		window.onload=function(){
		if($("#givenrole").val()=="Developer"){
			document.getElementById("DeveloperTable").style.display="block";
			document.getElementById("QATable").style.display="none";

		}
		else if($("#givenrole").val()=="QA"){
			document.getElementById("DeveloperTable").style.display="none";
			document.getElementById("QATable").style.display="block";	
		}	
	};

		

		function statusSelect(that){
			if(that.value=="Open" || that.value=="Close"){
				$("#sub").prop('disabled',false);
			}
			else{
				$("#sub").prop('disabled',true);
			}
		}
		
		function yesnoCheck(that){
				if(that.value=="No"){
				document.getElementById("LeaveReason").style.display="flex";
				document.getElementById("DeveloperTable").style.display="none";
				document.getElementById("QATable").style.display="none";
				document.getElementById("AddARow").style.display="none";
				$("#sub").prop('disabled',false);
				}
			else{
				document.getElementById("LeaveReason").style.display="none";
				if(document.getElementById("givenrole").value=="Developer"){
					document.getElementById("DeveloperTable").style.display="block";
					document.getElementById("QATable").style.display="none";
				}
				else if(document.getElementById("givenrole").value=="QA"){
					document.getElementById("DeveloperTable").style.display="none";
					document.getElementById("QATable").style.display="block";
				}
				document.getElementById("AddARow").style.display="block";
				$("#sub").prop('disabled',true);

				
			}
		}


		function yesnoCheck1(that){
			
			if(that.value=="Yes2"){
				document.getElementById("WIP").innerHTML="";
				document.getElementById("WIP").value="Completed";
				$("#WIP").prop('disabled',true);
				$("#sub").prop('disabled',false);
				

				
			}
			else if(that.value=="No2"){
				document.getElementById("WIP").innerHTML="";
				document.getElementById("WIP").value="";


				$("#WIP").prop('disabled',false);
				$("#sub").prop('disabled',false);
			}
			else{
				document.getElementById("WIP").innerHTML="";
				document.getElementById("WIP").value="";

				$("#WIP").prop('disabled',true);
				$("#sub").prop('disabled',true);
			}
		}


		$(document).ready(function(){
			var counter=0;

			$("#newrows").click(function(){
				if(counter<2){
					var addcontrols="<tr>"
					addcontrols+="<td>MISC</td>"
					addcontrols+="<td>-</td>"						
										
					addcontrols+="<td>Support for</td>"
					addcontrols+="<td><input type='text' class='table-control'></input></td>"
					addcontrols+="<td>-</td>"						
					addcontrols+="<td>-</td>"	
					addcontrols+="</tr>";
					$("#developertbody").append(addcontrols);
					counter++;
					}
					else{
    					document.getElementById("id").disabled=true;
						}
				

			});

		});	
		$(document).ready(function(){
			var counter=0;

			$("#newrows").click(function(){
				if(counter<2){
					var addcontrols="<tr>"
					addcontrols+="<td>MISC</td>"
					addcontrols+="<td>-</td>"						
					addcontrols+="<td>-</td>"						
										
					addcontrols+="<td>Support for</td>"
					addcontrols+="<td><input type='text' class='table-control'></input></td>"
					addcontrols+="<td>-</td>"						
					addcontrols+="<td>-</td>"	
					addcontrols+="</tr>";
					$("#qatbody").append(addcontrols);
					counter++;
					}
					else{
    					document.getElementById("id").disabled=true;
						}
				

			});

		});			
				
		

		
		</script>
		}



</body>
</html>



					

