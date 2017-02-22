<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Computer Units Inventory Page</title>
<script type="text/javascript" src = "${pageContext.request.contextPath}/JS/prototype.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" type="text/css" />
</head>
<body>
<center>
	<div id="mainContents">
		<div id = "tableDiv" style = "width:1350px; border:1px solid">
			<div name = "rowName" class = "tableRow"> 
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">NO.</label>	
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">UNIT NAME</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">TAG NUMBER</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">IP ADDRESS</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">TYPE</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">BRAND/MODEL</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">SERIAL NUMBER</label>
				<label style = "width: 150px; font-size: 12px; 
				text-align: center; float: left">ACQUIRED DATE</label>
			</div>
			<div>
				<c:forEach var="unit" items="${dbRecords}">
					<div class="tableRow" name="rowName">
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitNo}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitName}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.tagNumber}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.ipAddress}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.type}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.brand} / ${unit.model}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.serialNo}</label>
						<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.acquiredDate}</label>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<br><br><br>
		
		<div>
			<table id = "fieldsTable">
				<tr>
					<td><label>UNIT NO.</label></td>
					<td><input type = "text" id = "txtUnitNo" disabled="disabled" value = ""/></td>
					<td><label>SERIAL NO.</label></td>
					<td><input type = "text" id = "txtSerialNo" /></td>
				</tr>
				<tr>
					<td><label>UNIT NAME</label></td>
					<td><input type = "text" id = "txtUnitName" /></td>
					<td><label>BRAND</label></td>
					<td> <input type = "text" id = "txtBrand" /></td>
				</tr>
				<tr>
					<td><label>TAG NUMBER</label></td>
					<td> <input type = "text" id = "txtTagNumber" /></td>
					<td><label>MODEL</label></td>
					<td> <input type = "text" id = "txtModel" /></td>
				</tr>
				<tr>
					<td><label>IP ADDRESS</label></td>
					<td> <input type = "text" id = "txtIpAddress" /></td>
					<td><label>COLOR</label></td>
					<td> <input type = "text" id = "txtColor" /></td>
				</tr>
				<tr>
					<td><label>TYPE</label></td>
					<td>
						<select id = "selType">
							<option value = ""></option>
							<option value = "1">Desktop</option>
							<option value = "2">Laptop</option>
						</select>
					</td>
					<td><label>USER ID</label></td>
					<td> <input type = "text" id = "txtUserId" /></td>
				</tr>
				<tr>
					<td><label>ACQUIRED DATE</label></td>
					<td> <input type = "text" id = "txtAcquiredDate" /></td>
					<td><label>LAST UPDATE</label></td>
					<td><input type = "text" id = "txtLastUpdate" disabled="disabled"/></td>
				</tr>
				<tr>
					<td><label>DESCRIPTION</label></td>
					<td><input type = "text" id = "txtDescription" /></td>
					<td><label>REMARKS</label></td>
					<td><input type = "text" id = "txtRemarks" /></td>
				</tr>
			</table>
		</div>
		
		<div>
			<table>
				<tr>
					<td><input type = "button" id = "btnAdd" value = "Add" /></td>
					<td><input type = "button" id = "btnDelete" value = "Delete" disabled="disabled"></td>
				</tr>
				<tr>
					<td><input type = "button" id = "btnUnitAssignment" value = "Unit Assignment" disabled="disabled" /></td>
					<td><input type = "button" id = "btnOperatingSystemAndSoftwaresInstalled" value = "Operating System and Softwares Installed" disabled="disabled" /></td>
					<td><input type = "button" id = "btnPeripherals" value = "Peripherals" disabled="disabled"></td>
					<td><input type = "button" id = "btnSave" value = "Save" /></td>
					<td><input type = "button" id = "btnCancel" value = "Cancel"></td>	
				</tr>
			</table>
		</div>
	</div>
