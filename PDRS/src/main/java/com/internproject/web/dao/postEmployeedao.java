package com.internproject.web.dao;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.internproject.web.postEmployeemodel;

public class postEmployeedao {
	public postEmployeemodel submitReason(String Reason,String reasonby) {
		postEmployeemodel p=new postEmployeemodel();
		Date date=new Date();
		java.sql.Date sqldate=new java.sql.Date(date.getTime());
		System.out.println(sqldate);
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
			PreparedStatement ps=con.prepareStatement("Insert into notworking(Reason,EmployeeName)values(?,?)");
			ps.setString(1,Reason);
			ps.setString(2,reasonby);
			int x=ps.executeUpdate();
			
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			Statement st=con1.createStatement();
			String sql="update taskdetails set AssignedDate=\""+sqlTommorow+"\" where AssignedDate=\""+sqldate+"\" and EmpName=\""+reasonby+"\"";
			st.executeUpdate(sql);
		}
		catch(Exception e1){
			System.out.println("e1");
			
		}
		return p;
		
	}

}
