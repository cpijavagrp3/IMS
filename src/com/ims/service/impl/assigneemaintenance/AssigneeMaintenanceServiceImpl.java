package com.ims.service.impl.assigneemaintenance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ims.dao.impl.assigneemaintenance.AssigneeMaintenanceDaoImpl;
import com.ims.entity.assigneemaintenance.Assignee;
import com.ims.service.assigneemaintenance.AssigneeMaintenanceService;

public class AssigneeMaintenanceServiceImpl implements AssigneeMaintenanceService {
	private AssigneeMaintenanceDaoImpl dao;
	
	public AssigneeMaintenanceDaoImpl getDao() {
		return dao;
	}
	
	public void setDao(AssigneeMaintenanceDaoImpl dao) {
		this.dao = dao;
	}
	
	@Override
	public void getAssignee(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		List<Assignee> assigneeList = this.getDao().getAssignee();
		
		for(Assignee e : assigneeList){
			System.out.println(e.getAssigneeNumber());
			System.out.println(e.getAssigneeName());
			System.out.println(e.getDepartment());
			System.out.println(e.getLocation());
			System.out.println(e.getEmail());
			System.out.println(e.getActiveTag());
			System.out.println(e.getEntryDate());
			System.out.println(e.getRemarks());
			System.out.println(e.getUserId());
			System.out.println(e.getLastUpdate());
		}
		request.setAttribute("assigneeList", assigneeList);
	}

	@Override
	public void insertNewAssignee(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		String assigneeName = request.getParameter("assigneeName");
		String department = request.getParameter("department");
		String location = request.getParameter("location");
		String email = request.getParameter("email");
		String activeTag =	request.getParameter("activeTag");
		String remarks = request.getParameter("remarks");
		
		Map<String, Object> params = new HashMap<>();
		params.put("assigneeName", assigneeName);
		params.put("department", department);
		params.put("location", location);
		params.put("email", email);
		params.put("activeTag", activeTag);
		params.put("remarks", remarks);
		
		this.getDao().insertNewAssignee(params);
	}

	@Override
	public void getAssigneeForUpdate(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		Integer assigneeNumber = Integer.parseInt(request.getParameter("assigneeNumber"));
		List<Assignee> assigneeList = this.getDao().getAssigneeforUpdate(assigneeNumber);
		request.setAttribute("assigneeNumber", assigneeList.get(0).getAssigneeNumber());
		request.setAttribute("assigneeName", assigneeList.get(0).getAssigneeName());
		request.setAttribute("assigneeDepartment", assigneeList.get(0).getDepartment());
		request.setAttribute("assigneeLocation", assigneeList.get(0).getLocation());
		request.setAttribute("assigneeEntryDate", assigneeList.get(0).getEntryDate());
		request.setAttribute("assigneeLastUpdate", assigneeList.get(0).getLastUpdate());
		request.setAttribute("assigneeRemarks", assigneeList.get(0).getRemarks());
		request.setAttribute("assigneeUserId", assigneeList.get(0).getUserId());
		request.setAttribute("assigneeActiveTag", assigneeList.get(0).getActiveTag());
		request.setAttribute("assigneeEmail", assigneeList.get(0).getEmail());
	}

	@Override
	public void updateAssignee(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		String assigneeName = request.getParameter("assigneeName");
		String email = request.getParameter("email");
		String activeTag =	request.getParameter("activeTag");
		String remarks = request.getParameter("remarks");
		Integer assigneeNumber = Integer.parseInt(request.getParameter("assigneeNumber")); 
		
		Map<String, Object> params = new HashMap<>();
		params.put("assigneeName", assigneeName);
		params.put("email", email);
		params.put("activeTag", activeTag);
		params.put("remarks", remarks);
		params.put("assigneeNumber", assigneeNumber);
		this.getDao().updateAssignee(params);
	}
}
