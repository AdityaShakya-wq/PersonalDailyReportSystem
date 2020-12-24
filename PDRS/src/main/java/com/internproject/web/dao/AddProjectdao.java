package com.internproject.web.dao;

import java.sql.*;
import com.internproject.web.AddProject;

public class AddProjectdao {
	public AddProject add(String Pname) {
		AddProject a = new AddProject();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdrs","root","lifeis12hell");
			PreparedStatement ps=con.prepareStatement("Insert into projects(ProjectName)values(?);");
			ps.setString(1, Pname);
			int x=ps.executeUpdate();
			if(x>0) {
				System.out.println("Done!");
			}
			else {
				System.out.println("Failed");
			}
			
			
			

		} catch (Exception e) {
			System.out.println(e);
		}
		return a;

	}
}
