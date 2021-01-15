package com.internproject.web.dao;

import java.util.Calendar;
import java.util.Date;
import java.sql.*;

import com.internproject.web.DeveloperSubmitmodel;
import com.internproject.web.QASubmitmodel;

public class QASubmitdao {
	public QASubmitmodel submitdetailsQ(int tn,String pname,String issue,String suggestion,String status,int hourspent,String description,String subby) {
		QASubmitmodel q=new QASubmitmodel();
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
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			PreparedStatement ps=con.prepareStatement("Insert into qasubmit(TicketNumber,ProjectName,Issue,Suggestion,Status,HourSpent,Description,SubmittedBy,SubmittedDate)values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, tn);
			ps.setString(2, pname);
			ps.setString(3, issue);
			ps.setString(4, suggestion);
			ps.setString(5, status);
			ps.setInt(6, hourspent);
			ps.setString(7, description);
			ps.setString(8, subby);
			ps.setDate(9, sqldate);
			
			ps.executeUpdate();
			
			if(status.equals("Open")) {

				Statement st=con.createStatement();
				String sqld="Delete from taskdetails where EmpName=\""+subby+"\" and AssignedDate=\""+sqldate+"\" and Role=\"QA\"";
				st.executeUpdate(sqld);	
			}
			if(status.equals("Close")) {
				Statement st1=con.createStatement();
				String sqlu="update taskdetails set AssignedDate=\""+sqlTommorow+"\" where AssignedDate=\""+sqldate+"\" and EmpName=\""+subby+"\" and Role=\"QA\"";
				st1.executeUpdate(sqlu);
			}
			
			
		}
		catch(Exception eq) {
			System.out.println(eq);
		}
		return q;
		
	}

}
