package com.ims.service.impl.peripherals;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ims.dao.impl.peripherals.PeripheralsDaoImpl;
import com.ims.entity.peripherals.Peripherals;
import com.ims.entity.peripherals.UnitClass;
import com.ims.service.peripherals.PeripheralsService;

public class PeripheralsServiceImpl implements PeripheralsService{

	private String name;	
	private PeripheralsDaoImpl dao; 
	
	public PeripheralsDaoImpl getDao() {
		return dao;
	}

	public void setDao(PeripheralsDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public void printline() {
		System.out.println("test");
		
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public void getPer(HttpServletRequest request) throws SQLException {

		List<Peripherals> l = this.getDao().getPer();


			request.setAttribute("list", l); 
	}


	public void getUnit(HttpServletRequest request) throws SQLException {

		List<UnitClass> l = this.getDao().getUnit();
		request.setAttribute("list", l);

	}
}
