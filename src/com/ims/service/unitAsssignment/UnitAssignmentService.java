package com.ims.service.unitAsssignment;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.ims.entity.unitAssignment.UnitAssignment;

public interface UnitAssignmentService {

	List<UnitAssignment> getAssign() throws SQLException;
	void addAssign(HttpServletRequest request) throws SQLException;
	void deleteAssign(HttpServletRequest request) throws SQLException;
	void updateAssign(HttpServletRequest request) throws SQLException;
	
}