</center>
</body>
<script type="text/JavaScript">
	  $('btnAdd').observe("click", function() {
		addUnit();
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "get",
			parameters : {
				action : "addUnit",
				//unitNo : $F('txtUnitNo'),
				unitNo : id,
				serialNo : $F('txtSerialNo'),
				unitName : $F('txtUnitName'),
				brand : $F('txtBrand'),
				tagNumber : $F('txtTagNumber'),
				model : $F('txtModel'),
				ipAddress : $F('txtIpAddress'),
				color : $F('txtColor'),
				type : $F('selType'),
				userId : $F('txtUserId'),
				acquiredDate : $F('txtAcquiredDate'),
				lastUpdate : $F('txtLastUpdate'),
				description : $F('txtDescription'),
				remarks : $F('txtRemarks')
			},
			/* onComplete : function(response) {
				$("mainContent").update(response.responseText);
			} */
		}); 
	});
	
	$('btnSave').observe("click", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "get",
			parameters : {
				action : "saveUnit",
				unitNo : id,
				serialNo : $F('txtSerialNo'),
				unitName : $F('txtUnitName'),
				brand : $F('txtBrand'),
				tagNumber : $F('txtTagNumber'),
				model : $F('txtModel'),
				ipAddress : $F('txtIpAddress'),
				color : $F('txtColor'),
				type : $F('selType'),
				userId : $F('txtUserId'),
				acquiredDate : $F('txtAcquiredDate'),
				lastUpdate : $F('txtLastUpdate'),
				description : $F('txtDescription'),
				remarks : $F('txtRemarks')
			},
		});
	})
	$('btnCancel').observe("click", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "get",
			parameters : {
				action : "cancelUnit"
			},
		});
	})
	  
	
	var id = 0;
	function addUnit() {
		var addUnit = {};
		addUnit.unitNo = id;
		addUnit.serialNo = $F('txtSerialNo');
		addUnit.unitName = $F('txtUnitName');
		addUnit.brand = $F('txtBrand');
	 	addUnit.tagNumber = $F('txtTagNumber');
		addUnit.model = $F('txtModel');
		addUnit.ipAddress = $F('txtIpAddress');
		addUnit.type = $F('selType');
		addUnit.acquiredDate = $F('txtAcquiredDate');
		
		addUnit.color = $F('txtColor');
		addUnit.userId = $F('txtUserId');
		addUnit.lastUpdate = $F('txtLastUpdate');
		addUnit.description = $F('txtDescription');
		addUnit.remarks = $F('txtRemarks'); 
		
		var content = getContent(addUnit);
		var addTable = $('tableDiv');
		var newDiv = new Element('div');
		newDiv.setAttribute("id", "rowId" + id);
		newDiv.setAttribute("name", "rowName");
		newDiv.addClassName('tableRow');
		newDiv.update(content);
		addTable.insert({
			bottom : newDiv
		}); 
		
		newDiv.observe("mouseover", function() {
			newDiv.addClassName("lightblue");
		});
		newDiv.observe("mouseout", function() {
			newDiv.removeClassName("lightblue");
		});

		newDiv.observe("click", function() {
			onClickFunc(newDiv);
		});
		
		id = id + 1;
	} 
	
	function getContent(obj) {
		var temp = id;
		var brandModel = obj.brand + " / " + obj.model
		var content = 
		'<input type = "hidden" value = "'+id+'" />' +	
		'<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ id + "</label>" 
		+'<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.unitName + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.tagNumber + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.ipAddress + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.type + "</label>" 
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ brandModel + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.serialNo + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.acquiredDate + "</label>"
	
		return content;
	} 
	var currentRowNo = -1;
	function onClickFunc(row) {
		$$("div#tableDiv div[name = 'rowName']").each(function(r) {
			if (row.id != r.id) {
				r.removeClassName("selectedRow")
			}
		});
		row.toggleClassName("selectedRow");
		
		if(row.hasClassName("selectedRow")){
			new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
				method : "get",
				parameters : {
					action : "updateUnit"
				},
				onComplete : function(response) {
					$('mainContents').update(response.responseText);
				}
			});
		}
	
	
		currentRowNo = row.down("input", 0).value;
		
	}
	
	document.observe("dom:loaded", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "get",
			parameters : {
				action : "loaded"
			},
			onComplete : function(response) {
				$('mainContents').update(response.responseText);
			}
		});
	})
	
</script>
</html>