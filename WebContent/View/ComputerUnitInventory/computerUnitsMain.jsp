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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/computerUnitInvetoryStyle.css" type="text/css" />
</head>
<body>
<center>
	<div id="mainContents">
		<div id = "tableDiv" style = "width:1350px; border:1px solid">
			<div name = "rowNameHeading" class = "tableRow"> 
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
			<c:forEach var="unit" items="${dbRecords}">
					<c:set var="count" value="${count + 1}" scope="page"/>
					<div id = "rowId${count}" class="tableRow" name="rowName">
					<!-- 0 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitNo}</label>
					<!-- 1 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitName}</label>
					<!-- 2 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.tagNumber}</label>
					<!-- 3 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.ipAddress}</label>
					<!-- 4 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.type}</label>
					<!-- 5 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.brand} / ${unit.model}</label>
					<!-- 6 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.serialNo}</label>
					<!-- 7 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.acquiredDate}</label>
					<!-- 8 -->	<label style="display:none;">${unit.color}</label>
					<!-- 9 -->	<label style="display:none;">${unit.description}</label>
					<!-- 10 -->	<label style="display:none;">${unit.remarks}</label>
					<!-- 11 -->	<label style="display:none;">${unit.userId}</label>
					<!-- 12 -->	<label style="display:none;">${unit.lastUpdate}</label>
					</div>
			</c:forEach>
			
			<c:forEach var="unit" items="${compUnitList}">
					<c:set var="count" value="${count + 1}" scope="page"/>
					<div id = "rowId${count}" class="tableRow" name="rowName">
					<!-- 0 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitNo}</label>
					<!-- 1 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.unitName}</label>
					<!-- 2 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.tagNumber}</label>
					<!-- 3 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.ipAddress}</label>
					<!-- 4 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.type}</label>
					<!-- 5 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.brand} / ${unit.model}</label>
					<!-- 6 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.serialNo}</label>
					<!-- 7 -->	<label style="width: 150px;font-size: 12px; text-align: center; float:left; " >${unit.acquiredDate}</label>
					<!-- 8 -->	<label style="display:none;">${unit.color}</label>
					<!-- 9 -->	<label style="display:none;">${unit.description}</label>
					<!-- 10 -->	<label style="display:none;">${unit.remarks}</label>
					<!-- 11 -->	<label style="display:none;">${unit.userId}</label>
					<!-- 12 -->	<label style="display:none;">${unit.lastUpdate}</label>
					</div>
			</c:forEach>
			
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
							<option value = "1">Desktop</option>
							<option value = "2">Laptop</option>
						</select>
					</td>
					<td><label>USER ID</label></td>
					<td> <input type = "text" id = "txtUserId" disabled="disabled"/></td>
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
					<td><input type = "button" id = "btnDelete" value = "Delete" disabled="disabled" ></td>
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
	var unitNo;
	$$("div#tableDiv div[name = 'rowName']").each(function (r){
		r.observe("mouseover", function () {
			r.addClassName("lightblue");
		});
	});
	$$("div#tableDiv div[name = 'rowName']").each(function (r){
		r.observe("mouseout", function () {
			r.removeClassName("lightblue");
		});
	});
 	$$("div#tableDiv div[name = 'rowName']").each(function (r){
 		r.observe("click", function () {
				onClickFunc(r);
		});
	});
 	var emptyField;
 	function emptyFieldValidation(obj){
 		
 		if(obj.unitName == "" || obj.tagNumber == "" || obj.ipAddress == "" || obj.description == ""
 				|| obj.serialNo == "" || obj.brand == ""){
 			emptyField = true;
 		} else {
 			emptyField = false;
 		}
 		return emptyField;
 	}
  
	$('btnAdd').observe("click", function() {
		if($F("btnAdd") == "Add"){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "post",
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
				userId : tempUserId,
				acquiredDate : $F('txtAcquiredDate'),
				lastUpdate : $F('txtLastUpdate'),
				description : $F('txtDescription'),
				remarks : $F('txtRemarks')
			},
			 onComplete : function(response) {
				//$("mainContent").update(response.responseText);
				addUnit();
				clearFields();
			} 
			
		}); 
		} else {
			
			new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
				method : "post",
				parameters : {
					action : "updateUnit",
					unitNo : unitNo,
					userId : tempUserId,
					lastUpdate : $F('txtLastUpdate'),
					
					serialNo : $F('txtSerialNo'),
					unitName : $F('txtUnitName'),
					brand : $F('txtBrand'),
					tagNumber : $F('txtTagNumber'),
					model : $F('txtModel'),
					ipAddress : $F('txtIpAddress'),
					color : $F('txtColor'),
					type : $F('selType'),
					acquiredDate : $F('txtAcquiredDate'),
					description : $F('txtDescription'),
					remarks : $F('txtRemarks')
				},
				onComplete : function(response) {
					$("mainContents").update(response.responseText);
				} 
			});
		}
	}); 
	
	$('btnSave').observe("click", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "post",
			parameters : {
				action : "saveUnit",
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			} 
		});	 
	}) 
	
	$('btnCancel').observe("click", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "post",
			parameters : {
				action : "cancelUnit"
			},
			 onComplete : function(response) {
				$("mainContents").update(response.responseText);
			} 
		});
	}) 
	  
	
	var id = 0;
	var tempUserId = "Zion";
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
		addUnit.userId = tempUserId
		addUnit.lastUpdate = $F('txtLastUpdate');
		addUnit.description = $F('txtDescription');
		addUnit.remarks = $F('txtRemarks'); 
		var emptyField = emptyFieldValidation(addUnit);
		
		if(emptyField){
			alert('Please fill in the blanks.')
		} else {
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
		}	
		newDiv.observe("mouseover", function() {
			newDiv.addClassName("lightblue");
		});
		newDiv.observe("mouseout", function() {
			newDiv.removeClassName("lightblue");
		}); 
		
		/* newDiv.observe("click", function() {
			onClickFunc(newDiv);
		}); */    
		id = id + 1;	
	}
	
	function getContent(obj) {
		var temp = id;
		var brandModel = obj.brand + "/" + obj.model
		var type;
		
		if(obj.type == '1'){
			type = 'desktop';
		} else {
			type = 'laptop';
		}
		
		if(obj.model == "") {
			brandModel = obj.brand;
		} else {
			brandModel = obj.brand + "/" + obj.model;
		}
		
		var content = 
		'<input type = "hidden" value = "'+id+'" />' +	
		'<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ "---" + "</label>"  
		+'<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.unitName + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.tagNumber + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ obj.ipAddress + "</label>"
		+ '<label style = "width: 150px; font-size: 12px; text-align: center; float: left;">'
		+ type + "</label>" 
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
			unitNo = row.down("label", 0).innerHTML;
		}); 
		row.toggleClassName("selectedRow");
		
		if(row.hasClassName("selectedRow")){
			$("btnAdd").value = "Update";
			$('btnDelete').removeAttribute("disabled");
			$('btnUnitAssignment').removeAttribute("disabled");
			$('btnOperatingSystemAndSoftwaresInstalled').removeAttribute("disabled");
			$('btnPeripherals').removeAttribute("disabled"); 	
		} else {
			
			$("btnAdd").value = "Add"
			$('btnDelete').setAttribute("disabled", "disabled");
			$('btnUnitAssignment').setAttribute("disabled", "disabled");
			$('btnOperatingSystemAndSoftwaresInstalled').setAttribute("disabled", "disabled");
			$('btnPeripherals').setAttribute("disabled", "disabled"); 
			
		}
		
		var temp = row.down("label",5).innerHTML;
		var brandModel = temp.split("/")
		var brand;
		var model;
		for(var i = 0; i < brandModel.length; i++){
			if(i == 0){
				brand = brandModel[i];
			} else {
				model = brandModel[i];
			}
		}
		var temp = row.down("label",4).innerHTML;
		var type;
		if(temp == "desktop"){
			type = 1;
		} else {
			type = 2;
		}
		
		$('txtUnitNo').value = row.down("label", 0).innerHTML;
		$('txtUnitName').value = row.down("label",1).innerHTML;
		$('txtTagNumber').value = row.down("label",2).innerHTML;
		$('txtIpAddress').value = row.down("label",3).innerHTML;
		$('selType').value = type;
		$('txtBrand').value = brand;
		$('txtModel').value = model;
		$('txtSerialNo').value = row.down("label",6).innerHTML;
		$('txtAcquiredDate').value = row.down("label",7).innerHTML;
		$('txtColor').value = row.down("label",8).innerHTML;
		$('txtUserId').value = row.down("label",11).innerHTML;
		$('txtLastUpdate').value = row.down("label",12).innerHTML;
		$('txtDescription').value = row.down("label",9).innerHTML;
		$('txtRemarks').value = row.down("label",10).innerHTML;
		 			
		currentRowNo = row.down("input", 0).value;
		
	} 
	document.observe("dom:loaded", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "post",
			parameters : {
				action : "loaded"
			},
			onComplete : function(response) {
				$('mainContents').update(response.responseText);
			}
		});
	}) 
	
	$('btnDelete').observe("click", function(){
		new Ajax.Request("${pageContext.request.contextPath}/ComputerUnitsInventory", {
			method : "post",
			parameters : {
				action : "deleteTagUnit",
				unitNo : unitNo
			},
			onComplete : function(response) {
				//$("mainContents").update(response.responseText);
			} 
		});
	});
	
	function clearFields(){
		$('txtUnitNo').value = ""
		$('txtUnitName').value = ""
		$('txtTagNumber').value = ""
		$('txtIpAddress').value = ""
		$('selType').value = ""
		$('txtBrand').value = ""
		$('txtModel').value = ""
		$('txtSerialNo').value = ""
		$('txtAcquiredDate').value = ""
		$('txtColor').value = ""
		$('txtUserId').value = ""
		$('txtLastUpdate').value = ""
		$('txtDescription').value = ""
		$('txtRemarks').value = ""
	} 
	
	
</script>
</html>