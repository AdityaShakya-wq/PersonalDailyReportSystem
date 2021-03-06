package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.internproject.web.SupLogin;
import com.internproject.web.dao.SupLogindao;

/**
 * Servlet implementation class getSController
 */
public class getSController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SName=request.getParameter("SNAME");
		String SPass=request.getParameter("SPASS");
		
		SupLogindao dao=new SupLogindao();
		SupLogin s=dao.getAccess(SName, SPass);
		
		
		if(s.getAcc()==1) {
			
			HttpSession session=request.getSession();
			session.setAttribute("username", SName);
			session.setAttribute("EoS", "S");
			
			RequestDispatcher rd=request.getRequestDispatcher("SupervisorHomePage.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("SupervisorLogin.jsp");
			rd.forward(request, response);
		}
		
	}

	

}
