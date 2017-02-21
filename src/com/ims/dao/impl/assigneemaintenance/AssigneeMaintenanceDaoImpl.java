package com.ims.dao.impl.assigneemaintenance;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.dao.assigneemaintenance.AssigneeMaintenanceDao;
import com.ims.entity.assigneemaintenance.Assignee;

public class AssigneeMaintenanceDaoImpl implements AssigneeMaintenanceDao {
	private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	@Override
	public List<Assignee> getAssignee() throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMapClient().queryForList("getAssignee");
	}
}
