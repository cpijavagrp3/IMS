package com.ims.controllers.assigneemaintenance;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.entity.assigneemaintenance.Assignee;
import com.ims.service.assigneemaintenance.AssigneeMaintenanceService;

public class AssigneeMaintenanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page=null;
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("/com/ims/resource/ApplicationContext.xml");
		String action = "onLoad";
		//String action=request.getParameter("action");
		if(action.equals("onLoad")) {
			page = "View/AssigneeMaintenance/assigneeListing.jsp";
			System.out.println("Im in onLoad");
			AssigneeMaintenanceService service = (AssigneeMaintenanceService) 
					context.getBean("assigneeMaintenanceServiceBean");
			try {
				service.getAssignee(request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		List<Assignee> l = (List<Assignee>) request.getAttribute("assigneeList");
		for(int i = 0; i < l.size();i++) {
			System.out.println(l.get(i).getAssigneeName() + "test");
		}
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(page);
		dispatcher.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page=null;
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("/com/ims/resource/ApplicationContext.xml");
		String action = request.getParameter("action");
		AssigneeMaintenanceService service = (AssigneeMaintenanceService) 
				context.getBean("assigneeMaintenanceServiceBean");
		
		if(action.equals("addAssignee")) {
			page = "View/AssigneeMaintenance/assigneeMaintenance.jsp";	
			request.setAttribute("maintainAction", "add");
		} else if(action.equals("backToAssigneeListing")) {
			page = "View/AssigneeMaintenance/assigneeListing.jsp";	
			request.setAttribute("backToAssigneeListing", true);
		} else if(action.equals("insert")) {
			try {
				service.insertNewAssignee(request);
				page = "View/AssigneeMaintenance/assigneeListing.jsp";
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		/*SpringService service = (SpringService) context.getBean("serviceBean");
		if(action.equals("insert")) {
			try {
				service.insertNewEmp(request);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else if(action.equals("delete")) {
			try {
				service.deleteNewEmp(request);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else if(action.equals("update")) {
			try {
				service.updateEmp(request);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}*/
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(page);
		dispatcher.forward(request, response);	
	}
}
