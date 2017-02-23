package com.ims.controllers.unitAssignment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.entity.unitAssignment.UnitAssignment;
import com.ims.service.ComputerUnitService;
import com.ims.service.unitAsssignment.UnitAssignmentService;

public class UnitAssignmentController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String page = "";
		
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ims/resource/ApplicationContext.xml");
		ApplicationContext con = new ClassPathXmlApplicationContext("/com/ims/resource/beans.xml");

		context.getBean("unitAssignmentServiceBean");
		ComputerUnitService unitService = (ComputerUnitService) con.getBean("serviceBean");
		
		try {
			/*List<UnitAssignment> arrUnitAss = new ArrayList<>();
			arrUnitAss = assignService.getAssign();
			System.out.println("l: " + arrUnitAss);
			for (UnitAssignment a : assignService.getAssign()) {
				System.out.println(a.getUnitNo());
				System.out.println(a.getAssigneeNo());

			}
			*/
			
			unitService.getUnit(request);
			page="View/UnitAssignment/UnitModalView.jsp";
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

	}

}
