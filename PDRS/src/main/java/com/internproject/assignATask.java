package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.internproject.web.AssignATaskmodel;
import com.internproject.web.dao.AssignATaskdao;

/**
 * Servlet implementation class assignATask
 */
public class assignATask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public assignATask() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String EName=request.getParameter("EName");
		String Role=request.getParameter("Role");
		String PName=request.getParameter("PName");
		String TaskName=request.getParameter("TaskName");
		int Deadline=Integer.parseInt(request.getParameter("Deadline"));
		
		HttpSession session=request.getSession();
		String assignedby=(String)session.getAttribute("username");
		
		
		
		AssignATaskdao dao=new AssignATaskdao();
		AssignATaskmodel a=dao.addtasks(EName, Role, PName, TaskName, Deadline, assignedby);
		
		
		System.out.println(EName+Role+PName+TaskName+Deadline);
		RequestDispatcher rd=request.getRequestDispatcher("AssignATask.jsp");
		rd.forward(request, response);
	}

}
