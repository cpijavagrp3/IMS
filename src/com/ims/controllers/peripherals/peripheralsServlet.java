package com.ims.controllers.peripherals;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.entity.peripherals.UnitClass;
import com.ims.service.peripherals.PeripheralsService;

public class peripheralsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("resource")
		ApplicationContext context =   new ClassPathXmlApplicationContext("/com/ims/resource/peripherals/peripheralsBean.xml");
		PeripheralsService service = (PeripheralsService) context.getBean("ServiceBean");
		String page=null;
		try {
			service.getPer(request);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  @SuppressWarnings("unchecked")
		List<UnitClass> l =(List<UnitClass>) request.getAttribute("list");

		  
		  
		service.printline();
		request.setAttribute("per", l);
		page = "View/Peripherals/peripherals.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("resource")
		ApplicationContext context =   new ClassPathXmlApplicationContext("/com/ims/resource/peripherals/peripheralsBean.xml");
		PeripheralsService service = (PeripheralsService) context.getBean("ServiceBean");
		
		String action = request.getParameter("action");
		
		
	}

}
