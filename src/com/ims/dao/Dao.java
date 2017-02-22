package com.ims.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ims.computerunit.AddComputerUnit;

public interface Dao {
	void insertNewUnit(Map<String, Object> params) throws SQLException; 
	List<AddComputerUnit> getUnit() throws SQLException;
}

