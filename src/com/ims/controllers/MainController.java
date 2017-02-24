package com.ims.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.entity.Users;
import com.ims.service.UserMaintenanceService;

public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ims/resource/userMaintenanceBeans.xml");
		UserMaintenanceService service = (UserMaintenanceService) context.getBean("serviceBean");
		String page = "";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		try {
			
			if(action.equals("login")) {
				session.setAttribute("userNameSession", "");
				String user = request.getParameter("userName");
				String pass = request.getParameter("pass");
				service.getUsers(request);
				List<Users> userList = (List<Users>) request.getAttribute("userList");
				for(int i = 0; i < userList.size(); i++) {
					System.out.println(userList.get(i).getUserId() + " " + userList.get(i).getPassword());
					if(user.equals(userList.get(i).getUserId()) && pass.equals(userList.get(i).getPassword())) {
						page = "View/HomeView.jsp";
						session.setAttribute("userNameSession", userList.get(i).getUserId());
					}	
				}
				if(session.getAttribute("userNameSession") =="") {
					page = "View/LoginView.jsp";
				}	
			} else if (action.equals("assignment")) {
				page = "View/UnitAssignment/UnitAssignmentView.jsp";
			} else if (action.equals("assignee")){
				page = "View/AssigneeMaintenance/assigneeListing.jsp";
			} else
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
