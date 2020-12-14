package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.internproject.web.EmpLogin;
import com.internproject.web.dao.EmpLogindao;

/**
 * Servlet implementation class getController
 */
public class getController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String EName=request.getParameter("EmployeeName");
		String EPass=request.getParameter("EmployeePassword");
		
		
		EmpLogindao dao=new EmpLogindao();
		EmpLogin e=dao.getAccess(EName, EPass);
		
		if(e.getAcc()==1) {
			RequestDispatcher rd=request.getRequestDispatcher("EmployeeHomePage.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("EmployeeLogin.jsp");
			rd.forward(request, response);
		}
		
	}
	
	

	

}
