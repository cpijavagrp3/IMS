package com.ims.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.computerunit.AddComputerUnit;
import com.ims.service.ComputerUnitService;
import com.ims.service.impl.ComputerUnitServiceImpl;

public class ComputerUnitsInventory extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	ComputerUnitServiceImpl cpsi = new ComputerUnitServiceImpl(); 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String page = null;
		HttpSession session = request.getSession();
		@SuppressWarnings("resource")
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("/com/ims/resource/beans.xml");	
		
		ComputerUnitService service = (ComputerUnitService) context.getBean("serviceBean");
	
		if(action.equals("addUnit")){	
		cpsi.addUnitToSession(request);
		page = "View/addComputerUnits.jsp";
		}else if (action.equals("saveUnit")){
			try {
				System.out.println("inserted");
				service.insertNewUnit(request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			page = "View/addComputerUnits.jsp";
		} else if (action.equals("cancelUnit")) {
			@SuppressWarnings("unchecked")
			List<AddComputerUnit> compUnitList = (List<AddComputerUnit>) session.getAttribute("compUnitList");
			if(compUnitList != null) {
				compUnitList.clear();
				System.out.println("units cleared");
			}
			session.removeAttribute("compUnitList");
			session.invalidate();
			page = "View/addComputerUnits.jsp";
		} else if (action.equals("loaded")){
			try {
				service.getUnit(request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			page = "View/addComputerUnits.jsp";
		} else if (action.equals("updateUnit")){
			try {
				service.getUnit(request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			page = "View/updateComputerUnits.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	/*public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
	}*/

}
