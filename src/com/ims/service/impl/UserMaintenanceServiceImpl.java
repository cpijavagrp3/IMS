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
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String middleInitial = request.getParameter("middleInitial");
		String status = request.getParameter("status");
		String userAccess = request.getParameter("userAccess");
		String entryDate = request.getParameter("entryDate");

		Map<String, Object> params = new HashMap<>();
			params.put("userId", userId);
			params.put("firstName", firstName);
			params.put("lastName", lastName);
			params.put("middleInitial", middleInitial);
			params.put("status", status);
			params.put("userAccess", userAccess);
			params.put("entryDate", entryDate);
		
		this.getDao().insertNewUser(params);
	}
	
	@Override
	public void getUsers(HttpServletRequest request) throws SQLException {
		List<Users> l = this.getDao().getUsers();
		request.setAttribute("userList", l);
	}
	

}
