package com.ims.service.impl.computerunit;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ims.dao.impl.computerunit.ComputerUnitDaoImpl;
import com.ims.entity.computerunit.ComputerUnitEntity;
import com.ims.service.computerunit.ComputerUnitService;

public class ComputerUnitServiceImpl implements ComputerUnitService {
	private ComputerUnitDaoImpl dao;

	public ComputerUnitDaoImpl getDao() {
		return dao;
	}

	public void setDao(ComputerUnitDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public void insertNewUnit(HttpServletRequest request) throws SQLException { 
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<ComputerUnitEntity> compUnitList = (List<ComputerUnitEntity>) session.getAttribute("compUnitList");
		if (compUnitList == null) {
			compUnitList = new ArrayList<>();
		}
		
		for (ComputerUnitEntity adu : compUnitList) {
			Map<String, Object> params = new HashMap<>();
			params.put("unitName", adu.getUnitName());
			params.put("tagNumber", adu.getTagNumber());
			params.put("ipAddress", adu.getIpAddress());
			params.put("type", adu.getType());
			params.put("acquiredDate", adu.getAcquiredDate());
			params.put("description", adu.getDescription());
			params.put("serialNo", adu.getSerialNo());
			params.put("brand", adu.getBrand());
			params.put("model", adu.getModel());
			params.put("color", adu.getColor());
			params.put("remarks", adu.getRemarks());
			params.put("userId", adu.getUserId());
			params.put("lastUpdate", adu.getLastUpdate());
			this.getDao().insertNewUnit(params);
		}
		System.out.println("successfully inserted");
	}
	@Override
	public void addUnitToSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//Integer unitNo = Integer.parseInt(request.getParameter("unitNo"));
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
		System.out.println(lastUpdate);
		@SuppressWarnings("unchecked")
		List<ComputerUnitEntity> compUnitList = (List<ComputerUnitEntity>) session.getAttribute("compUnitList");
		if (compUnitList == null) {
			compUnitList = new ArrayList<>();
		}

		ComputerUnitEntity a = new ComputerUnitEntity();
		//a.setUnitNo(unitNo);
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
		
		for (ComputerUnitEntity adu : compUnitList) {
			System.out.println(adu.getUnitNo() + " " + adu.getUnitName() +  " " + adu.getTagNumber() + " " 
							  + adu.getIpAddress() + " " + adu.getType() + " " + adu.getAcquiredDate() + " " 
							  + adu.getDescription() + " " + adu.getSerialNo() + " " + adu.getBrand() + " " 
							  + adu.getModel() + " " + adu.getColor() + " " + adu.getRemarks() + " " 
							  + adu.getUserId() + " " + adu.getLastUpdate());
		}
	}
	
	
	public String getCurrentDate() {
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss");
		return sdf.format(date);
	}

	@Override
	public void getUnit(HttpServletRequest request) throws SQLException {
		List<ComputerUnitEntity> dbRecordlist = this.getDao().getUnit();
		request.setAttribute("dbRecords", dbRecordlist);
	}

	@Override
	public void updateUnit(HttpServletRequest request) throws SQLException {
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
		List<ComputerUnitEntity> compUnitList = (List<ComputerUnitEntity>) session.getAttribute("compUnitList");
		if (compUnitList == null) {
			compUnitList = new ArrayList<>();
		}
		
	
		Map<String, Object> params = new HashMap<>();
		
		params.put("serialNo", serialNo);
		params.put("unitName", unitName);
		params.put("brand", brand);
		params.put("tagNumber", tagNumber);
		params.put("model", model);
		params.put("ipAddress", ipAddress);
		params.put("color", color);
		params.put("type", type);
		params.put("acquiredDate", acquiredDate);
		params.put("description", description);
		params.put("remarks", remarks);
		params.put("userId", userId);
		params.put("lastUpdate", lastUpdate);
		params.put("unitNo", unitNo);
		this.getDao().updateUnit(params);
		System.out.println("Successfully updated");
	}

	@Override
	public void deleteTagUnit(HttpServletRequest request) throws SQLException {
		Integer unitNo = Integer.parseInt(request.getParameter("unitNo"));
		this.getDao().deleteTagUnit(unitNo);
		System.out.println("Successfully insertedDeletetag");
		
	}

	@Override
	public void deleteUnit(HttpServletRequest request) throws SQLException {
		
		this.getDao().deleteUnit();
		System.out.println("Successfully Deleted");
	}	
}
