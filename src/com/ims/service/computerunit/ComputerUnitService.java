package com.ims.service.computerunit;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

public interface ComputerUnitService {
	void insertNewUnit(HttpServletRequest request) throws SQLException; 
	void getUnit(HttpServletRequest request) throws SQLException;
	void addUnitToSession(HttpServletRequest request);
	void updateUnit(HttpServletRequest request) throws SQLException;
	void deleteTagUnit(HttpServletRequest request) throws SQLException;
	void deleteUnit(HttpServletRequest request) throws SQLException;
	
}
