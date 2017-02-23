package com.ims.dao.unitAssignment;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import com.ims.entity.unitAssignment.UnitAssignment;

public interface UnitAssignmentDAO {

	List<UnitAssignment> getAssign() throws SQLException;
	void addAssign(Map<String, Object> params) throws SQLException;
	void delAssign(Map<String, Object> params) throws SQLException;
	void updateAssign(Map<String, Object> params) throws SQLException;

}
