package com.ims.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ims.dao.impl.UserMaintenanceDaoImpl;
import com.ims.entity.Users;
import com.ims.service.UserMaintenanceService;

public class UserMaintenanceServiceImpl implements UserMaintenanceService{
	
	private UserMaintenanceDaoImpl dao;
	
	public UserMaintenanceDaoImpl getDao() {
		return dao;
	}
	public void setDao(UserMaintenanceDaoImpl dao) {
		this.dao = dao;
	}
	
	@Override
	public void insertNewUser(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String middleInitial = request.getParameter("middleInitial");
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		String userAccess = request.getParameter("userAccess");
		String entryDate = request.getParameter("entryDate");
		String remarks = request.getParameter("remarks");
		String lastUpdatedBy = request.getParameter("lastUpdatedBy");
		String lastUpdate = request.getParameter("lastUpdate");
		
		Map<String, Object> params = new HashMap<>();
			params.put("userId", userId);
			params.put("password", password);
			params.put("firstName", firstName);
			params.put("lastName", lastName);
			params.put("middleInitial", middleInitial);
			params.put("email", email);
			params.put("status", status);
			params.put("userAccess", userAccess);
			params.put("entryDate", entryDate);
			params.put("remarks", remarks);
			params.put("lastUpdatedBy", lastUpdatedBy);
			params.put("lastUpdate", lastUpdate);
			
		this.getDao().insertNewUser(params);
	}
	
	@Override
	public void getUsers(HttpServletRequest request) throws SQLException {
		List<Users> usersList = this.getDao().getUsers();
		request.setAttribute("userList", usersList);
	}
	@Override
	public void passUserInfo(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String middleInitial = request.getParameter("middleInitial");
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		String userAccess = request.getParameter("userAccess");
		String entryDate = request.getParameter("entryDate");
		String remarks = request.getParameter("remarks");
		String lastUpdatedBy = request.getParameter("lastUpdatedBy");
		String lastUpdate = request.getParameter("lastUpdate");
		
		request.setAttribute("userId", userId);
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("middleInitial", middleInitial);
		request.setAttribute("email", email);
		request.setAttribute("status", status);
		request.setAttribute("userAccess", userAccess);
		request.setAttribute("entryDate", entryDate);
		request.setAttribute("remarks", remarks);
		request.setAttribute("lastUpdatedBy", lastUpdatedBy);
		request.setAttribute("lastUpdate", lastUpdate);
	}
	@Override
	public void updateUser(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String middleInitial = request.getParameter("middleInitial");
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		String userAccess = request.getParameter("userAccess");
		String entryDate = request.getParameter("entryDate");
		String remarks = request.getParameter("remarks");
		String lastUpdatedBy = request.getParameter("lastUpdatedBy");
		String lastUpdate = request.getParameter("lastUpdate");
		
		Map<String, Object> params = new HashMap<>();
			params.put("userId", userId);
			params.put("firstName", firstName);
			params.put("lastName", lastName);
			params.put("middleInitial", middleInitial);
			params.put("email", email);
			params.put("status", status);
			params.put("userAccess", userAccess);
			params.put("entryDate", entryDate);
			params.put("remarks", remarks);
			params.put("lastUpdatedBy", lastUpdatedBy);
			params.put("lastUpdate", lastUpdate);
			
		this.getDao().updateUser(params);
	}
	
}
