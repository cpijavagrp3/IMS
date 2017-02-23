package com.ims.dao.impl.peripherals;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ims.dao.PeripheralsDao;
import com.ims.entity.peripherals.Peripherals;
import com.ims.entity.peripherals.UnitClass;

public class PeripheralsDaoImpl implements PeripheralsDao {
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void printMessage() {
		// TODO Auto-generated method stub

	}



	@Override
	public List<Peripherals> getPer() throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMapClient().queryForList("getPer");
	}


	public List<UnitClass> getUnit() throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMapClient().queryForList("getUnit");
	}

}
