package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("EoS"));

		if (session.getAttribute("EoS") == "E") {
			session.removeAttribute("username");
			session.removeAttribute("EoS");
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("EmployeeLogin.jsp");
			rd.forward(request, response);
		}else {
			session.removeAttribute("username");
			session.removeAttribute("EoS");
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("SupervisorLogin.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
