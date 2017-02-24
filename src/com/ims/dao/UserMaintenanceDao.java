package com.ims.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ims.entity.Users;


public interface UserMaintenanceDao {
	List<Users> getUsers() throws SQLException;
	void insertNewUser(Map<String, Object> params) throws SQLException;
	void updateUser(Map<String, Object> params) throws SQLException;
	String checkUserName(String userId) throws SQLException;
}
