package com.ims.service.assigneemaintenance;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

public interface AssigneeMaintenanceService {
	void getAssignee(HttpServletRequest request) throws SQLException;
	void insertNewAssignee(HttpServletRequest request) throws SQLException;
	void getAssigneeForUpdate(HttpServletRequest request) throws SQLException;
}
