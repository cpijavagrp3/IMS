package com.ims.service.impl.unitAssignment;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ims.dao.unitAssignment.UnitAssignmentDAO;
import com.ims.entity.unitAssignment.UnitAssignment;
import com.ims.service.unitAsssignment.UnitAssignmentService;

public class UnitAssignmentServiceImpl implements UnitAssignmentService {

	private UnitAssignmentDAO assignDAO;

	public UnitAssignmentDAO getAssignDAO() {
		return assignDAO;
	}

	public void setAssignDAO(UnitAssignmentDAO assignDAO) {
		this.assignDAO = assignDAO;
	}

	@Override
	public List<UnitAssignment> getAssign() throws SQLException {
		return this.getAssignDAO().getAssign();
	}

	@Override
	public void addAssign(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();

		params.put("unitNo", Integer.parseInt(request.getParameter("unitNo")));
		params.put("assigneeNo", Integer.parseInt(request.getParameter("assigneeNo")));
		params.put("location", request.getParameter("location"));
		params.put("status", request.getParameter("status"));
		params.put("ipAdd", request.getParameter("ipAdd"));
		params.put("assignedBy", request.getParameter("assignedBy"));
		params.put("assignedDate", request.getParameter("assignedDate"));
		params.put("userId", request.getAttribute("userId"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));

		this.getAssignDAO().addAssign(params);
		request.setAttribute("message", "success");

	}

	@Override
	public void deleteAssign(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();

		params.put("unitNo", Integer.parseInt(request.getParameter("unitNo")));
		params.put("assigneeNo", Integer.parseInt(request.getParameter("assigneeNo")));
		params.put("location", request.getParameter("location"));
		params.put("status", request.getParameter("status"));
		params.put("ipAdd", request.getParameter("ipAdd"));
		params.put("assignedBy", request.getParameter("assignedBy"));
		params.put("assignedDate", request.getParameter("assignedDate"));
		params.put("userId", request.getAttribute("userId"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.getAssignDAO().delAssign(params);
		request.setAttribute("message", "success");
	}

	@Override
	public void updateAssign(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();

		params.put("unitNo", Integer.parseInt(request.getParameter("unitNo")));
		params.put("assigneeNo", Integer.parseInt(request.getParameter("assigneeNo")));
		params.put("location", request.getParameter("location"));
		params.put("status", request.getParameter("status"));
		params.put("ipAdd", request.getParameter("ipAdd"));
		params.put("assignedBy", request.getParameter("assignedBy"));
		params.put("assignedDate", request.getParameter("assignedDate"));
		params.put("userId", request.getAttribute("userId"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));

		this.getAssignDAO().updateAssign(params);
		request.setAttribute("message", "success");
	}

}
