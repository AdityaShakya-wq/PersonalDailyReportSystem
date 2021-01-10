package com.internproject.web.dao;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpSession;


import com.internproject.web.AssignATaskmodel;

public class AssignATaskdao {
	public AssignATaskmodel addtasks(String Ename,String Role,String Pname,String Taskname,int Dline,String assignedby) {
		AssignATaskmodel a=new AssignATaskmodel();
		Date date=new Date();
		java.sql.Date sqldate=new java.sql.Date(date.getTime());
		System.out.println(sqldate);
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(sqldate); 
		cal.add(Calendar.DATE, 1);
		java.sql.Date sqlTommorow = new java.sql.Date(cal.getTimeInMillis());
		System.out.println(sqlTommorow);
		
		
		
		
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			PreparedStatement ps=con.prepareStatement("Insert into taskdetails(EmpName,Role,ProjectName,Task,Deadline,AssignedBy,AssignedDate)values(?,?,?,?,?,?,?)");
			ps.setString(1, Ename);
			ps.setString(2, Role);
			ps.setString(3, Pname);
			ps.setString(4, Taskname);
			ps.setInt(5, Dline);
			ps.setString(6, assignedby);
			ps.setDate(7, sqldate);
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
