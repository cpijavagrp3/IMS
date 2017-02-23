package com.ims.dao.impl.assigneemaintenance;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

	@Override
	public void insertNewAssignee(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.getSqlMapClient().startTransaction();
			this.getSqlMapClient().getCurrentConnection().setAutoCommit(false);
			this.getSqlMapClient().startBatch();
			
			this.getSqlMapClient().insert("insertNewAssignee", params);
			this.getSqlMapClient().executeBatch();
			this.getSqlMapClient().queryForList("incrementAssigneeSeq", params);
			this.getSqlMapClient().executeBatch();
			
			this.getSqlMapClient().getCurrentConnection().commit();
		}catch(SQLException e){
			this.getSqlMapClient().getCurrentConnection().rollback();
			System.out.println("in catch");
			e.printStackTrace();
		}finally{
			this.getSqlMapClient().endTransaction();
		}
		
	}
}
