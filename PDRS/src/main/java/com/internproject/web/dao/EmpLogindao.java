package com.internproject.web.dao;

import java.sql.*;
import com.internproject.web.EmpLogin;

public class EmpLogindao {
	public EmpLogin getAccess(String EName,String EPass) {
		EmpLogin e=new EmpLogin();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedetails","root","lifeis12hell");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select * from employee where Name=\""+EName+"\" AND Password=\""+EPass+"\""); 
			if(rs.next()) {
				e.setAcc(1);
				e.setEname(rs.getString("Name"));
			}
				
			
			
		
		}
		catch(Exception e1) {
			System.out.println(e1);
		}
		return e;
		
		
	}

}
