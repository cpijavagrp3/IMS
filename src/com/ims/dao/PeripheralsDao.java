package com.ims.dao;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ims.entity.peripherals.Peripherals;
import com.ims.entity.peripherals.UnitClass;



public interface PeripheralsDao {
	void printMessage();
	List<Peripherals> getPer() throws SQLException;
	List<UnitClass> getUnit() throws SQLException;
}
