package com.ims.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.computerunit.AddComputerUnit;
import com.ims.dao.Dao;

public class DaoImpl implements Dao {
	private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void insertNewUnit(Map<String, Object> params) throws SQLException {
		this.getSqlMapClient().insert("insertNewUnit", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AddComputerUnit> getUnit() throws SQLException {
		return this.getSqlMapClient().queryForList("getUnit");
	}

	
}
