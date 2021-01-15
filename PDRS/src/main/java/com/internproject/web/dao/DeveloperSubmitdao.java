package com.internproject.web.dao;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;

import com.internproject.web.DeveloperSubmitmodel;

public class DeveloperSubmitdao {
	public DeveloperSubmitmodel submitdetails(String pname,String tname,String workcompleted,String wip,int hourspent,String remarks,String subby) {
		DeveloperSubmitmodel d=new DeveloperSubmitmodel();
		Date date=new Date();
		java.sql.Date sqldate=new java.sql.Date(date.getTime());
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(sqldate); 
		cal.add(Calendar.DATE, 1);
		java.sql.Date sqlTommorow = new java.sql.Date(cal.getTimeInMillis());
		int x1=cal.get(Calendar.DAY_OF_WEEK);
		if(x1==7) {
			cal.add(Calendar.DATE,1);
			sqlTommorow = new java.sql.Date(cal.getTimeInMillis());

		}	
		System.out.println(sqlTommorow);
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
				PreparedStatement ps=con.prepareStatement("Insert into developertaskdetails(ProjectName,Task,WorkCompleted,WorkInProgress,HourSpent,Remarks,SubmittedBy,SubmittedDate)values(?,?,?,?,?,?,?,?)");
				ps.setString(1, pname);
				ps.setString(2, tname);
				ps.setString(3, workcompleted);
				ps.setString(4, wip);
				ps.setInt(5, hourspent);
				ps.setString(6, remarks);
				ps.setString(7, subby);
				ps.setDate(8, sqldate);
				
				ps.executeUpdate();
				
				if(workcompleted.equals("Yes")) {

					Statement st=con.createStatement();
					String sqld="Delete from taskdetails where EmpName=\""+subby+"\" and AssignedDate=\""+sqldate+"\" and Role=\"Developer\"";
					st.executeUpdate(sqld);	
				}
				if(workcompleted.equals("No")) {
					Statement st1=con.createStatement();
					String sqlu="update taskdetails set AssignedDate=\""+sqlTommorow+"\" where AssignedDate=\""+sqldate+"\" and EmpName=\""+subby+"\" and Role=\"Developer\"";
					st1.executeUpdate(sqlu);
				}
				
				
				
				
			}
			catch(Exception ed){
				System.out.println(ed);
				
			}
			
		
		
		
		return d;
	}

}
