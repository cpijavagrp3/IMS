package com.ims.dao.impl.unitAssignment;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.dao.unitAssignment.UnitAssignmentDAO;
import com.ims.entity.unitAssignment.UnitAssignment;

public class UnitAssignmentDAOImpl implements UnitAssignmentDAO {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UnitAssignment> getAssign() throws SQLException {
		return this.getSqlMapClient().queryForList("getAssign");
	}

	@Override
	public void addAssign(Map<String, Object> params) throws SQLException {
		this.sqlMapClient.update("addAssign", params);
	}

	@Override
	public void delAssign(Map<String, Object> params) throws SQLException {
		this.sqlMapClient.update("deleteAssign", params);
	}

	@Override
	public void updateAssign(Map<String, Object> params) throws SQLException {
		this.sqlMapClient.update("updateAssign", params);
	}

}
