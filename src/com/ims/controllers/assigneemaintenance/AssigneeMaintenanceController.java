package com.ims.controllers.assigneemaintenance;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.service.assigneemaintenance.AssigneeMaintenanceService;

public class AssigneeMaintenanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "View/AssigneeMaintenance/assigneeListing.jsp";
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("/com/ims/resource/ApplicationContext.xml");
		System.out.println("Im in doGet");
		
		AssigneeMaintenanceService service = (AssigneeMaintenanceService) context.getBean("assigneeMaintenanceServiceBean");
		System.out.println("test");
		
		try {
			service.getAssignee(request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(page);
		dispatcher.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("/com/cpi/resource/beans.xml");
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
	}
}
