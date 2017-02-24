package com.ims.controllers.computerunitinventory;

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

import com.ims.entity.computerunit.ComputerUnitEntity;
import com.ims.service.computerunit.ComputerUnitService;
import com.ims.service.impl.computerunit.ComputerUnitServiceImpl;

public class ComputerUnitController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ComputerUnitServiceImpl cpsi = new ComputerUnitServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String action = request.getParameter("action");
		String page = null;
		HttpSession session = request.getSession();
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/com/ims/resource/computerunit/computerUnitBeans.xml");
		ComputerUnitService service = (ComputerUnitService) context.getBean("serviceBean");
		System.out.println(action);
		try {
			if (action.equals("addUnit")) {
				cpsi.addUnitToSession(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
			} else if (action.equals("saveUnit")) {
				System.out.println("inserted");
				service.insertNewUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
			} else if (action.equals("updateUnit")) {
				service.updateUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
			} else if (action.equals("deleteUnit")) {
				System.out.println("deleted");
				service.deleteUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);*/
	}

	@SuppressWarnings("unused")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
		HttpSession session = request.getSession();
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/com/ims/resource/computerunit/computerUnitBeans.xml");
		ComputerUnitService service = (ComputerUnitService) context.getBean("serviceBean");
		System.out.println(action);
		try {

			if (action.equals("loaded")) {
				service.getUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
				
			} else if (action.equals("cancelUnit")) {
				@SuppressWarnings("unchecked")
				List<ComputerUnitEntity> compUnitList = (List<ComputerUnitEntity>) session.getAttribute("compUnitList");
				if (compUnitList != null) {
					compUnitList.clear();
					System.out.println("units cleared");
				}
				session.removeAttribute("compUnitList");
				session.invalidate();
				service.getUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
				
			} else if (action.equals("deleteTagUnit")) {
				
				service.deleteTagUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
				
			} else if (action.equals("addUnit")) {
				
				cpsi.addUnitToSession(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
				
			} else if (action.equals("saveUnit")) {
				@SuppressWarnings("unchecked")
				List<ComputerUnitEntity> compUnitList = (List<ComputerUnitEntity>) session.getAttribute("compUnitList");
				/*if(compUnitList == null){
					service.deleteUnit(request);
					service.getUnit(request);
				} else if(compUnitList != null){*/
				
				if(compUnitList != null){
					service.insertNewUnit(request);
					compUnitList.clear();		
				}
				/*else {
					service.deleteUnit(request);
					service.insertNewUnit(request);
					service.getUnit(request);
				}*/
				service.getUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";	
			} else if (action.equals("updateUnit")) {
				service.updateUnit(request);
				page = "View/ComputerUnitInventory/computerUnitsMain.jsp";
				service.getUnit(request);
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);

	}

}
