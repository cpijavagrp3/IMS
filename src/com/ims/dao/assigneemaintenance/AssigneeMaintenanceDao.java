package com.ims.dao.assigneemaintenance;

import java.sql.SQLException;
import java.util.List;

import com.ims.entity.assigneemaintenance.Assignee;

public interface AssigneeMaintenanceDao {
	List<Assignee> getAssignee() throws SQLException;
}
