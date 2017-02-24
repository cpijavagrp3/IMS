package com.ims.dao.impl.computerunit;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.dao.computerunit.ComputerUnitDao;
import com.ims.entity.computerunit.ComputerUnitEntity;

public class ComputerUnitDaoImpl implements ComputerUnitDao {
	private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void insertNewUnit(Map<String, Object> params) throws SQLException {
		try{
			this.getSqlMapClient().startTransaction();
			this.getSqlMapClient().getCurrentConnection().setAutoCommit(false);
			this.getSqlMapClient().startBatch();
			
			params.put("unitNo", this.getSqlMapClient().queryForObject("getNextVal"));
			this.getSqlMapClient().executeBatch();
			
			this.getSqlMapClient().insert("insertNewUnit", params);
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

	@SuppressWarnings("unchecked")
	@Override
	public List<ComputerUnitEntity> getUnit() throws SQLException {
		return this.getSqlMapClient().queryForList("getUnit");
	}

	@Override
	public Integer getNextVal() throws SQLException {
		return (Integer) this.getSqlMapClient().queryForObject("getNextVal");
	}

	@Override
	public void updateUnit(Map<String, Object> params) throws SQLException {
		this.getSqlMapClient().update("updateUnit", params);
	}

	@Override
	public void deleteTagUnit(Integer unitNo) throws SQLException {
		this.getSqlMapClient().update("deleteTagUnit", unitNo);		
	}

	@Override
	public void deleteUnit() throws SQLException {
		this.getSqlMapClient().delete("deleteUnit");
		
	}


}
