package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.internproject.web.postEmployeemodel;
import com.internproject.web.dao.postEmployeedao;

/**
 * Servlet implementation class postEmployee
 */
@WebServlet("/postEmployee")
public class postEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String WorkToday=request.getParameter("WorkToday");
		String Reason=request.getParameter("Reason");
		HttpSession session=request.getSession();
		String reasonby=(String)session.getAttribute("username");
		System.out.println(WorkToday);
		if(WorkToday.equals("No")) {
			postEmployeedao dao=new postEmployeedao();
			postEmployeemodel p=dao.submitReason(Reason, reasonby);
			
		}
		RequestDispatcher rd=request.getRequestDispatcher("EmployeeHomePage.jsp");
		rd.forward(request,response);
		
		
	}

}
