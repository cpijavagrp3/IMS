package com.ims.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.service.UserMaintenanceService;

public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext contextUserMaintenance = new ClassPathXmlApplicationContext("/com/ims/resource/userMaintenanceBeans.xml");
		UserMaintenanceService service = (UserMaintenanceService) contextUserMaintenance.getBean("serviceBean");
		
		String page = "";
		String action = request.getParameter("action");
		
		try {
			if(action.equals("login")) {
				
				String user = request.getParameter("userName");
				String pass = request.getParameter("pass");
				
				if(user.equals("CPI") && pass.equals("123")) {
					page = "View/HomeView.jsp";
				}		
			} else if (action.equals("assignment")) {
				page = "View/UnitAssignment/UnitAssignmentView.jsp";
			} else if (action.equals("assignee")){
				page = "View/AssigneeMaintenance/assigneeListing.jsp";
			} else if (action.equals("maintenance")){
				service.getUsers(request);
				page = "View/UserMaintenance/userMaintenance.jsp";
			}else
				page = "View/test.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			page = "View/ExceptionView.jsp";
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
	}

}
