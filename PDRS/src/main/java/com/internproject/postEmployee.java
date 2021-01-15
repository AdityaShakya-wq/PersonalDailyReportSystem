package com.internproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.internproject.web.DeveloperSubmitmodel;
import com.internproject.web.QASubmitmodel;
import com.internproject.web.postEmployeemodel;
import com.internproject.web.dao.DeveloperSubmitdao;
import com.internproject.web.dao.QASubmitdao;
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
		String EmpRole=request.getParameter("emprole");
		
		
		String Reason=request.getParameter("Reason");
		HttpSession session=request.getSession();
		String reasonby=(String)session.getAttribute("username");
		System.out.println(WorkToday);
		if(WorkToday.equals("No")) {
			postEmployeedao dao=new postEmployeedao();
			postEmployeemodel p=dao.submitReason(Reason, reasonby);
			RequestDispatcher rd=request.getRequestDispatcher("EmployeeHomePage.jsp");
			rd.forward(request,response);
			
		}
		if(WorkToday.equals("Yes")) {
			if(EmpRole.equals("Developer")) {
				String PNameD=request.getParameter("submittedprojectnameD");
				String TNameD=request.getParameter("submittedtaskname");
				String WorkCompleted=request.getParameter("workcompleted");
				String WorkProgress=request.getParameter("workinprogress");
				int HourSpentD=Integer.parseInt(request.getParameter("hourspentD"));
				String Remarks=request.getParameter("remarks");
				DeveloperSubmitdao dao=new DeveloperSubmitdao();
				DeveloperSubmitmodel d=dao.submitdetails(PNameD, TNameD, WorkCompleted,WorkProgress,HourSpentD, Remarks,reasonby);

				RequestDispatcher rd=request.getRequestDispatcher("EmployeeHomePage.jsp");
				rd.forward(request,response);
			}
			if(EmpRole.equals("QA")) {

				int TicketNo=Integer.parseInt(request.getParameter("ticketnumber"));
				String PNameQ=request.getParameter("submittedprojectnameQ");
		     	String Issue=request.getParameter("issue");
				String Suggestion=request.getParameter("suggestion");
				String PStatus=request.getParameter("status");
				int HourSpentQ=Integer.parseInt(request.getParameter("hoursspentQ"));
				String BugD=request.getParameter("bugdescription");
				QASubmitdao daoq=new QASubmitdao();
				QASubmitmodel q=daoq.submitdetailsQ(TicketNo, PNameQ, Issue, Suggestion, PStatus, HourSpentQ, BugD, reasonby);
				

				RequestDispatcher rd=request.getRequestDispatcher("EmployeeHomePage.jsp");
				rd.forward(request,response);
			}
				
		}
		
	}

}
