package com.ims.service.peripherals;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface PeripheralsService {
	void printline() ;

	 void getPer(HttpServletRequest request) throws SQLException ;
		// TODO Auto-generated method stub
	 void getUnit(HttpServletRequest request) throws SQLException ;


		
	
}
