package com.ims.service.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ims.computerunit.AddComputerUnit;
import com.ims.dao.impl.DaoImpl;
import com.ims.service.ComputerUnitService;

public class ComputerUnitServiceImpl implements ComputerUnitService {
	private DaoImpl dao;

	public DaoImpl getDao() {
		return dao;
	}

	public void setDao(DaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public void insertNewUnit(HttpServletRequest request) throws SQLException { 
		Integer unitNo = Integer.parseInt(request.getParameter("unitNo"));
		String unitName = request.getParameter("unitName");
		System.out.println(unitName);
		String tagNumber = request.getParameter("tagNumber");
		System.out.println(tagNumber);
		String ipAddress = request.getParameter("ipAddress");
		String type = request.getParameter("type");
		String acquiredDate = request.getParameter("acquiredDate");
		String description = request.getParameter("description");
		String serialNo = request.getParameter("serialNo");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String remarks = request.getParameter("remarks");
		String userId = request.getParameter("userId");
		String lastUpdate = getCurrentDate();
		System.out.println(lastUpdate);
		
		Map<String, Object> params = new HashMap<>();
		params.put("unitNo", unitNo);
		params.put("unitName", unitName);
		params.put("tagNumber", tagNumber);
		params.put("ipAddress", ipAddress);
		params.put("type", type);
		params.put("acquiredDate", acquiredDate);
		params.put("description", description);
		params.put("serialNo", serialNo);
		params.put("brand", brand);
		params.put("model", model);
		params.put("color", color);
		params.put("remarks", remarks);
		params.put("userId", userId);
		params.put("lastUpdate", lastUpdate);
		
		this.getDao().insertNewUnit(params);
	}
	
	@Override
	public void addUnitToSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer unitNo = Integer.parseInt(request.getParameter("unitNo"));
		String unitName = request.getParameter("unitName");
		String tagNumber = request.getParameter("tagNumber");
		String ipAddress = request.getParameter("ipAddress");
		String type = request.getParameter("type");
		String acquiredDate = request.getParameter("acquiredDate");
		String description = request.getParameter("description");
		String serialNo = request.getParameter("serialNo");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String remarks = request.getParameter("remarks");
		String userId = request.getParameter("userId");
		String lastUpdate = getCurrentDate();
		
		@SuppressWarnings("unchecked")
		List<AddComputerUnit> compUnitList = (List<AddComputerUnit>) session.getAttribute("compUnitList");
		if (compUnitList == null) {
			compUnitList = new ArrayList<>();
		}

		AddComputerUnit a = new AddComputerUnit();
		a.setUnitNo(unitNo);
		a.setUnitName(unitName);
		a.setTagNumber(tagNumber);
		a.setIpAddress(ipAddress);
		a.setType(type);
		a.setAcquiredDate(acquiredDate);
		a.setDescription(description);
		a.setSerialNo(serialNo);
		a.setBrand(brand);
		a.setModel(model);
		a.setColor(color);
		a.setRemarks(remarks);
		a.setUserId(userId);
		a.setLastUpdate(lastUpdate);
		
		compUnitList.add(a);
		
		
		session.setAttribute("compUnitList", compUnitList);
		
		for (AddComputerUnit adu : compUnitList) {
			System.out.println(adu.getUnitNo() + " " + adu.getUnitName() +  " " + adu.getTagNumber() + " " 
							  + adu.getIpAddress() + " " + adu.getType() + " " + adu.getAcquiredDate() + " " 
							  + adu.getDescription() + " " + adu.getSerialNo() + " " + adu.getBrand() + " " 
							  + adu.getModel() + " " + adu.getColor() + " " + adu.getRemarks() + " " 
							  + adu.getUserId() + " " + adu.getLastUpdate());
		}
	}
	
	
	public String getCurrentDate() {
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MMM-dd");
		return sdf.format(date);
	}

	@Override
	public void getUnit(HttpServletRequest request) throws SQLException {
		List<AddComputerUnit> dbRecordlist = this.getDao().getUnit();
		request.setAttribute("dbRecords", dbRecordlist);
	}

}
