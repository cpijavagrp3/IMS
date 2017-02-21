package com.ims.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = "";
		String action = request.getParameter("action");
		
		try {
			if(action.equals("login")) {
				
				String user = request.getParameter("userName");
				String pass = request.getParameter("pass");
				
				if(user.equals("CPI") && pass.equals("123")) {
					page = "View/HomeView.jsp";
				}	
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			page = "View/ExceptionView.jsp";
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
	}

}
