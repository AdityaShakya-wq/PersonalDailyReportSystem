package com.internproject.web.dao;

import java.sql.*;
import javax.servlet.http.HttpSession;


import com.internproject.web.AssignATaskmodel;

public class AssignATaskdao {
	public AssignATaskmodel addtasks(String Ename,String Role,String Pname,String Taskname,int Dline,String assignedby) {
		AssignATaskmodel a=new AssignATaskmodel();
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			PreparedStatement ps=con.prepareStatement("Insert into taskdetails(EmpName,Role,ProjectName,Task,Deadline,AssignedBy)values(?,?,?,?,?,?)");
			ps.setString(1, Ename);
			ps.setString(2, Role);
			ps.setString(3, Pname);
			ps.setString(4, Taskname);
			ps.setInt(5, Dline);
			ps.setString(6, assignedby);
			int x=ps.executeUpdate();
			if(x>0) {
				System.out.println("Done");
			}
			else {
				System.out.println("Failed");
			}
			
			
				
			
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
		
		return a;
		
	}

}
