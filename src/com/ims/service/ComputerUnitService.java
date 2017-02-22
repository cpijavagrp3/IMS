package com.ims.service;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

public interface ComputerUnitService {
	void insertNewUnit(HttpServletRequest request) throws SQLException; 
	void getUnit(HttpServletRequest request) throws SQLException;
	void addUnitToSession(HttpServletRequest request);
}
