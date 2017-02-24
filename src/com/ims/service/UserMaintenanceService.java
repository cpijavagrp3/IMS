package com.ims.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface UserMaintenanceService {
	
	void getUsers(HttpServletRequest request) throws SQLException;
	void insertNewUser(HttpServletRequest request) throws SQLException;
	void passUserInfo(HttpServletRequest request);
	void updateUser(HttpServletRequest request) throws SQLException;
	void checkUserName(HttpServletRequest request) throws SQLException;
}
