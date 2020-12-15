package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.internproject.web.AddProject;
import com.internproject.web.dao.AddProjectdao;


public class GetProjectController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Pname=request.getParameter("PNAME");
		
		if(Pname.isBlank()) {
			RequestDispatcher rd=request.getRequestDispatcher("SupervisorHomePage.jsp");
			rd.forward(request, response);
		}
		else {
		
		AddProjectdao dao=new AddProjectdao();
		AddProject a=dao.add(Pname);
		
		RequestDispatcher rd=request.getRequestDispatcher("SupervisorHomePage.jsp");
		rd.forward(request, response);
		}
	}

	
	}

