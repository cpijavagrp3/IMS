package com.ims.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.dao.UserMaintenanceDao;
import com.ims.entity.Users;

public class UserMaintenanceDaoImpl implements UserMaintenanceDao{
	
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Users> getUsers() throws SQLException {
		return this.getSqlMapClient().queryForList("getUsers");
	}
	
	@Override
	public void insertNewUser(Map<String, Object> params) throws SQLException {
		try{
			this.getSqlMapClient().startTransaction();
			this.getSqlMapClient().getCurrentConnection().setAutoCommit(false);
			this.getSqlMapClient().startBatch();
			
			this.getSqlMapClient().insert("insertNewUser", params);
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
