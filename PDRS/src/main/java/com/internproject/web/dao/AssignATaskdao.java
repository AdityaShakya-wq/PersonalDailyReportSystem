package com.internproject.web.dao;

import java.sql.*;

import com.internproject.web.AssignATaskmodel;

public class AssignATaskdao {
	public AssignATaskmodel getrows() {
		AssignATaskmodel a=new AssignATaskmodel();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedetails","root","lifeis12hell");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select count(*) from employee");
			System.out.println(rs.getInt("count(*)"));
			
			
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
		
		return a;
		
	}

}
