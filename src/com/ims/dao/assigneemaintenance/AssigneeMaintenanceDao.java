package com.ims.dao.assigneemaintenance;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ims.entity.assigneemaintenance.Assignee;

public interface AssigneeMaintenanceDao {
	List<Assignee> getAssignee() throws SQLException;
	void insertNewAssignee(Map<String, Object> params) throws SQLException;
}
