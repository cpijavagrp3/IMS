package com.ims.entity.assigneemaintenance;

public class Assignee {

	private Integer assigneeNumber;
	private String assigneeName;
	private String department;
	private String location;
	private String email;
	private String activeTag;
	private String entryDate;
	private String remarks;
	private String userId;
	private String lastUpdate;
	
/*	public Assignee(Integer assigneeNumber, String assigneeName, String department, String location, String email,
			String activeTag, String entryDate, String remarks, String userId, String lastUpdate) {
		this.assigneeNumber = assigneeNumber;
		this.assigneeName = assigneeName;
		this.department = department;
		this.location = location;
		this.email = email;
		this.activeTag = activeTag;
		this.entryDate = entryDate;
		this.remarks = remarks;
		this.userId = userId;
		this.lastUpdate = lastUpdate;
	}*/
	
	public Integer getAssigneeNumber() {
		return assigneeNumber;
	}

	public void setAssigneeNumber(Integer assigneeNumber) {
		this.assigneeNumber = assigneeNumber;
	}

	public String getAssigneeName() {
		return assigneeName;
	}

	public void setAssigneeName(String assigneeName) {
		this.assigneeName = assigneeName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActiveTag() {
		return activeTag;
	}

	public void setActiveTag(String activeTag) {
		this.activeTag = activeTag;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

}
