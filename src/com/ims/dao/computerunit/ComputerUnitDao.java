package com.ims.dao.computerunit;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ims.entity.computerunit.ComputerUnitEntity;

public interface ComputerUnitDao {
	void insertNewUnit(Map<String, Object> params) throws SQLException; 
	List<ComputerUnitEntity> getUnit() throws SQLException;
	Integer getNextVal() throws SQLException;
	void updateUnit(Map<String, Object> params) throws SQLException;
	void deleteTagUnit(Integer unitNo) throws SQLException;
	void deleteUnit() throws SQLException;

	
}