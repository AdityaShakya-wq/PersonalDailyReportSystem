package com.internproject.web.dao;

import com.internproject.web.SupLogin;
import java.sql.*;

public class SupLogindao {
	public SupLogin getAccess(String SName,String SPass) {
		SupLogin s=new SupLogin();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from supervisor where Name=\""+SName+"\" AND Password=\""+SPass+"\"");
			if(rs.next()) {
				s.setAcc(1);
				s.setName(rs.getString("Name"));
			}
			
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return s;
		
	}

}
