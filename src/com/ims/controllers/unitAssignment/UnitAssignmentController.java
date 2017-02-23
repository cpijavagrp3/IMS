package com.ims.controllers.unitAssignment;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ims.entity.unitAssignment.UnitAssignment;
import com.ims.service.unitAsssignment.UnitAssignmentService;

public class UnitAssignmentController {

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ims/resource/ApplicationContext.xml");

		UnitAssignmentService assignService = (UnitAssignmentService) context.getBean("unitAssignmentService");
		try {
			List<UnitAssignment> arrUnitAss = new ArrayList<>();
			arrUnitAss = assignService.getAssign();
			System.out.println("l: " + arrUnitAss);
			for (UnitAssignment a : assignService.getAssign()) {
				System.out.println(a.getUnitNo());
				System.out.println(a.getAssigneeNo());

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

	}

}
