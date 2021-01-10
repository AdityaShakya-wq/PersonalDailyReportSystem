package com.internproject.web.dao;

import java.sql.*;

import javax.servlet.http.HttpSession;

import com.internproject.web.postEmployeemodel;

public class postEmployeedao {
	public postEmployeemodel submitReason(String Reason,String reasonby) {
		postEmployeemodel p=new postEmployeemodel();
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
		return p;
		
	}

}
