package com.internproject.web;

public class AssignATaskmodel {
	private String empname;
	private String role;
	private String projectname;
	private String taskname;
	private int deadline;
	private String assignedby;
	public String getAssignedby() {
		return assignedby;
	}
	public void setAssignedby(String assignedby) {
		this.assignedby = assignedby;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	
	
	
	

}
