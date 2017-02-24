package com.ims.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.service.UserMaintenanceService;

public class UserMaintenanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ims/resource/userMaintenanceBeans.xml");
		UserMaintenanceService service = (UserMaintenanceService) context.getBean("serviceBean");
		
		
		String action = request.getParameter("action");
		String page = null;
		
		try {
			if(action.equals("loadPage")){
				service.getUsers(request);
				page = "View/userMaintenance.jsp";
			}else if(action.equals("addUserPage")){
				page = "View/userMaintenanceAdd.jsp";
			}else if(action.equals("backToUserMaintenance")){
				service.getUsers(request);
				page = "View/userMaintenance.jsp";
			}else if(action.equals("search")){
				page = "View/userMaintenance.jsp";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ims/resource/userMaintenanceBeans.xml");
		UserMaintenanceService service = (UserMaintenanceService) context.getBean("serviceBean");
		
		String action = request.getParameter("action");
		String page = null;
		
		try {
			if(action.equals("addUser")){
				service.insertNewUser(request);
				service.getUsers(request);
				page = "View/userMaintenance.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
